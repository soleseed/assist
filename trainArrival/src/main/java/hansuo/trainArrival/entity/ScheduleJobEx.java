package hansuo.trainArrival.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;

/**
 * 调度作业表实体类
 * 
 * @author seed
 *
 */
public class ScheduleJobEx extends ScheduleJob {

	private static final long serialVersionUID = -6640387359712628612L;

	// 安全指挥中心权限代号
	public static final int CENTRAL = 7;

	/* 作业用户 */
	private String userName;

	/* 股道名称 */
	@Excel(name = "股道", orderNum = "2", width = 15)
	private String trackName;

	/* 0:false; 1:true */
	private int canModify = 1;

	public int getCanModify() {
		return canModify;
	}

	public void setCanModify(int canModify) {
		this.canModify = canModify;
	}

	public String getTrackName() {
		return trackName;
	}

	public void setTrackName(String trackName) {
		this.trackName = trackName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}
