package hansuo.trainArrival.service;

import java.util.List;

import hansuo.trainArrival.entity.JobAlarm;
import hansuo.trainArrival.entity.JobAlarmEx;

public interface JobAlarmService {

	int add(JobAlarm alarm);

	List<JobAlarmEx> search(JobAlarm alarm);

	JobAlarmEx getById(JobAlarm alarm);

	JobAlarmEx getByIdType(int id, int alarmType);

	int getCount();

}
