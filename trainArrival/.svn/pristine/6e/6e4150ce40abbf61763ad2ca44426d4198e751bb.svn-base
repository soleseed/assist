package hansuo.trainArrival.entity;

import java.io.Serializable;

/**
 * 用户实体类
 * 
 * @author seed
 *
 */
public class WebUser implements Serializable {

	private static final long serialVersionUID = -4159313203120565175L;

	private int id;

	private String userName;

	private String password;

	/* 关联场表id */
	private int deptId;

	/* 场名 */
	private String deptName;

	/* 关联岗位表id */
	private int postId;

	/* 岗位名称 */
	private String postName;

	/* 状态:0无效，1有效 */
	private int status;

	private String aliases;

	public WebUser() {
		// 状态默认有效
		this.status = 1;
	}

	public String getAliases() {
		return aliases;
	}

	public void setAliases(String aliases) {
		this.aliases = aliases;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
