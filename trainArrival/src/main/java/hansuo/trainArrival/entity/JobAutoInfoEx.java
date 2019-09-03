package hansuo.trainArrival.entity;

public class JobAutoInfoEx extends JobAutoInfo {

	private static final long serialVersionUID = -1384256752130105668L;

	private String trackName;

	private String trainNo;

	public String getTrackName() {
		return trackName;
	}

	public void setTrackName(String trackName) {
		this.trackName = trackName;
	}

	public String getTrainNo() {
		return trainNo;
	}

	public void setTrainNo(String trainNo) {
		this.trainNo = trainNo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
