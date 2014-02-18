package com.vehicle.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "t_videos")
public class Video extends BaseDomain {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id; // 视频id
	private String type; // 视频类型
	private String name; // 视频名称
	private String duration; // 视频时长
	private String date; // 视频日期
	private Integer clicks; // 视频点击数
	@Column(name = "description")
	private String des; // 视频描述
	private Float scale_x; // 视频x宽
	private Float scale_y; // 视频y高
	private String director; // 导演
	private String actor; // 演员
	private String singer; // 歌手
	private String album; // 专辑
	private String route;// 文件路径

	public String getRoute() {
		return route;
	}

	public void setRoute(String route) {
		this.route = route;
	}
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Float getScale_x() {
		return scale_x;
	}

	public void setScale_x(Float scale_x) {
		this.scale_x = scale_x;
	}

	public Float getScale_y() {
		return scale_y;
	}

	public void setScale_y(Float scale_y) {
		this.scale_y = scale_y;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getSinger() {
		return singer;
	}

	public void setSinger(String singer) {
		this.singer = singer;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Integer getClicks() {
		return clicks;
	}

	public void setClicks(Integer clicks) {
		this.clicks = clicks;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

}
