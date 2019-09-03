package hansuo.trainArrival.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import hansuo.trainArrival.entity.JobAlarm;
import hansuo.trainArrival.entity.JobAlarmEx;
import hansuo.trainArrival.entity.WebUser;
import hansuo.trainArrival.service.JobAlarmService;

@Controller
@RequestMapping("/jobAlarm")
public class JobAlarmController {

	@Autowired
	private JobAlarmService jobAlarmService;

	@RequestMapping("/toSearch")
	public String toSearch() {
		return "jobAlarm/jobAlarm_list";
	}

	@RequestMapping("/search")
	@ResponseBody
	public Map<String, Object> searchJson(JobAlarm alarm, Integer page) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<JobAlarmEx> alarms = new ArrayList<JobAlarmEx>();
		try {
			Page<WebUser> pageInfo = PageHelper.startPage(page, hansuo.trainArrival.page.Page.PAGE_SIZE);
			alarms = jobAlarmService.search(alarm);
			result.put("count", pageInfo.getTotal());
			result.put("code", 0);
			result.put("message", "success");
			result.put("data", alarms);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("message", "fail");
		}
		return result;
	}

	@RequestMapping("/getCount")
	@ResponseBody
	public int getCount() {
		int count = 0;
		try {
			count = jobAlarmService.getCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@RequestMapping("/detail")
	public String detail() {

		return "jobAlarm/jobAlarm_detail";
	}

}
