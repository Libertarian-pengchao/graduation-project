package cn.pcbs.ocarinaclub.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Post implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 帖子ID
	 */
	private int id;
	
	/**
	 * 帖子的类型：1-技术帖 2-提问帖 3-主题帖
	 */
	private int type;
	
	/**
	 * 帖子的名字
	 */
	private String postName;
	
	/**
	 * 帖子的内容
	 */
	private String postContent;
	
	/**
	 * 楼主，帖子发布者
	 */
	private String publishUserName;

	/**
	 *发帖时间
	 */
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date time;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPublishUserName() {
		return publishUserName;
	}

	public void setPublishUserName(String publishUserName) {
		this.publishUserName = publishUserName;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", type=" + type + ", postName=" + postName + ", postContent=" + postContent
				+ ", publishUserName=" + publishUserName + ", time=" + time + "]";
	}
}
