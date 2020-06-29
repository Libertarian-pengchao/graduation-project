package cn.pcbs.ocarinamanage.model;

import java.util.List;

public class Pager<T> {
	
	/**
	 * 每页显示的条数
	 */
	private int size;
	
	/**
	 * 每页第一条数据的索引
	 */
	private int offset;
	
	/**
	 * 数据总条数
	 */
	private long total;
	
	/**
	 * 具体数据对象的集合
	 */
	private List<T> rows;

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	@Override
	public String toString() {
		return "Pager [size=" + size + ", offset=" + offset + ", total=" + total + ", rows=" + rows + "]";
	}
}
