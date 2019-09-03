package hansuo.trainArrival.websocket;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AlarmMessage implements Serializable {

	private static final long serialVersionUID = 1888016648745391585L;

	private int alarmType;

	private String message;

	private int id;

	private String trainNumber;

	private String postName;

	private Date infoTime;

	private String type;

	public AlarmMessage(int alarmType, String message, int id) {
		this.alarmType = alarmType;
		this.message = message;
		this.id = id;
	}

	public String genMessage() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		if (this.infoTime != null) {
			this.message = "类型：" + this.type + ";车次:" + this.trainNumber + ";岗位:" + this.postName + ";下发时间:"
					+ sdf.format(this.infoTime);
		}
		StringBuilder sb = new StringBuilder();
		sb.append("{id:");
		sb.append(this.id);
		sb.append(",alarmType:");
		sb.append(this.alarmType);
		sb.append(",message:");
		sb.append("\"" + this.message + "\"");
		sb.append("}");
		return sb.toString();
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getAlarmType() {
		return alarmType;
	}

	public void setAlarmType(int alarmType) {
		this.alarmType = alarmType;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTrainNumber() {
		return trainNumber;
	}

	public void setTrainNumber(String trainNumber) {
		this.trainNumber = trainNumber;
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
