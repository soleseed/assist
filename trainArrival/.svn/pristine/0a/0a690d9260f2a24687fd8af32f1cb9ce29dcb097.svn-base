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

import hansuo.trainArrival.entity.JobAutoInfo;
import hansuo.trainArrival.entity.JobAutoInfoEx;
import hansuo.trainArrival.entity.WebUser;
import hansuo.trainArrival.service.JobAutoInfoService;

@Controller
@RequestMapping("/jobAutoInfo")
public class JobAutoInfoController {

	@Autowired
	private JobAutoInfoService jobAutoInfoService;

	@RequestMapping("/toSearch")
	public String toSearch() {
		return "jobAutoInfo/jobAutoInfo_list";
	}

	@RequestMapping("/search")
	@ResponseBody
	public Map<String, Object> searchJson(JobAutoInfo info, Integer page) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<JobAutoInfoEx> infos = new ArrayList<JobAutoInfoEx>();
		try {
			Page<WebUser> pageInfo = PageHelper.startPage(page, hansuo.trainArrival.page.Page.PAGE_SIZE);
			infos = jobAutoInfoService.search(info);
			result.put("count", pageInfo.getTotal());
			result.put("code", 0);
			result.put("message", "success");
			result.put("data", infos);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("message", "fail");
		}
		return result;
	}

	@RequestMapping("/detail")
	public String detail() {

		return "jobAutoInfo/jobAutoInfo_detail";
	}

}
