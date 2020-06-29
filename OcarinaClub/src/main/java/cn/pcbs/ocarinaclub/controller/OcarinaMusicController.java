package cn.pcbs.ocarinaclub.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import cn.pcbs.ocarinaclub.model.OcarinaMusic;
import cn.pcbs.ocarinaclub.service.OcarinaMusicService;

@Controller
public class OcarinaMusicController {
	
	@Autowired
	private OcarinaMusicService ocarinaMusicService;
	
	@GetMapping("/OcarinaMusicView")
	public String OcarinaMusic(HttpSession session,HttpServletRequest request) {
		List<OcarinaMusic> all = ocarinaMusicService.getAllMusic();
		String path = request.getContextPath() + "/static/music";
		
		for(OcarinaMusic o : all) {
			o.setMusicPath(path + o.getMusicPath());
		}
	
		session.setAttribute("music", all);	
		return "OcarinaMusic";
	}
	
	@GetMapping("/zclmusic")
	public String zclmusic(HttpSession session,HttpServletRequest request) {
		List<OcarinaMusic> zong = ocarinaMusicService.getMusicByMusician("宗次郎");
		String path = request.getContextPath() + "/static/music";
		for(OcarinaMusic o : zong) {
			o.setMusicPath(path + o.getMusicPath());
		}
		session.setAttribute("music", zong);
		return "OcarinaMusic";
	}
	
	@GetMapping("/yxzmusic")
	public String yxzmusic(HttpSession session,HttpServletRequest request) {
		
		List<OcarinaMusic> you = ocarinaMusicService.getMusicByMusician("游学志");
		String path = request.getContextPath() + "/static/music";
		for(OcarinaMusic o : you) {
			o.setMusicPath(path + o.getMusicPath());
		}
		session.setAttribute("music", you);
		return "OcarinaMusic";
	}
	
	@GetMapping("/zzlmusic")
	public String zzlmusic(HttpSession session,HttpServletRequest request) {
		List<OcarinaMusic> zhou = ocarinaMusicService.getMusicByMusician("周子雷");
		String path = request.getContextPath() + "/static/music";
		for(OcarinaMusic o : zhou) {
			o.setMusicPath(path + o.getMusicPath());
		}
		session.setAttribute("music", zhou);
		return "OcarinaMusic";
	}
}
