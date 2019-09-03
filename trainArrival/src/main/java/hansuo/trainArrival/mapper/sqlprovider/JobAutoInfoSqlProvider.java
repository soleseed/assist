package hansuo.trainArrival.mapper.sqlprovider;

import org.apache.ibatis.annotations.Param;

import hansuo.trainArrival.entity.JobAutoInfo;

public class JobAutoInfoSqlProvider extends BaseSqlProvider {

	public String searchByConditions(final JobAutoInfo info) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT a.*,c.trackName,b.trainNo FROM ");
		sql.append(" job_auto_info a");
		sql.append(" inner join schedule_job b");
		sql.append(" on a.jobId = b.id ");
		sql.append(" inner JOIN  b_track c");
		sql.append(" on b.trackId = c.id ");
		sql.append(" WHERE 1=1 ");
		// TODO:添加筛选条件
		// 添加排序
		sql.append(" ORDER BY A.jobAutoTime DESC");
		return sql.toString();
	}

	public String getById(@Param("id") int id) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT a.*,c.trackName,b.trainNo FROM ");
		sql.append(" job_auto_info a");
		sql.append(" inner join schedule_job b");
		sql.append(" on a.jobId = b.id ");
		sql.append(" inner JOIN  b_track c");
		sql.append(" on b.trackId = c.id ");
		sql.append(" WHERE 1=1 ");
		sql.append(" AND ID = #{id}");
		return sql.toString();
	}

}
