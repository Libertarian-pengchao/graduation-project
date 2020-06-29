package cn.pcbs.ocarinaclub.model;

public class OcarinaMusic {
	
	/**
	 * 主键ID
	 */
	private Integer id;
	
	/**
	 * 陶笛乐曲名
	 */
	private String musicName;
	
	/**
	 * 作曲家名
	 */
	private String musicianName;
	
	/**
	 * 存放路径
	 */
	private String musicPath;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMusicName() {
		return musicName;
	}

	public void setMusicName(String musicName) {
		this.musicName = musicName;
	}

	public String getMusicianName() {
		return musicianName;
	}

	public void setMusicianName(String musicianName) {
		this.musicianName = musicianName;
	}

	public String getMusicPath() {
		return musicPath;
	}

	public void setMusicPath(String musicPath) {
		this.musicPath = musicPath;
	}

	@Override
	public String toString() {
		return "OcarinaMusic [id=" + id + ", musicName=" + musicName + ", musicianName=" + musicianName + ", musicPath="
				+ musicPath + "]";
	}
	
}
