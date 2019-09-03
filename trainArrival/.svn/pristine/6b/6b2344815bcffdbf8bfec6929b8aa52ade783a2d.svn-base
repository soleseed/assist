package hansuo.trainArrival.thread;

import java.util.Date;

import hansuo.trainArrival.common.ScheduleJobCache;
import hansuo.trainArrival.entity.JobAlarm;
import hansuo.trainArrival.entity.ScheduleJob;
import hansuo.trainArrival.entity.ScheduleJobEx;
import hansuo.trainArrival.service.JobAlarmService;
import hansuo.trainArrival.service.ScheduleJobService;
import hansuo.trainArrival.utils.SpringContextUtils;

public class AlarmInfoUtilThread implements Runnable {

	private ScheduleJob job;

	public AlarmInfoUtilThread(ScheduleJob job) {
		this.job = job;
	}

	/**
	 * 1.查看该作业是否已经被接收：如果已经被接收，则结束；如果没有被接收，则进入2; <br/>
	 * 2.作业30S内没有被接收，产生一条作业报警信息记录；
	 */
	@Override
	public void run() {
		// TODO Auto-generated method stub
		JobAlarmService alarmService = (JobAlarmService) SpringContextUtils.getBean("jobAlarmServiceImpl");
		ScheduleJobService jobService = (ScheduleJobService) SpringContextUtils.getBean("scheduleJobServiceImpl");
		JobAlarm alarm = null;
		ScheduleJobEx jobtmp = jobService.getById(job.getId());
		// TODO:websocket 超时未接收报警提醒语音（报警提示不可关闭，报警循环播放，直到报警解决）：有任务超时未接收
		//List<Integer> postIds = Arrays.asList(Common.POST.get("内勤助理"), Common.POST.get("安全作业指挥中心"));
		// 车号作业未被接收，产生作业报警信息
		if (null != jobtmp.getChehaoStatus() && jobtmp.getChehaoStatus() == 0) {
			if (null == alarmService.getByIdType(job.getId(), 3)) {
				alarm = new JobAlarm();
				alarm.setJobId(job.getId());
				alarm.setAlarmStatus(0);
				alarm.setAlarmTime(new Date());
				alarm.setAlarmType(3);
				alarmService.add(alarm);
			}

			//WebSocket.sendInfoByPost(postIds, null, message.genMessage());
			ScheduleJobCache.updateStatus(jobtmp, ScheduleJobCache.STATUS_TIMEOUT, "车号");
		}
		// 货检作业未被接收，产生作业报警信息
		if (null != jobtmp.getHuojianStatus() && jobtmp.getHuojianStatus() == 0) {
			if (null == alarmService.getByIdType(job.getId(), 2)) {
				alarm = new JobAlarm();
				alarm.setJobId(job.getId());
				alarm.setAlarmStatus(0);
				alarm.setAlarmTime(new Date());
				alarm.setAlarmType(2);
				alarmService.add(alarm);
			}

			//WebSocket.sendInfoByPost(postIds, null, message.genMessage());
			ScheduleJobCache.updateStatus(jobtmp, ScheduleJobCache.STATUS_TIMEOUT, "货检");
		}
		// 列检作业未被接收，产生作业报警信息
		if (null != jobtmp.getLiejianStatus() && jobtmp.getLiejianStatus() == 0) {

			if (null == alarmService.getByIdType(job.getId(), 1)) {
				alarm = new JobAlarm();
				alarm.setJobId(job.getId());
				alarm.setAlarmStatus(0);
				alarm.setAlarmTime(new Date());
				alarm.setAlarmType(1);
				alarmService.add(alarm);
			}

			//WebSocket.sendInfoByPost(postIds, null, message.genMessage());
			ScheduleJobCache.updateStatus(jobtmp, ScheduleJobCache.STATUS_TIMEOUT, "列检");
		}

		// 防溜作业未被接收，产生作业报警信息
		if (null != jobtmp.getFangliuStatus() && jobtmp.getFangliuStatus() == 0) {
			if (null == alarmService.getByIdType(job.getId(), 4)) {
				alarm = new JobAlarm();
				alarm.setJobId(job.getId());
				alarm.setAlarmStatus(0);
				alarm.setAlarmTime(new Date());
				alarm.setAlarmType(4);
				alarmService.add(alarm);
			}

			//WebSocket.sendInfoByPost(postIds, null, message.genMessage());
			ScheduleJobCache.updateStatus(jobtmp, ScheduleJobCache.STATUS_TIMEOUT, "防溜");
		}

		// 列尾作业未被接收，产生作业报警信息
		if (null != jobtmp.getLieweiStatus() && jobtmp.getLieweiStatus() == 0) {
			if (null == alarmService.getByIdType(job.getId(), 5)) {
				alarm = new JobAlarm();
				alarm.setJobId(job.getId());
				alarm.setAlarmStatus(0);
				alarm.setAlarmTime(new Date());
				alarm.setAlarmType(5);
				alarmService.add(alarm);
			}

			//WebSocket.sendInfoByPost(postIds, null, message.genMessage());
			ScheduleJobCache.updateStatus(jobtmp, ScheduleJobCache.STATUS_TIMEOUT, "列尾");
		}
	}

}
