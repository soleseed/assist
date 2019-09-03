package hansuo.trainArrival.service;

import java.util.List;

import hansuo.trainArrival.entity.JobFeedback;
import hansuo.trainArrival.entity.JobFeedbackEx;

public interface JobFeedbackService {

	List<JobFeedbackEx> searchByConditions(JobFeedback jobFeedback);

	JobFeedbackEx getById(int id);

}
