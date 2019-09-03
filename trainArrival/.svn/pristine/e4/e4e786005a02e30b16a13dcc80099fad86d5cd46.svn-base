package hansuo.trainArrival.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class JobAutoInfo implements Serializable {

	private static final long serialVersionUID = -1455741964288049676L;

	private Integer id;

	/* 关联调度作业表id */
	private Integer jobId;

	/* 报警时间 */
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") // 页面展示格式
	private Date jobAutoTime;

	/*
	 * 1调度作业已全部完成
	 */
	private Integer jobAutoType;

	/* 报警状态 :0未查阅，1已查阅 */
	private Integer jobAutoStatus;

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

	public Date getJobAutoTime() {
		return jobAutoTime;
	}

	public void setJobAutoTime(Date jobAutoTime) {
		this.jobAutoTime = jobAutoTime;
	}

	public Integer getJobAutoType() {
		return jobAutoType;
	}

	public void setJobAutoType(Integer jobAutoType) {
		this.jobAutoType = jobAutoType;
	}

	public Integer getJobAutoStatus() {
		return jobAutoStatus;
	}

	public void setJobAutoStatus(Integer jobAutoStatus) {
		this.jobAutoStatus = jobAutoStatus;
	}

}
