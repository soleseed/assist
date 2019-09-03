package hansuo.trainArrival.mapper.sqlprovider;

import org.apache.ibatis.annotations.Param;

import hansuo.trainArrival.entity.JobAlarm;

public class JobAlarmSqlProvider extends BaseSqlProvider {

	/*
	 * select a.* from job_alarm a inner join schedule_job b on a.jobId = b.id inner
	 * join b_track c on b.trackId = c.id inner join b_train d on b.trainId = d.id
	 */
	public String searchByConditions(final JobAlarm alarm) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT a.*,c.trackName,b.trainNo FROM ");
		sql.append(" job_alarm a");
		sql.append(" inner join schedule_job b");
		sql.append(" on a.jobId = b.id ");
		sql.append(" inner JOIN  b_track c");
		sql.append(" on b.trackId = c.id ");
		sql.append(" WHERE 1=1 ");
		// TODO:添加筛选条件
		// 添加排序
		sql.append(" ORDER BY A.alarmTime DESC");
		return sql.toString();
	}

	public String getById(@Param("id") int id) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT a.*,c.trackName,b.trainNo FROM ");
		sql.append(" job_alarm a");
		sql.append(" inner join schedule_job b");
		sql.append(" on a.jobId = b.id ");
		sql.append(" inner JOIN  b_track c");
		sql.append(" on b.trackId = c.id ");
		sql.append(" WHERE 1=1 ");
		sql.append(" AND ID = #{id}");
		return sql.toString();
	}

}
