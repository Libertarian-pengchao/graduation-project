package cn.pcbs.ocarinamanage.controller;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.pcbs.ocarinamanage.model.User;

@Controller
public class LoginController {
	
	@RequestMapping(value= {"","/","/login"},method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(User user,HttpSession session) {
		if(user != null) {
			Subject subject = SecurityUtils.getSubject();
			UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getPassword());
			try {
				subject.login(token);
			} catch (Exception e) {
				e.printStackTrace();
				return "loginError";
			}
			session.setAttribute("username", user.getUserName());
			return "admin/main";
		}
		return "loginError";
	}
	
	@RequestMapping("/admin/main")
	public String main() {
		return "/admin/mian";
	}
	
	@RequestMapping("/unauthorized")
	public String unauthorized() {
		return "/unauthorized";
	}
	
	
}
