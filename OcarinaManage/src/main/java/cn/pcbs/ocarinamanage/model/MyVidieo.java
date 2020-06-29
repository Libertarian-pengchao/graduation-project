package cn.pcbs.ocarinamanage.model;

import java.io.Serializable;

public class MyVidieo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 视频ID
	 */
	private int id;
	
	/**
	 * 视频名字
	 */
	private String vidieoName;

	
	/**
	 * 视频路径
	 */
	private String path;
	
	/**
	 * 视频封面
	 */
	private String img;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getVidieoName() {
		return vidieoName;
	}

	public void setVidieoName(String vidieoName) {
		this.vidieoName = vidieoName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "MyVidieo [id=" + id + ", vidieoName=" + vidieoName + ", path=" + path + ", img=" + img + "]";
	}
}
