package hansuo.trainArrival.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import hansuo.trainArrival.common.ScheduleJobCache;
import hansuo.trainArrival.common.ScheduleJobCache.JobInfo;
import hansuo.trainArrival.entity.AntiTool;
import hansuo.trainArrival.entity.JobFeedback;
import hansuo.trainArrival.entity.ScheduleJob;
import hansuo.trainArrival.entity.ScheduleJobEx;
import hansuo.trainArrival.entity.WebUser;
import hansuo.trainArrival.interceptor.WebSecurityConfig;
import hansuo.trainArrival.service.ScheduleJobService;

@Controller
@RequestMapping("/scheduleJob")
public class ScheduleJobController {

	@Autowired
	private ScheduleJobService scheduleJobService;

	@RequestMapping("/toSearch")
	public String toSearch() {
		return "scheduleJob/scheduleJob_list";
	}

	@RequestMapping("/toSearchChehao")
	public String toSearchChehao() {
		return "scheduleJob/scheduleJob_list_chehao";
	}

	@RequestMapping("/toSearchHuojian")
	public String toSearchHuojian() {
		return "scheduleJob/scheduleJob_list_huojian";
	}

	@RequestMapping("/toSearchLiejian")
	public String toSearchLiejian() {
		return "scheduleJob/scheduleJob_list_liejian";
	}

	@RequestMapping("/toSearchFangliu")
	public String toSearchFangliu() {
		return "scheduleJob/scheduleJob_list_fangliu";
	}

	@RequestMapping("/addFangliu")
	public ModelAndView addFangliu(Integer isArrive, Integer jobId, String track, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			WebUser user = (WebUser) session.getAttribute(WebSecurityConfig.SESSION_KEY);
			//Map<Integer, String> toolMap = scheduleJobService.getAntiTools(jobId);
			//mv.addObject("toolMap", toolMap);
			mv.addObject("isArrive", isArrive);
			mv.addObject("name", user.getAliases());
			mv.addObject("track", track);
			mv.addObject("jobId", jobId);
			mv.setViewName("scheduleJob/scheduleJob_fangliu_add");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("/getTools")
	@ResponseBody
	public List<AntiTool> getTools(int jobId, int type) {
		return scheduleJobService.getAntiTools(jobId, type);
	}

	@RequestMapping("/addLiewei")
	public String addLiewei() {
		return "scheduleJob/scheduleJob_liewei_add";
	}

	@RequestMapping("/toSearchLiewei")
	public String toSearchLiewei() {
		return "scheduleJob/scheduleJob_list_liewei";
	}

	@RequestMapping("/search")
	@ResponseBody
	public Map<String, Object> searchJson(ScheduleJob job, Integer page) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<ScheduleJobEx> jobs = new ArrayList<ScheduleJobEx>();
		try {
			Page<ScheduleJobEx> pageInfo = PageHelper.startPage(page, hansuo.trainArrival.page.Page.PAGE_SIZE);
			jobs = scheduleJobService.searchByConditions(job);
			result.put("count", pageInfo.getTotal());
			result.put("code", 0);
			result.put("message", "success");
			result.put("data", jobs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/exportExcel")
	public void exportExcel(ScheduleJob job, HttpServletResponse response) {
		try {
			scheduleJobService.exportExcel(job, "调度作业", "调度作业", ScheduleJobEx.class, null, true, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/searchByPost")
	@ResponseBody
	public Map<String, Object> searchByPost(ScheduleJob job, Integer page, HttpSession session, String statusParam) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<ScheduleJobEx> jobs = new ArrayList<ScheduleJobEx>();
		try {
			WebUser user = (WebUser) session.getAttribute(WebSecurityConfig.SESSION_KEY);
			Page<ScheduleJobEx> pageInfo = PageHelper.startPage(page, hansuo.trainArrival.page.Page.PAGE_SIZE);
			jobs = scheduleJobService.searchByPost(user.getPostId(), user.getUserName(), statusParam);
			if (user.getPostId() == ScheduleJobEx.CENTRAL) {
				jobs.stream().forEach(item -> {
					item.setCanModify(0);
				});
			}
			result.put("count", pageInfo.getTotal());
			result.put("code", 0);
			result.put("message", "success");
			result.put("data", jobs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/searchNewJob")
	@ResponseBody
	public Map<String, Object> searchNewJob(ScheduleJob job, HttpSession session, String statusParam) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<ScheduleJobEx> jobs = new ArrayList<ScheduleJobEx>();
		try {
			WebUser user = (WebUser) session.getAttribute(WebSecurityConfig.SESSION_KEY);
			if (null == statusParam) {
				switch (user.getPostId()) {
				case 2:
					statusParam = "chehaoStatus";
					break;
				case 3:
					statusParam = "huojianStatus";
					break;
				case 4:
					statusParam = "liejianStatus";
					break;
				case 5:
					statusParam = "fangliuStatus";
					break;
				case 6:
					statusParam = "lieweiStatus";
					break;
				default:
					result.put("count", 0);
					return result;
				}
			}
			jobs = scheduleJobService.searchNewByPost(user.getPostId(), user.getUserName(), statusParam);
			result.put("count", jobs.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/toAdd")
	public ModelAndView toAdd(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			WebUser user = (WebUser) session.getAttribute(WebSecurityConfig.SESSION_KEY);
			Map<Integer, String> trackMap = scheduleJobService.getTracks(1, user.getDeptId());
			// Map<Integer, String> trainMap = scheduleJobService.getTrains(1);
			mv.addObject("trackMap", trackMap);
			// mv.addObject("trainMap", trainMap);
			mv.setViewName("scheduleJob/scheduleJob_add");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("/add")
	@ResponseBody
	public int add(ScheduleJob job) {
		int result = 0;
		try {
			// 设置工作状态为未完成
			// job.setJobStatus(2);
			initDate(job, new Date());
			result = scheduleJobService.add(job);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/detail")
	public ModelAndView detail(int id) {
		ModelAndView mv = new ModelAndView();
		try {
			// TODO:test
			// webSocket.sendInfo("admin", "hello");
			ScheduleJobEx bean = scheduleJobService.getById(id);
			mv.addObject("job", bean);
			mv.setViewName("scheduleJob/scheduleJob_detail");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("/updateStatus")
	@ResponseBody
	public int update(ScheduleJob job, JobFeedback jobFeedback, HttpSession session) {
		int result = 0;
		try {
			WebUser user = (WebUser) session.getAttribute(WebSecurityConfig.SESSION_KEY);
			jobFeedback.setPostId(user.getPostId());
			// jobFeedback.setAntiRunningMan(user.getAliases());
			// job.setAntiRunningMan(user.getAliases());
			// TODO:生成反馈信息
			result = scheduleJobService.updateStatus(job, jobFeedback);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/complete")
	@ResponseBody
	public boolean complete(int jobId) {
		boolean result = false;
		try {
			result = scheduleJobService.complete(jobId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/confirm")
	@ResponseBody
	public int confirm(int jobId) {
		int result = 0;
		try {
			result = scheduleJobService.confirm(jobId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/toInfo")
	public ModelAndView toInfo(int jobId, int trackId) {
		ModelAndView result = new ModelAndView();
		try {
			ScheduleJob job = scheduleJobService.getById(jobId);
			result.addObject("jobId", jobId);
			result.addObject("trackId", trackId);
			result.addObject("job", job);
			result.setViewName("scheduleJob/scheduleJob_info");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/sendInfo")
	@ResponseBody
	public int sendInfo(ScheduleJob job) {
		return scheduleJobService.sendInfo(job);
	}

	@RequestMapping("/alarmControl")
	@ResponseBody
	public Map<String, Object> alarmControl(Integer id, HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		int count = 0;
		WebUser user = (WebUser) session.getAttribute(WebSecurityConfig.SESSION_KEY);
		if (user.getPostId() == 1 || user.getPostId() == 7) {
			// 内勤助理，优先检查超时未接收任务
			JobInfo job = ScheduleJobCache.getTimeoutJob();
			// 内勤助理，任务完成提醒
			if (null != job) {
				if (null != job.getLieweiStatus() && job.getLieweiStatus() == 0) {
					job.setPostName("列尾");
					result.put("message", job.genMessage());
					return result;
				}
				if (null != job.getLiejianStatus() && job.getLiejianStatus() == 0) {
					job.setPostName("列检");
					result.put("message", job.genMessage());
					return result;
				}
				if (null != job.getHuojianStatus() && job.getHuojianStatus() == 0) {
					job.setPostName("货检");
					result.put("message", job.genMessage());
					return result;
				}
				if (null != job.getFangliuStatus() && job.getFangliuStatus() == 0) {
					job.setPostName("防溜");
					result.put("message", job.genMessage());
					return result;
				}
				if (null != job.getChehaoStatus() && job.getChehaoStatus() == 0) {
					job.setPostName("车号");
					result.put("message", job.genMessage());
					return result;
				}
			}
		}
		return result;
	}

	private void initDate(ScheduleJob job, Date informDate) {
		// 通知列检作业时分，通知商检作业时分，通知车号作业时分，通知撤除防溜/防溜作业时分，通知列尾作业时分字段
		if (job.getChehaoStatus() != null) {
			job.setTrainNumTime(informDate);
		}
		if (job.getLiejianStatus() != null) {
			job.setTrainInspectTime(informDate);
		}
		if (job.getHuojianStatus() != null) {
			job.setGoodsInspectTime(informDate);
		}
		if (job.getFangliuStatus() != null) {

			job.setAntiRunningTime(informDate);
		}
		if (job.getLieweiStatus() != null) {
			job.setTrainTailTime(informDate);
		}
	}
}
