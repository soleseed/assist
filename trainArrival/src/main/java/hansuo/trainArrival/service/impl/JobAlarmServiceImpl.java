package hansuo.trainArrival.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hansuo.trainArrival.entity.JobAlarm;
import hansuo.trainArrival.entity.JobAlarmEx;
import hansuo.trainArrival.mapper.JobAlarmMapper;
import hansuo.trainArrival.service.JobAlarmService;

@Service
public class JobAlarmServiceImpl implements JobAlarmService {

	@Autowired
	private JobAlarmMapper jobAlarmDao;

	@Override
	public int add(JobAlarm alarm) {
		return jobAlarmDao.insert(alarm);
	}

	@Override
	public List<JobAlarmEx> search(JobAlarm alarm) {
		return jobAlarmDao.searchByConditions(alarm);
	}

	@Override
	public JobAlarmEx getById(JobAlarm alarm) {
		return jobAlarmDao.getById(alarm.getId());
	}

	@Override
	public int getCount() {
		return jobAlarmDao.getCount();
	}

	@Override
	public JobAlarmEx getByIdType(int id, int alarmType) {
		return jobAlarmDao.getByIdType(id, alarmType);
	}
}
