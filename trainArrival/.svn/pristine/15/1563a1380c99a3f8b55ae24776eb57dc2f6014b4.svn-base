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

import hansuo.trainArrival.entity.JobFeedback;
import hansuo.trainArrival.entity.JobFeedbackEx;
import hansuo.trainArrival.entity.WebUser;
import hansuo.trainArrival.service.JobFeedbackService;

@Controller
@RequestMapping("/jobFeedback")
public class JobFeedbackController {

	@Autowired
	private JobFeedbackService jobFeedbackService;

	@RequestMapping("/toSearch")
	public String toSearch() {
		return "jobFeedback/jobFeedback_list";
	}

	@RequestMapping("/search")
	@ResponseBody
	public Map<String, Object> searchJson(JobFeedback jobFeedback, Integer page) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<JobFeedbackEx> jobs = new ArrayList<JobFeedbackEx>();
		try {
			Page<WebUser> pageInfo = PageHelper.startPage(page, hansuo.trainArrival.page.Page.PAGE_SIZE);
			jobs = jobFeedbackService.searchByConditions(jobFeedback);
			result.put("count", pageInfo.getTotal());
			result.put("code", 0);
			result.put("message", "success");
			result.put("data", jobs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/detail")
	public String detail() {

		return "jobFeedback/jobFeedback_detail";
	}

}
