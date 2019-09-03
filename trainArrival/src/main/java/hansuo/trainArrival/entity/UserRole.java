package hansuo.trainArrival.entity;

import java.io.Serializable;

/**
 * 用户实体类
 * 
 * @author seed
 *
 */
public class UserRole implements Serializable {

	private static final long serialVersionUID = -4159313203120565175L;

	private Integer id;

	private String userName;

	/* 状态:0无效，1有效 */
	private Integer status;

	private String aliases;

	private Integer mid;

	private String menuName;

	private Integer parentMenuId;

	private Integer userId;

	private Integer roleId;

	public UserRole() {
		// 状态默认有效
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getAliases() {
		return aliases;
	}

	public void setAliases(String aliases) {
		this.aliases = aliases;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public Integer getParentMenuId() {
		return parentMenuId;
	}

	public void setParentMenuId(Integer parentMenuId) {
		this.parentMenuId = parentMenuId;
	}

}
