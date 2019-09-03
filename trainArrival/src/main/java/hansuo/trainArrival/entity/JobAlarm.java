package hansuo.trainArrival.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class JobAlarm implements Serializable {

	private static final long serialVersionUID = -1455741964288049676L;

	private Integer id;

	/* 关联调度作业表id */
	private Integer jobId;

	/* 报警时间 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") // 页面展示格式
	private Date alarmTime;

	/*
	 * 报警类型 1列检作业未接收报警，2商检作业未接收报警， 3车号作业未接收报警，4防溜作业未接收报警,5列尾作业未接收报警
	 */
	private Integer alarmType;

	/* 报警状态 :0未处理，1已处理 */
	private Integer alarmStatus;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getJobId() {
		return jobId;
	}

	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}

	public Date getAlarmTime() {
		return alarmTime;
	}

	public void setAlarmTime(Date alarmTime) {
		this.alarmTime = alarmTime;
	}

	public Integer getAlarmType() {
		return alarmType;
	}

	public void setAlarmType(Integer alarmType) {
		this.alarmType = alarmType;
	}

	public Integer getAlarmStatus() {
		return alarmStatus;
	}

	public void setAlarmStatus(Integer alarmStatus) {
		this.alarmStatus = alarmStatus;
	}

}
