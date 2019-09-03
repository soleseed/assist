package hansuo.trainArrival.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

import hansuo.trainArrival.entity.JobAutoInfo;
import hansuo.trainArrival.entity.JobAutoInfoEx;
import hansuo.trainArrival.mapper.sqlprovider.JobAutoInfoSqlProvider;

public interface JobAutoInfoMapper extends BaseMapper<JobAutoInfo> {

	@SelectProvider(type = JobAutoInfoSqlProvider.class, method = "searchByConditions")
	List<JobAutoInfoEx> searchByConditions(JobAutoInfo info);

	@SelectProvider(type = JobAutoInfoSqlProvider.class, method = "getById")
	JobAutoInfoEx getById(@Param("id") int id);

}
