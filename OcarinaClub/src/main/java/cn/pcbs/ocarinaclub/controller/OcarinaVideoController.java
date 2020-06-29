package cn.pcbs.ocarinaclub.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import cn.pcbs.ocarinaclub.model.OcarinaVideo;
import cn.pcbs.ocarinaclub.service.OcarinaVideoService;

@Controller
public class OcarinaVideoController {
	
	@Autowired
	private OcarinaVideoService ocarinaVideoService;
	
	@GetMapping("/OcarinaVideoPlay")
	public String OcarinaVideoPlay(Integer videoid,Model model,HttpServletRequest request) {
		
		OcarinaVideo video = ocarinaVideoService.select(videoid);
		
		String path = request.getContextPath() + "/static/vidieo";
		String imgpath = request.getContextPath() + "/static/vidieo";
		
		video.setVideoPath(path + video.getVideoPath());
		video.setVideoImg(imgpath + video.getVideoImg()); 
		model.addAttribute("playvideo", video);
		
		return "OcarinaVideoPlay";
	}
	
	@GetMapping("/zclvideo")
	public String zclvideo(HttpSession session,HttpServletRequest request) {
		List<OcarinaVideo> zong = ocarinaVideoService.getOcarinaVideoByauthorName("宗次郎");
		String path = request.getContextPath() + "/static/vidieo";
		String imgpath = request.getContextPath() + "/static/vidieo";
		for(OcarinaVideo o : zong) {
			o.setVideoPath(path + o.getVideoPath());
			o.setVideoImg(imgpath + o.getVideoImg()); 
		}
		session.setAttribute("video", zong);
		
		return "index";
	}
	
	@GetMapping("/yxzvideo")
	public String yxzvideo(HttpSession session,HttpServletRequest request) {
		List<OcarinaVideo> you = ocarinaVideoService.getOcarinaVideoByauthorName("游学志");
		String path = request.getContextPath() + "/static/vidieo";
		String imgpath = request.getContextPath() + "/static/vidieo";
		for(OcarinaVideo o : you) {
			o.setVideoPath(path + o.getVideoPath());
			o.setVideoImg(imgpath + o.getVideoImg()); 
		}
		session.setAttribute("video", you);
		
		return "index";
	}
	
	@GetMapping("/zzlvideo")
	public String zzlvideo(HttpSession session,HttpServletRequest request) {
		List<OcarinaVideo> zhou = ocarinaVideoService.getOcarinaVideoByauthorName("周子雷");
		String path = request.getContextPath() + "/static/vidieo";
		String imgpath = request.getContextPath() + "/static/vidieo";
		for(OcarinaVideo o : zhou) {
			o.setVideoPath(path + o.getVideoPath());
			o.setVideoImg(imgpath + o.getVideoImg()); 
		}
		session.setAttribute("video", zhou);
		
		return "index";
	}
}
