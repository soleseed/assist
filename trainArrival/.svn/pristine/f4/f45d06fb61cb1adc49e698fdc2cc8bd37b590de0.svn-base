package hansuo.trainArrival.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import hansuo.trainArrival.entity.UserRole;
import hansuo.trainArrival.entity.WebUser;
import hansuo.trainArrival.interceptor.WebSecurityConfig;
import hansuo.trainArrival.service.WebUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private WebUserService webUserService;

	@RequestMapping("/toSearch")
	public String toSearch() {
		return "user/user_list";
	}
	
	@RequestMapping("/emergency")
	public String emergency() {
		return "test";
	}

	@RequestMapping("/search")
	@ResponseBody
	public Map<String, Object> searchJson(WebUser user, Integer page) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<WebUser> users = new ArrayList<WebUser>();
		try {
			Page<WebUser> pageInfo = PageHelper.startPage(page,
					hansuo.trainArrival.page.Page.PAGE_SIZE);
			users = webUserService.searchByConditions(user);
			result.put("count", pageInfo.getTotal());
			result.put("code", 0);
			result.put("message", "success");
			result.put("data", users);
		} catch (Exception e) {
		}
		return result;
	}

	@RequestMapping("/toAdd")
	public String toAdd() {
		return "user/user_add";
	}

	@RequestMapping("/add")
	@ResponseBody
	public int add(WebUser user) {
		int result = 0;
		try {
			user.setStatus(0);
			result = webUserService.add(user);
		} catch (DuplicateKeyException e) {
			result = -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/toEdit")
	public String toEdit() {
		return "user/user_edit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public int edit(WebUser user) {
		int result = 0;
		try {
			result = webUserService.update(user);
		} catch (Exception e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/detail")
	public ModelAndView detail(int id) {
		ModelAndView mv = new ModelAndView();
		try {
			WebUser user = webUserService.getById(id);
			mv.addObject("user", user);
			mv.setViewName("user/user_detail");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public int delete(String id) {
		int result = 0;
		try {
			WebUser user = new WebUser();
			user.setId(Integer.parseInt(id));
			result = webUserService.delete(user);
		} catch (Exception e) {
			result = 0;
		}
		return result;
	}

	@RequestMapping("/getUserRole")
	@ResponseBody
	public List<UserRole> getUserRole(HttpSession session) {
		List<UserRole> result = new ArrayList<UserRole>();
		try {
			WebUser user = (WebUser) session.getAttribute(WebSecurityConfig.SESSION_KEY);

			result = webUserService.getUserRoleById(user.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
