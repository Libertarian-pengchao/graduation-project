package cn.pcbs.ocarinamanage.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Comment implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 评论ID
	 */
	private int id;
	
	/**
	 * 评论用户名，一条评论对应一个用户，也即是一个楼层，还可对评论继续评论
	 */
	private String userName;
	
	/**
	 * 回复的用户名
	 */
	private String replyUsername;
	
	/**
	 * 评论时间
	 */
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date date;
	
	/**
	 * 评论内容
	 */
	private String content;
	
	/**
	 * 评论对应的帖子，一对多的关系
	 */
	private Integer postId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getReplyUsername() {
		return replyUsername;
	}

	public void setReplyUsername(String replyUsername) {
		this.replyUsername = replyUsername;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", userName=" + userName + ", replyUsername=" + replyUsername + ", date=" + date
				+ ", content=" + content + ", postId=" + postId + "]";
	}
	
	
}
