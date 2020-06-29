package cn.pcbs.ocarinaclub.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.pcbs.ocarinaclub.model.User;

public class MyHandler extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		String [] uris = new String []{"/publicPost","/comment","/report","/userMessage",
				"/updateUserMessage","/userMessageUpdate","/redUpdateUserImg","/imgUpload","/myVideos",
				"/playMyVideo","/myVideoDelete","/uploadMyVideoView","/videoUpload","/safe","/updatePassView",
				"/userPasswordUpdate","/updatePhoneView","/phoneNumberUpdate"};
		for(String u : uris) {
			if(uri.contains(u)) {
				boolean login = islogin(request.getSession());
				if(login == false) {
					response.sendRedirect("/OcarinaClub/nologin");
					return false;
				}
				break;
			}
		}
		return true;
	}

	
	public boolean islogin(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			return true;
		}
		return false;
	}

}
