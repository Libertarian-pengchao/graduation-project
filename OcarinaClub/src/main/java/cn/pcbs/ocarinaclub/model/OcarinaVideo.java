package cn.pcbs.ocarinaclub.model;

public class OcarinaVideo {
	
	/**
	 * 主键ID
	 */
	private Integer id;
	
	/**
	 * 视频名字
	 */
	private String videoName;
	
	/**
	 * 陶笛演奏家名字
	 */
	private String authorName;
	
	/**
	 * 视频路径
	 */
	private String videoPath;
	
	/**
	 * 视频封面
	 */
	private String videoImg;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getVideoName() {
		return videoName;
	}

	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getVideoPath() {
		return videoPath;
	}

	public void setVideoPath(String videoPath) {
		this.videoPath = videoPath;
	}

	public String getVideoImg() {
		return videoImg;
	}

	public void setVideoImg(String videoImg) {
		this.videoImg = videoImg;
	}

	@Override
	public String toString() {
		return "OcarinaVideo [id=" + id + ", videoName=" + videoName + ", authorName=" + authorName + ", videoPath="
				+ videoPath + ", videoImg=" + videoImg + "]";
	}

}
