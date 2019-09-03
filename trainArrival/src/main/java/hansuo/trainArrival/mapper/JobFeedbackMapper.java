package hansuo.trainArrival.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

import hansuo.trainArrival.entity.JobFeedback;
import hansuo.trainArrival.entity.JobFeedbackEx;
import hansuo.trainArrival.mapper.sqlprovider.JobFeedbackSqlProvider;

public interface JobFeedbackMapper extends BaseMapper<JobFeedback> {

	@SelectProvider(type = JobFeedbackSqlProvider.class, method = "searchByConditions")
	List<JobFeedbackEx> searchByConditions(JobFeedback job);

	@SelectProvider(type = JobFeedbackSqlProvider.class, method = "getById")
	JobFeedbackEx getById(@Param("id") int id);

}
