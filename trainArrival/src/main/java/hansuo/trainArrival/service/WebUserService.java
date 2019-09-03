package hansuo.trainArrival.service;

import java.util.List;

import hansuo.trainArrival.entity.UserRole;
import hansuo.trainArrival.entity.WebUser;

public interface WebUserService {

	WebUser getUser(String userName, String password);

	WebUser getById(int id);

	List<WebUser> searchByConditions(WebUser webUser);

	int add(WebUser webUser);

	int delete(WebUser webUser);

	int update(WebUser webUser);

	List<UserRole> getUserRoleById(int id);

}
