package cn.pcbs.ocarinamanage.model;

import java.io.Serializable;

public class ReportMessage implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 举报信息ID
	 */
	private int id;
	
	/**
	 * 举报人呢称
	 */
	private String reporterName;
	
	/**
	 * 处理人呢称
	 */
	private String dealName;
	
	/**
	 * 举报信息标题
	 */
	private String title;
	
	/**
	 * 举报信息内容
	 */
	private String content;
	
	/**
	 * 是否已处理：0 未处理  1 已处理
	 */
	private Integer isDeal;
	
	/**
	 * 被举报的帖子
	 */
	private String reportPostName;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getReporterName() {
		return reporterName;
	}

	public void setReporterName(String reporterName) {
		this.reporterName = reporterName;
	}

	public String getDealName() {
		return dealName;
	}

	public void setDealName(String dealName) {
		this.dealName = dealName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getIsDeal() {
		return isDeal;
	}

	public void setIsDeal(Integer isDeal) {
		this.isDeal = isDeal;
	}

	public String getReportPostName() {
		return reportPostName;
	}

	public void setReportPostName(String reportPostName) {
		this.reportPostName = reportPostName;
	}

	@Override
	public String toString() {
		return "ReportMessage [id=" + id + ", reporterName=" + reporterName + ", dealName=" + dealName + ", title="
				+ title + ", content=" + content + ", isDeal=" + isDeal + ", reportPostName=" + reportPostName + "]";
	}
}
