package cn.pcbs.ocarinamanage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.pcbs.ocarinamanage.model.Pager;
import cn.pcbs.ocarinamanage.model.Post;
import cn.pcbs.ocarinamanage.model.ReportMessage;
import cn.pcbs.ocarinamanage.model.SystemContext;
import cn.pcbs.ocarinamanage.service.CommentService;
import cn.pcbs.ocarinamanage.service.PostService;
import cn.pcbs.ocarinamanage.service.ReportMessageService;

@Controller
public class ReAndPostController {
 
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private ReportMessageService reportMessageService;
	
	
	@RequestMapping("/reportdetails")
	public String reportDetails() {
		return "/reportdetails";
	}
	
	@RequestMapping("/postdetails")
	public String postDetails() {
		return "/postdetails";
	}
	
	@ResponseBody
	@RequestMapping("/getAllPagerPost")
	public Pager<Post> getAllPagerPost(Integer page,Integer rows,
			@RequestParam(value="postName",required=false) String postName){
		if(page != null && page > 0) SystemContext.setPageOffset((page-1)*rows);
		if(rows != null && rows > 0) SystemContext.setPageSize(rows);
		Post post = new Post();
		if(postName != null && !"".equals(postName)) post.setPostName(postName);
		Pager<Post> pager = postService.getAllPagerPost(post);
		System.out.println(pager);
		SystemContext.removePageOffset();
		SystemContext.removePageSize();
		return pager;
	}
	
	@ResponseBody
	@RequestMapping("/getAllPagerReportMess")
	public Pager<ReportMessage> getAllPagerReportMess(Integer page,Integer rows,
			@RequestParam(value="title",required=false) String title,@RequestParam(value="isDeal",required=false) Integer isDeal){
		if(page != null && page > 0) SystemContext.setPageOffset((page-1)*rows);
		if(rows != null && rows > 0) SystemContext.setPageSize(rows);
		ReportMessage repostMessage = new ReportMessage();
		if(title != null && !"".equals(title)) repostMessage.setTitle(title);
		if(isDeal != null && !"".equals(isDeal)) repostMessage.setIsDeal(isDeal);
		Pager<ReportMessage> pager = reportMessageService.getAllPagerReportMess(repostMessage);
		SystemContext.removePageOffset();
		SystemContext.removePageSize();
		return pager;
	}
	
	@ResponseBody
	@RequestMapping(value="/postDelete",method=RequestMethod.POST)
	public String postDelete(@RequestParam("ids[]")int[] ids) {
		try {
			commentService.deleteComments(ids);
			postService.deletePost(ids);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "ok";
	}
	
	@ResponseBody
	@RequestMapping(value="/reportMessDelete",method=RequestMethod.POST)
	public String reportMessDelete(@RequestParam("ids[]")int[] ids) {
		try {
			for(int id : ids) {
				reportMessageService.delete(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "ok";
	}
	
	@ResponseBody
	@RequestMapping(value="/reportMessChangeDone",method=RequestMethod.POST)
	public String reportMessChangeDone(@RequestParam("ids[]")int[] ids,HttpSession session) {
		try {
			String userName = (String) session.getAttribute("username");
			reportMessageService.ChangeReportDone(ids,userName);
		} catch (Exception e) {
			return "error";
		}
		return "ok";
	}
}
