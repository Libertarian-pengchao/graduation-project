package cn.pcbs.ocarinaclub.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.pcbs.ocarinaclub.model.Comment;
import cn.pcbs.ocarinaclub.model.Post;
import cn.pcbs.ocarinaclub.model.ReportMessage;
import cn.pcbs.ocarinaclub.service.CommentService;
import cn.pcbs.ocarinaclub.service.PostService;
import cn.pcbs.ocarinaclub.service.ReportMessageService;

@Controller
public class OcarinaClubController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ReportMessageService reportMessageService;
	
	
	@GetMapping("/OcarinaClubView")
	public String OcarinaClubView(HttpSession session) {
		List<Post> allPost = postService.getAllPost();
		for(Post p : allPost) {
			if(p.getPostContent().length() >= 20) {
				p.setPostContent(p.getPostContent().substring(0,20) + "......");
			}
		}
		session.setAttribute("post", allPost);	
		return "OcarinaClub";
	}

	@PostMapping("/searchPost")
	public String searchPost(HttpSession session,String PostName) {
		List<Post> allPost = postService.getPostByName(PostName);
		for(Post p : allPost) {
			if(p.getPostContent().length() >= 20) {
				p.setPostContent(p.getPostContent().substring(0,20) + "......");
			}
		}
		session.setAttribute("post", allPost);
		return "OcarinaClub";
	}
	
	
	@GetMapping("/theme")
	public String theme(HttpSession session) {
		List<Post> theme = postService.getPostByType(3);

		for(Post p : theme) {
			if(p.getPostContent().length() >= 20) 
				p.setPostContent(p.getPostContent().substring(0,20) + "......");
		}
		session.setAttribute("post", theme);
		return "OcarinaClub";
	}
	
	@GetMapping("/skill")
	public String skill(HttpSession session) {
		List<Post> skill = postService.getPostByType(1);

		for(Post p : skill) {
			if(p.getPostContent().length() >= 20) 
				p.setPostContent(p.getPostContent().substring(0,20) + "......");
		}
		session.setAttribute("post", skill);
		return "OcarinaClub";
	}
	
	@GetMapping("/ask")
	public String ask(HttpSession session) {
		List<Post> ask = postService.getPostByType(2);
		
		for(Post p : ask) {
			if(p.getPostContent().length() >= 20) 
				p.setPostContent(p.getPostContent().substring(0,20) + "......");
		}
		session.setAttribute("post", ask);
		return "OcarinaClub";
	}
	
	@ResponseBody
	@PostMapping("/publicPost")
	public String publicPost(@RequestBody Post post) {
		if(post != null) {
			try {
				post.setTime(new Date());
				postService.publishPost(post);
				return "ok";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "error";
	}
	
	@GetMapping("/postDetail")
	public String postDetail(Integer id,HttpSession session) {
		Post post = null;
		List<Comment> allCommentByPid = null;
		if(id != null) {
			post = postService.getPostById(id);
			allCommentByPid = commentService.getAllCommentByPid(id);
			session.setAttribute("post", post);
			session.setAttribute("allComment", allCommentByPid);
		}
		
		return "postDetail";
	}
	
	@PostMapping("/comment")
	public String comment(Comment comment) {
		if(comment != null) {
			try {
				comment.setDate(new Date());
				commentService.insertComment(comment);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/OcarinaClubView";
	}
	
	@ResponseBody
	@PostMapping("/report")
	public String report(@RequestBody ReportMessage reportMessage) {
		if(reportMessage != null) {
			try {
				reportMessage.setIsDeal(0);
				reportMessageService.insertReportMessage(reportMessage);
				return "ok";
			} catch (Exception e) {
				e.printStackTrace();
				return "error";
			}
		}
		return "error";
	}
}
