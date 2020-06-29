package cn.pcbs.ocarinaclub.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.apache.shiro.crypto.hash.SimpleHash;

import cn.pcbs.ocarinaclub.model.LoginEntity;
import cn.pcbs.ocarinaclub.model.MyVidieo;
import cn.pcbs.ocarinaclub.model.OcarinaMusic;
import cn.pcbs.ocarinaclub.model.OcarinaVideo;
import cn.pcbs.ocarinaclub.model.Phone;
import cn.pcbs.ocarinaclub.model.Role;
import cn.pcbs.ocarinaclub.model.UpdatePassEntity;
import cn.pcbs.ocarinaclub.model.User;
import cn.pcbs.ocarinaclub.service.MyVidieoService;
import cn.pcbs.ocarinaclub.service.OcarinaMusicService;
import cn.pcbs.ocarinaclub.service.OcarinaVideoService;
import cn.pcbs.ocarinaclub.service.RoleService;
import cn.pcbs.ocarinaclub.service.UserRoleService;
import cn.pcbs.ocarinaclub.service.UserService;
import cn.pcbs.ocarinaclub.utils.CodeUtils;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private  OcarinaMusicService ocarinaMusicService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserRoleService userRoleService;
	
	@Autowired
	private MyVidieoService myVidieoService;
	
	@Autowired
	private OcarinaVideoService ocarinaVideoService;
	
	@GetMapping(value= {"","/","/index"})
	public String index(HttpSession session,HttpServletRequest request) {
		
		List<OcarinaVideo> all = ocarinaVideoService.getAllOcarinaVideo();
		String path = request.getContextPath() + "/static/vidieo";
		String imgpath = request.getContextPath() + "/static/vidieo";
		
		for(OcarinaVideo o : all) {
			o.setVideoPath(path + o.getVideoPath());
			o.setVideoImg(imgpath + o.getVideoImg()); 
		}
		session.setAttribute("video", all);
		return "index";
	}
	
	@GetMapping(value= {"/header"})
	public String header() {
		
		return "header";
	}
	
	@ResponseBody
	@PostMapping("/userRegister")
	public String userRegister(@RequestBody User user,HttpSession session,Model model) {
		User userDb = userService.getUserByUserName(user.getUserName());
		if(userDb != null) {
			return "error";
		}
		SimpleHash hash = new SimpleHash("MD5", user.getPassword(), null, 1024);
		String password = hash.toString();
		user.setUserName(user.getUserName().trim());
		user.setPassword(password);
		user.setRegeDate(new Date());
		user.setState(1);
		user.setImg("avtar.jpg");
		List<Role> roles = roleService.getAllRoles();
		Role role = null;
		for(Role r : roles) {
			if("user".equals(r.getCode())) {
				role = r;
				break;
			}
		}
		try {
			userService.addUser(user,role.getId());
			session.setAttribute("username", user.getUserName());
			model.addAttribute("username", user.getUserName());
			return "ok";
		} catch (Exception e) {
			return "error";
		}
	}
	
	@GetMapping("/registerSuccess")
	public String registerSuccess() {
		return "registerSuccess";
	}
	
	@ResponseBody
	@PostMapping("/userlogin")
	public String userlogin(@RequestBody LoginEntity entity,HttpSession session,HttpServletRequest request) {
		SimpleHash hash = new SimpleHash("MD5", entity.getPassword(), null, 1024);
		String password = hash.toString();
		User user = userService.getUserByUserName(entity.getUserName());
		String code = (String) session.getAttribute("code");
		if(user != null && user.getState() == 1 && entity.getPhoneNumber().equals(user.getPhoneNumber())) {
			if((user.getPassword().equals(password)) && code.equals(entity.getCode()) ) {  
				String path = request.getContextPath() + "/static/img/";
				user.setImg(path + user.getImg());
				user.setPassword("");
				session.setAttribute("user", user);
				return "ok";
			}
		}
		return "error";
	}
	
	@ResponseBody
	@PostMapping("/getCode")
	public String getCode(@RequestBody Phone phone,HttpSession session) {
		String code = CodeUtils.getCode();
		boolean isGetCode = true;
		try {
			isGetCode = CodeUtils.sendCode(phone.getPhoneNumber(), code);
			session.setAttribute("code", code);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		if(isGetCode == false) {
			return "error";
		}
		return "ok";
	}
	
	/**
	 * 检测用户名是否存在
	 * @return
	 */
	@ResponseBody
	@PostMapping("/userNameRegCheck")
	public String userNameRegCheck(@RequestBody User user) {
		String result = "ok";
		List<User> users = userService.selectAll();
		for(User u : users) {
			if(u.getUserName().equals(user.getUserName())) {
				result = "error";
				break;
			}
		}
		return result;
	}
	
	/**
	 * 退出
	 */
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/index";
	}
	
	/**
	 * 跳转到个人中心
	 */
	@GetMapping("/userMessage")
	public String userMessage() {
		return "userMessage";
	}
	
	/**
	 * 跳转到修改个人信息
	 */
	@GetMapping("/updateUserMessage")
	public String updateUserMessage() {
		return "updateUserMessage";
	}
	
	@ResponseBody
	@PostMapping("/userMessageUpdate")
	public String userMessageUpdate(@RequestBody User user,HttpSession session) {
		if(user != null) {
			try {
				userService.updateUserMessage(user);
				User u = userService.getUserByUserName(user.getUserName());
				User sessionu = (User) session.getAttribute("user");
				sessionu.setPersonalsign(u.getPersonalsign());
				sessionu.setSex(u.getSex());
				sessionu.setPassword("");
				session.setAttribute("user", sessionu);
			} catch (Exception e) {
				e.printStackTrace();
				return "error";
			}
			return "ok";
		}
		return "error";
	}
	
	/**
	 * 跳转到修改头像页面
	 * @return
	 */
	@GetMapping("/redUpdateUserImg")
	public String redUpdateUserImg() {
		return "updateUserImg";
	}
	
	/**
	 * 上传头像
	 */
	@PostMapping("/imgUpload")
	public String imgUpload(User user,HttpServletRequest request,
			@RequestParam("file") MultipartFile file ) {
		
		if(!file.isEmpty()) {
			String path = request.getServletContext().getRealPath("/static/img/");
			
			String fileName = file.getOriginalFilename();
			
			File filepath = new File(path,fileName);
			if(!(filepath.getParentFile().exists())) {
				filepath.getParentFile().mkdirs();
			}
			User u = userService.getUserByUserName(user.getUserName());
			File old = new File(path,u.getImg());
			if(old.exists() && !("avtar.jpg".equals(old.getName()))) {
				old.delete();
			}
			try {
				file.transferTo(filepath );
				u.setImg(fileName);
				//修改头像
				userService.updateUserImg(u);
				
				User dbu = userService.getUserByUserName(u.getUserName());
				User sessionu = (User) request.getSession().getAttribute("user");
				String imgpath = request.getContextPath() + "/static/img/";
				sessionu.setImg(imgpath + dbu.getImg());
				sessionu.setPassword("");
				request.getSession().setAttribute("user", sessionu);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		
		return "redirect:/userMessage";
		
	}
	
	/**
	 * 跳转到我的作品页面
	 * @param session
	 * @param req
	 * @return
	 */
	@GetMapping("/myVideos")
	public String myVideos(HttpSession session,HttpServletRequest req) {
		User user = (User) session.getAttribute("user");
		List<MyVidieo> myVideos = myVidieoService.getAllMyVideos(user.getId());
		String videopath = req.getContextPath() + "/static/vidieo";
		String imgpath = req.getContextPath() + "/static/img";
		for(MyVidieo m : myVideos) {
			m.setPath(videopath + m.getPath());
			m.setImg(imgpath + m.getImg());
		}
		session.setAttribute("videos", myVideos);
		return "myVideos";
	}
	
	
	@ResponseBody
	@PostMapping("/playMyVideo")
	public String playMyVideo(@RequestBody MyVidieo my,HttpSession session,HttpServletRequest req) {
		try {
			MyVidieo myVidieo = myVidieoService.select(my.getId());
			
			String videopath = req.getContextPath() + "/static/vidieo";
			String imgpath = req.getContextPath() + "/static/img";
			
			myVidieo.setPath(videopath + myVidieo.getPath());
			myVidieo.setImg(imgpath + myVidieo.getImg());
			myVidieo.setId(my.getId());
			session.setAttribute("play", myVidieo);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "ok";
	}
	
	@GetMapping("/videoPlay")
	public String videoPlay() {
		return "videoplay";
	}
	
	@GetMapping("/myVideoDelete")
	public String myVideoDelete(Integer id,HttpServletRequest req,String videoname) {
		if(id != null) {
			try {
				myVidieoService.deleteMiddleTable(id);
				myVidieoService.deleteById(id);
				User user = (User) req.getSession().getAttribute("user");
				String videopath = req.getServletContext().getRealPath("/static/vidieo/" + user.getUserName() + "/");
				File file = new File(videopath+videoname);
				
				if(file.exists()) {
					file.delete();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/myVideos";
	}
	
	@GetMapping("/uploadMyVideoView")
	public String uploadMyVideoView() {
		return "uploadMyVideo";
	}
	
	/**
	 * 上传视频
	 * @return
	 */
	@PostMapping("/videoUpload")
	public String videoUpload(User user,HttpServletRequest request,
			@RequestParam("file") MultipartFile file ) {
		try {
			String videopath = request.getServletContext().getRealPath("/static/vidieo/" + user.getUserName() + "/");
			String fileName = file.getOriginalFilename();
			
			File newFile = new File(videopath+fileName);
			if(!(newFile.getParentFile().exists())) {
				newFile.getParentFile().mkdirs();
			}
			
			file.transferTo(newFile);
			MyVidieo my = new MyVidieo();
			my.setImg("/myvideoimg.jpg");
			my.setVidieoName(fileName);
			my.setPath("/" + user.getUserName() + "/" + fileName);
			myVidieoService.uploadMyVideo(my);
			myVidieoService.updateMiddleTable(user.getId(), my.getId());
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/myVideos";
	}
	
	@GetMapping("/findPassword")
	public String findPassword() {
		return "findPassword";
	}
	
	/**
	 * 密码找回的验证码
	 */
	@ResponseBody
	@PostMapping("/getFindPassCode")
	public String getFindPassCode(@RequestBody Phone phone,HttpSession session) {
		String code = CodeUtils.getCode();
		boolean isGetCode = true;
		try {
			isGetCode = CodeUtils.findPassSendCode(phone.getPhoneNumber(), code);
			session.setAttribute("code", code);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		if(isGetCode == false) {
			return "error";
		}
		return "ok";
	}
	
	@ResponseBody
	@PostMapping("/findPass")
	public String findPass(@RequestBody LoginEntity user,HttpSession session) {
		
		if(user != null) {
			String sessioncode = (String) session.getAttribute("code");
			User u = userService.getUserByUserName(user.getUserName());
			
			if(u != null ) {
				if((u.getPhoneNumber().equals(user.getPhoneNumber())) && (sessioncode.equals(user.getCode()))) {
					SimpleHash hash = new SimpleHash("MD5", user.getPassword(), null, 1024);
					String password = hash.toString();
					u.setPassword(password);
					userService.updatePassword(u);
					return "ok";
				}else {
					return "error";
				}
			}
		}
		return "error";
	}
	
	/**
	 * 安全中心
	 * @return
	 */
	@GetMapping("/safe")
	public String safe() {
		return "safe";
	}
	
	@GetMapping("/updatePassView")
	public String updatePassView() {
		return "updatePass";
	}
	
	
	/**
	 * 修改密码
	 * @param up
	 * @return
	 */
	@ResponseBody
	@PostMapping("/userPasswordUpdate")
	public String userPasswordUpdate(@RequestBody UpdatePassEntity up) {
		if(up != null) {
			SimpleHash hash = new SimpleHash("MD5", up.getOldpass(), null, 1024);
			String password = hash.toString();
			User user = userService.getUserByUserName(up.getUserName());
			
			if(user != null && user.getPassword().equals(password)) {
				try {
					SimpleHash newhash = new SimpleHash("MD5", up.getPassword(), null, 1024);
					String newpassword = newhash.toString();
					user.setPassword(newpassword);
					userService.updatePassword(user);
					return "ok";
				} catch (Exception e) {
					e.printStackTrace();
					return "error";
				}
			}
		}
		return "error";
	}
	
	@GetMapping("/updatePhoneView")
	public String updatePhoneView() {
		return "updatePhone";
	}
	
	@ResponseBody
	@PostMapping("/phoneNumberUpdate")
	public String phoneNumberUpdate(@RequestBody Phone phone) {
		if(phone != null && (!("".equals(phone.getUserName())) && phone.getUserName() != null)) {
			try {
				User user = userService.getUserByUserName(phone.getUserName());
				if(user != null) {
					if(user.getPhoneNumber().equals(phone.getOldphone())) {
						user.setPhoneNumber(phone.getNewphone());
						userService.updatePhone(user);
						return "ok";
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				return "error";
			}
		}
		return "error";
	}
	
	/**
	 * 点击用户名查看别人的信息
	 * @param userName
	 * @param req
	 * @return
	 */
	@GetMapping("/watchothers")
	public String watchothers(String userName,HttpServletRequest req) {
		User user = userService.getUserByUserName(userName);
		String videopath = req.getContextPath() + "/static/vidieo";
		String imgpath = req.getContextPath() + "/static/img/";
		
		user.setImg(imgpath + user.getImg()); 
		req.getSession().setAttribute("his", user);
		return "watchothers";
	}
	

	
	@GetMapping("/hisVideos")
	public String hisVideos(HttpSession session,HttpServletRequest req) {
		User user = (User) session.getAttribute("his");
		List<MyVidieo> hisVideos = myVidieoService.getAllMyVideos(user.getId());
		String videopath = req.getContextPath() + "/static/vidieo";
		String imgpath = req.getContextPath() + "/static/img";
		for(MyVidieo m : hisVideos) {
			m.setPath(videopath + m.getPath());
			m.setImg(imgpath + m.getImg());
		}
		session.setAttribute("videos", hisVideos);
		return "hisVideos";
	}
	
	@GetMapping("/nologin")
	public String nologin() {
		return "nologin";
	}
}
