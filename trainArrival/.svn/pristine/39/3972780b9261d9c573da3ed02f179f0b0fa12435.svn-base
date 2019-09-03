package hansuo.trainArrival.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hansuo.trainArrival.entity.UserRole;
import hansuo.trainArrival.entity.WebUser;
import hansuo.trainArrival.mapper.UserRoleMapper;
import hansuo.trainArrival.mapper.WebUserMapper;
import hansuo.trainArrival.service.WebUserService;

@Service
public class WebUserServiceImpl implements WebUserService {

	@Autowired
	private WebUserMapper webUserDao;

	@Autowired
	private UserRoleMapper userRoleMapper;

	@Override
	public WebUser getUser(String userName, String password) {
		return webUserDao.search(userName, password);
	}

	@Override
	public List<WebUser> searchByConditions(WebUser webUser) {
		// TODO Auto-generated method stub
		return webUserDao.searchByConditions(webUser);
	}

	@Override
	public int add(WebUser webUser) {
		/*
		 * roleid 1 postid 0 roleid 2 postid 1 roleid 3 postid 2
		 * roleid 4 postid 3 roleid 5 postid 4 roleid 6 postid 5
		 * roleid 7 postid 6 roleid 8 postid 7
		 */
		webUser.setStatus(1);
		webUserDao.insert(webUser);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("roleId", webUser.getPostId() + 1);
		map.put("userId", webUser.getId());
		userRoleMapper.insertMap(map);
		return 1;
	}

	@Override
	public WebUser getById(int id) {
		WebUser bean = new WebUser();
		bean.setId(id);
		return webUserDao.getById(bean);
	}

	@Override
	public int delete(WebUser webUser) {
		userRoleMapper.deleteByUserId(webUser.getId());
		return webUserDao.delete(webUser);
	}

	@Override
	public int update(WebUser webUser) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("roleId", webUser.getPostId() + 1);
		map.put("userId", webUser.getId());
		userRoleMapper.updateRole(map);
		return webUserDao.update(webUser);
	}

	@Override
	public List<UserRole> getUserRoleById(int id) {
		return webUserDao.getUserRoleById(id);
	}
}
