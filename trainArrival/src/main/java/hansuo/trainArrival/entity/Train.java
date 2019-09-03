package hansuo.trainArrival.entity;

import java.io.Serializable;

/**
 * 车次实体类
 * 
 * @author seed
 *
 */
public class Train implements Serializable {

	private static final long serialVersionUID = -1411374403952183504L;

	private int id;

	private String trainNumber;

	private int status;

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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
