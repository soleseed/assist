package hansuo.trainArrival.common;

import java.io.IOException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

import hansuo.trainArrival.entity.ScheduleJob;
import hansuo.trainArrival.websocket.AlarmMessage;
import hansuo.trainArrival.websocket.WebSocket;

public class ScheduleJobCache {

	public static final ConcurrentHashMap<Integer, JobInfo> JOB_CACHE_MAP = new ConcurrentHashMap<>();

	public static final int STATUS_NEW = 0;

	public static final int STATUS_DOING = 1;

	public static final int STATUS_TIMEOUT = 2;

	public static final int STATUS_COMPLETE = 3;

	public static JobInfo get(Integer id) {
		return JOB_CACHE_MAP.get(id);
	}

	public static int countTimeoutJob() {
		int count = 0;
		for (Entry<Integer, JobInfo> entry : JOB_CACHE_MAP.entrySet()) {
			JobInfo job = entry.getValue();
			if (job.getStatus() == STATUS_TIMEOUT) {
				count++;
			}
		}
		return count;
	}

	public static JobInfo getTimeoutJob() {
		for (Entry<Integer, JobInfo> entry : JOB_CACHE_MAP.entrySet()) {
			JobInfo job = entry.getValue();
			if (job.getStatus() == STATUS_TIMEOUT) {
				return job;
			}
		}
		return null;
	}

	public static void put(ScheduleJob job, Integer status) {
		if (job == null || job.getId() == null) {
			return;
		}
		JobInfo tmpJob = JOB_CACHE_MAP.get(job.getId());
		if (tmpJob == null) {
			JobInfo jobInfo = new JobInfo();
			jobInfo.setId(job.getId());
			jobInfo.setChehaoStatus(job.getChehaoStatus());
			jobInfo.setFangliuStatus(job.getFangliuStatus());
			jobInfo.setHuojianStatus(job.getHuojianStatus());
			jobInfo.setLiejianStatus(job.getLiejianStatus());
			jobInfo.setLieweiStatus(job.getLieweiStatus());
			if (status != null) {
				jobInfo.setStatus(status);
			}
			JOB_CACHE_MAP.put(job.getId(), jobInfo);
		} else {
			if (null != job.getChehaoStatus()) {
				tmpJob.setChehaoStatus(job.getChehaoStatus());
			}
			if (null != job.getFangliuStatus()) {
				tmpJob.setFangliuStatus(job.getFangliuStatus());

			}
			if (null != job.getHuojianStatus()) {
				tmpJob.setHuojianStatus(job.getHuojianStatus());

			}
			if (null != job.getLiejianStatus()) {
				tmpJob.setLiejianStatus(job.getLiejianStatus());

			}
			if (null != job.getLieweiStatus()) {
				tmpJob.setLieweiStatus(job.getLieweiStatus());
			}
		}
	}

	public static JobInfo remove(int id) {
		return JOB_CACHE_MAP.remove(id);
	}

	public static void updateStatus(ScheduleJob job, Integer status, String postName) {
		JobInfo jobInfo = JOB_CACHE_MAP.get(job.getId());
		if (jobInfo == null) {
			return;
		}
		if (null != postName) {
			jobInfo.setPostName(postName);
		}
		if (null != job.getTrainNo()) {
			jobInfo.setTrainNo(job.getTrainNo());
		}

		if (null != job.getGoodsInspectTime()) {
			jobInfo.setInfoTime(job.getGoodsInspectTime());
		}
		if (null != job.getTrainNumTime()) {
			jobInfo.setInfoTime(job.getTrainNumTime());
		}
		if (null != job.getTrainTailTime()) {
			jobInfo.setInfoTime(job.getTrainTailTime());
		}
		if (null != job.getTrainInspectTime()) {
			jobInfo.setInfoTime(job.getTrainInspectTime());
		}
		if (null != job.getAntiRunningTime()) {
			jobInfo.setInfoTime(job.getAntiRunningTime());
		}
		if (job.getChehaoStatus() != null) {
			jobInfo.setChehaoStatus(job.getChehaoStatus());
		}
		if (job.getLiejianStatus() != null) {
			jobInfo.setLiejianStatus(job.getLiejianStatus());
		}
		if (job.getLieweiStatus() != null) {
			jobInfo.setLieweiStatus(job.getLieweiStatus());
		}
		if (job.getFangliuStatus() != null) {
			jobInfo.setFangliuStatus(job.getFangliuStatus());
		}
		if (job.getHuojianStatus() != null) {
			jobInfo.setHuojianStatus(job.getHuojianStatus());
		}

		if (checkStatusComplete(jobInfo)) {
			// 如果作业状态全部完成，将该作业从MAP中移除
			remove(jobInfo.getId());
		}
		if ((null == jobInfo.getChehaoStatus() || jobInfo.getChehaoStatus() >= 1)
				&& (null == jobInfo.getFangliuStatus() || jobInfo.getFangliuStatus() >= 1)
				&& (jobInfo.getHuojianStatus() == null || jobInfo.getHuojianStatus() >= 1)
				&& (null == jobInfo.getLiejianStatus() || jobInfo.getLiejianStatus() >= 1)
				&& (null == jobInfo.getLieweiStatus() || jobInfo.getLieweiStatus() >= 1)) {
			//已通知的岗位 作业已全部接收，更改状态
			jobInfo.setStatus(STATUS_DOING);
			//remove(jobInfo.getId());
		}

		try {
			List<Integer> postIds = Arrays.asList(Common.POST.get("内勤助理"), Common.POST.get("安全作业指挥中心"));
			AlarmMessage message = new AlarmMessage(4, "检查超时报警", 1);
			WebSocket.sendInfoByPost(postIds, null, message.genMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (null != status) {
			// 检查任务是否都已接收
			jobInfo.setStatus(status);
			if (status == STATUS_TIMEOUT) {
				jobInfo.setType("超时未接收");
			}
		}

	}

	public static void completeStatus(int jobId) {

		// 作业完成，将该作业从MAP中移除
		remove(jobId);

		try {
			List<Integer> postIds = Arrays.asList(Common.POST.get("内勤助理"), Common.POST.get("安全作业指挥中心"));
			AlarmMessage message = new AlarmMessage(4, "检查超时报警", 1);
			WebSocket.sendInfoByPost(postIds, null, message.genMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 修改状态
	 * 
	 * @param id         作业id
	 * @param status     作业状态
	 * @param statusName 作业需要修改的对应状态名车号，列尾，货检等等）
	 */
	public static void updateStatus(int id, int status, String statusName) {
		JobInfo job = JOB_CACHE_MAP.get(id);
		if (job == null) {
			return;
		}
		Class<?> jobClazz = JobInfo.class;
		Method method = null;
		try {
			method = jobClazz.getDeclaredMethod(statusName, Integer.class);
			method.invoke(job, status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (checkStatusComplete(job)) {
			// 如果作业状态全部完成，将该作业从MAP中移除
			remove(id);
		}
	}

	private static boolean checkStatusComplete(JobInfo job) {
		//所有岗点均已完成任务
		if ((null != job.getChehaoStatus() && job.getChehaoStatus() == 2)
				&& (job.getFangliuStatus() != null && job.getFangliuStatus() == 2)
				&& (job.getHuojianStatus() != null && job.getHuojianStatus() == 2)
				&& (job.getLiejianStatus() != null && job.getLiejianStatus() == 2)
				&& (job.getLieweiStatus() != null && job.getLieweiStatus() == 2)) {
			return true;
		}

		return false;
	}

	private static boolean checkStatusComplete(ScheduleJob job) {
		if (job.getChehaoStatus() == 2 && job.getFangliuStatus() == 2 && job.getHuojianStatus() == 2
				&& job.getHuojianStatus() == 2 && job.getLiejianStatus() == 2 && job.getLieweiStatus() == 2) {
			return true;
		}
		return false;
	}

	public static class JobInfo {
		private int id;
		// 车次
		private String trainNo;

		private Integer status;

		private String postName;

		private Date infoTime;

		private Integer chehaoStatus;

		private Integer liejianStatus;

		private Integer fangliuStatus;

		private Integer lieweiStatus;

		private Integer huojianStatus;

		private String type;

		public JobInfo() {
			this.chehaoStatus = 0;
			this.liejianStatus = 0;
			this.fangliuStatus = 0;
			this.lieweiStatus = 0;
			this.huojianStatus = 0;
		}

		public String genMessage() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String str = "";
			if (this.infoTime != null) {
				str += "类型：" + this.type + ";车次:" + this.trainNo + ";岗位:" + this.postName + ";下发时间:"
						+ sdf.format(this.infoTime);
			}
			StringBuilder sb = new StringBuilder();
			sb.append("{id:");
			sb.append(this.id);
			sb.append(",message:");
			sb.append("\"" + str + "\"");
			sb.append("}");
			return sb.toString();
		}

		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getTrainNo() {
			return trainNo;
		}

		public void setTrainNo(String trainNo) {
			this.trainNo = trainNo;
		}

		public Integer getChehaoStatus() {
			return chehaoStatus;
		}

		public void setChehaoStatus(Integer chehaoStatus) {
			this.chehaoStatus = chehaoStatus;
		}

		public Integer getLiejianStatus() {
			return liejianStatus;
		}

		public void setLiejianStatus(Integer liejianStatus) {
			this.liejianStatus = liejianStatus;
		}

		public Integer getFangliuStatus() {
			return fangliuStatus;
		}

		public void setFangliuStatus(Integer fangliuStatus) {
			this.fangliuStatus = fangliuStatus;
		}

		public Integer getLieweiStatus() {
			return lieweiStatus;
		}

		public void setLieweiStatus(Integer lieweiStatus) {
			this.lieweiStatus = lieweiStatus;
		}

		public Integer getHuojianStatus() {
			return huojianStatus;
		}

		public void setHuojianStatus(Integer huojianStatus) {
			this.huojianStatus = huojianStatus;
		}

		public Integer getStatus() {
			return status;
		}

		public void setStatus(Integer status) {
			this.status = status;
		}

		public String getPostName() {
			return postName;
		}

		public void setPostName(String postName) {
			this.postName = postName;
		}

		public Date getInfoTime() {
			return infoTime;
		}

		public void setInfoTime(Date infoTime) {
			this.infoTime = infoTime;
		}

	}
}
