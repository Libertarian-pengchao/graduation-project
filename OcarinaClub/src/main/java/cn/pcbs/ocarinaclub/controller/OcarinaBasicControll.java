package cn.pcbs.ocarinaclub.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import cn.pcbs.ocarinaclub.model.Ocarinaskills;
import cn.pcbs.ocarinaclub.service.OcarinaskillsService;

@Controller
public class OcarinaBasicControll {
	
	@Autowired
	private OcarinaskillsService ocarinaskillsService;
	
	@GetMapping("/OcarinaBasicView")
	public String OcarinaBasicView(HttpSession session) {
		List<Ocarinaskills> allOcarinaskills = ocarinaskillsService.getAllOcarinaskills();
		for(Ocarinaskills o : allOcarinaskills) {
			if(o.getContent().length() > 200) {
				o.setContent(o.getContent().substring(0, 200));
			}
		}
		if(allOcarinaskills!= null && allOcarinaskills.size() > 0) {
			session.setAttribute("allOcarinaskills", allOcarinaskills);
		}
		return "OcarinaBasic";
	}
	
	@GetMapping("/skillsdetail")
	public String skillsdetail(HttpSession session,int id) {
		Ocarinaskills ocarinaskillsById = ocarinaskillsService.getOcarinaskillsById(id);
		session.setAttribute("ocarinaskillsById", ocarinaskillsById);
		return "skillsdetail";
	}
}
