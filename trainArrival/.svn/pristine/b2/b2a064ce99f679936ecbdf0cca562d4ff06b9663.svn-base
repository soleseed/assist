package hansuo.trainArrival.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import hansuo.trainArrival.common.Common;
import hansuo.trainArrival.entity.WebUser;
import hansuo.trainArrival.interceptor.WebSecurityConfig;
import hansuo.trainArrival.service.WebUserService;

@Controller
public class BootController {

	@Autowired
	private WebUserService webUserService;

	@RequestMapping("/")
	public String home() {
		return "redirect:/login";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/loginValidate")
	@ResponseBody
	public WebUser loginValidate(String userName, String password, HttpSession session) {
		// 登陆验证
		WebUser user = webUserService.getUser(userName, password);
		if (null != user) {
			session.setAttribute(WebSecurityConfig.SESSION_KEY, user);
		}
		return user;
	}

	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	/**
	 * 退出登录
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		// 移除session
		session.removeAttribute(WebSecurityConfig.SESSION_KEY);
		return "redirect:/login";
	}

	@RequestMapping("/updateAudioTrigger")
	@ResponseBody
	public void updateAudioTrigger(Boolean on, HttpSession session) {
		// 登陆验证
		WebUser user = (WebUser) session.getAttribute(WebSecurityConfig.SESSION_KEY);
		Common.AUDIO_TRRIGER.put(user.getUserName(), on);
	}

	@RequestMapping("/getAudioTrigger")
	@ResponseBody
	public Boolean getAudioTrigger(HttpSession session) {
		// 登陆验证
		WebUser user = (WebUser) session.getAttribute(WebSecurityConfig.SESSION_KEY);
		Boolean result = Common.AUDIO_TRRIGER.get(user.getUserName());
		if (result == null) {
			Common.AUDIO_TRRIGER.put(user.getUserName(), Boolean.TRUE);
			return Boolean.TRUE;
		}
		return result;
	}
}
