package cn.pcbs.ocarinamanage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.pcbs.ocarinamanage.model.Pager;
import cn.pcbs.ocarinamanage.model.SystemContext;
import cn.pcbs.ocarinamanage.model.User;
import cn.pcbs.ocarinamanage.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/userGive")
	public String userGive() {
		return "admin/userGive";
	}
	
	
	@GetMapping("/doReportMess")
	public String doReportMess() {
		return "/doReportMess";
	}
	
	@GetMapping("/dealPost")
	public String dealPost() {
		return "/dealPost";
	}
	
	@GetMapping("/userDelete")
	public String userDelete() {
		return "admin/userDelete";
	}
	
	@GetMapping("/userStartFor")
	public String userStartFor() {
		return "admin/userStartFor";
	}
	
	@ResponseBody
	@RequestMapping(value="/getAllPagerUsers",method=RequestMethod.POST)
	public Pager<User> getAllPagerUsers(Integer page,Integer rows,
				@RequestParam(value="userName",required=false) String userName){
		if(page != null && page > 0) SystemContext.setPageOffset((page-1)*rows);
		if(rows != null && rows > 0) SystemContext.setPageSize(rows);
		User user = new User();
		if(userName!=null && !"".equals(userName)) user.setUserName(userName);
		Pager<User> pager = userService.getAllPagerUsers(user);
		SystemContext.removePageOffset();
		SystemContext.removePageSize();
		return pager;
	}
	
	@ResponseBody
	@RequestMapping(value="/updateUserRole",method=RequestMethod.POST)
	public String updateUserRole(@RequestBody User user) {
		try {
			userService.updateUser(user);
		} catch (Exception e) {
			return "error";
		}
		return "ok";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/userForbidden",method=RequestMethod.POST)
	public String userForbidden(@RequestParam("ids[]")int[] ids) {
		try {
			userService.userForbidden(ids);
		} catch (Exception e) {
			return "error";
		}
		return "ok";
	}
	
	@ResponseBody
	@RequestMapping(value="/userStart",method=RequestMethod.POST)
	public String userStart(@RequestParam("ids[]")int[] ids) {
		try {
			userService.userStart(ids);
		} catch (Exception e) {
			return "error";
		}
		return "ok";
	}	
	
	@ResponseBody
	@RequestMapping(value="/userDelete",method=RequestMethod.POST)
	public String userDelete(@RequestParam("ids[]")int[] ids) {
		try {
			userService.userDelete(ids);
		} catch (Exception e) {
			return "error";
		}
		return "ok";
	}
	
}
