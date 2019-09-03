package hansuo.trainArrival.thread;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import hansuo.trainArrival.common.Common;
import hansuo.trainArrival.common.ScheduleJobCache;
import hansuo.trainArrival.entity.JobAlarm;
import hansuo.trainArrival.entity.ScheduleJobEx;
import hansuo.trainArrival.service.JobAlarmService;
import hansuo.trainArrival.service.ScheduleJobService;
import hansuo.trainArrival.utils.SpringContextUtils;
import hansuo.trainArrival.websocket.AlarmMessage;

public class AlarmUtilThread implements Runnable {

	private int id;

	public AlarmUtilThread(int id) {
		this.id = id;
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
		// WebSocket webSocket =  (WebSocket) SpringContextUtils.getBean("webSocket");
		ScheduleJobEx job = jobService.getById(id);
		JobAlarm alarm = null;

		// TODO:websocket 超时未接收报警提醒语音（报警提示不可关闭，报警循环播放，直到报警解决）：有任务超时未接收
		List<Integer> postIds = Arrays.asList(Common.POST.get("内勤助理"), Common.POST.get("安全作业指挥中心"));
		AlarmMessage message = new AlarmMessage(1, "有任务超时未接收", job.getId());
		message.setTrainNumber(job.getTrainNo());
		message.setInfoTime(job.getTrainInspectTime());
		message.setType("超时未接收");
		// 车号作业未被接收，产生作业报警信息
		if (null != job.getChehaoStatus() && job.getChehaoStatus() == 0) {
			alarm = new JobAlarm();
			alarm.setJobId(id);
			alarm.setAlarmStatus(0);
			alarm.setAlarmTime(new Date());
			alarm.setAlarmType(3);
			alarmService.add(alarm);

			message.setPostName("车号");
			//WebSocket.sendInfoByPost(postIds, null, message.genMessage());
			ScheduleJobCache.updateStatus(job, ScheduleJobCache.STATUS_TIMEOUT, "车号");
		}
		// 货检作业未被接收，产生作业报警信息
		if (null != job.getHuojianStatus() && job.getHuojianStatus() == 0) {
			alarm = new JobAlarm();
			alarm.setJobId(id);
			alarm.setAlarmStatus(0);
			alarm.setAlarmTime(new Date());
			alarm.setAlarmType(2);
			alarmService.add(alarm);

			message.setPostName("货检");
			//WebSocket.sendInfoByPost(postIds, null, message.genMessage());
			ScheduleJobCache.updateStatus(job, ScheduleJobCache.STATUS_TIMEOUT, "货检");
		}
		// 列检作业未被接收，产生作业报警信息
		if (null != job.getLiejianStatus() && job.getLiejianStatus() == 0) {
			alarm = new JobAlarm();
			alarm.setJobId(id);
			alarm.setAlarmStatus(0);
			alarm.setAlarmTime(new Date());
			alarm.setAlarmType(1);
			alarmService.add(alarm);

			message.setPostName("列检");
			//WebSocket.sendInfoByPost(postIds, null, message.genMessage());
			ScheduleJobCache.updateStatus(job, ScheduleJobCache.STATUS_TIMEOUT, "列检");
		}

		// 防溜作业未被接收，产生作业报警信息
		if (null != job.getFangliuStatus() && job.getFangliuStatus() == 0) {
			alarm = new JobAlarm();
			alarm.setJobId(id);
			alarm.setAlarmStatus(0);
			alarm.setAlarmTime(new Date());
			alarm.setAlarmType(4);
			alarmService.add(alarm);

			message.setPostName("防溜");
			//WebSocket.sendInfoByPost(postIds, null, message.genMessage());
			ScheduleJobCache.updateStatus(job, ScheduleJobCache.STATUS_TIMEOUT, "防溜");
		}

		// 列尾作业未被接收，产生作业报警信息
		if (null != job.getLieweiStatus() && job.getLieweiStatus() == 0) {
			alarm = new JobAlarm();
			alarm.setJobId(id);
			alarm.setAlarmStatus(0);
			alarm.setAlarmTime(new Date());
			alarm.setAlarmType(5);
			alarmService.add(alarm);

			message.setPostName("列尾");
			//WebSocket.sendInfoByPost(postIds, null, message.genMessage());
			ScheduleJobCache.updateStatus(job, ScheduleJobCache.STATUS_TIMEOUT, "列尾");
		}
	}

}
