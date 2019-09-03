package hansuo.trainArrival.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hansuo.trainArrival.entity.JobFeedback;
import hansuo.trainArrival.entity.JobFeedbackEx;
import hansuo.trainArrival.mapper.JobFeedbackMapper;

@Service
public class JobFeedbackServiceImpl implements hansuo.trainArrival.service.JobFeedbackService {

	@Autowired
	private JobFeedbackMapper jobFeedBackMapper;

	@Override
	public List<JobFeedbackEx> searchByConditions(JobFeedback jobFeedback) {
		return jobFeedBackMapper.searchByConditions(jobFeedback);
	}

	@Override
	public JobFeedbackEx getById(int id) {
		return jobFeedBackMapper.getById(id);
	}

}
