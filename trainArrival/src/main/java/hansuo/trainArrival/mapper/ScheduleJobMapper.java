package hansuo.trainArrival.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import hansuo.trainArrival.entity.AntiTool;
import hansuo.trainArrival.entity.ScheduleJob;
import hansuo.trainArrival.entity.ScheduleJobEx;
import hansuo.trainArrival.mapper.sqlprovider.ScheduleJobSqlProvider;

public interface ScheduleJobMapper extends BaseMapper<ScheduleJob> {

	@SelectProvider(type = ScheduleJobSqlProvider.class, method = "searchByConditions")
	List<ScheduleJobEx> searchByConditions(ScheduleJob job);

	@SelectProvider(type = ScheduleJobSqlProvider.class, method = "searchByPost")
	List<ScheduleJobEx> searchByPost(@Param("postId") int postId, @Param("userName") String userName,
			@Param("statusParam") String statusParam);

	@SelectProvider(type = ScheduleJobSqlProvider.class, method = "searchNewByPost")
	List<ScheduleJobEx> searchNewByPost(@Param("postId") int postId, @Param("userName") String userName,
			@Param("statusParam") String statusParam);

	@Update("update SCHEDULE_JOB set jobStatus = #{jobStatus} where id = #{id}")
	int updateStatus(@Param("id") int id, @Param("jobStatus") int jobStatus);

	@SelectProvider(type = ScheduleJobSqlProvider.class, method = "getById")
	ScheduleJobEx getById(@Param("id") int id);

	@Select("select a.* from anti_tool a INNER JOIN b_track b on a.trackId = b.id INNER JOIN schedule_job c on b.id= c.trackId where c.id=#{jobId} and a.type=#{type}")
	List<AntiTool> getAntiTools(@Param("jobId") int jobId, @Param("type") int type);

}