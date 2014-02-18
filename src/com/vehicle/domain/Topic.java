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
@Table(name = "t_topic")
public class Topic extends BaseDomain {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "topic_id")
	private int topicId;
	@Column(name = "board_id")
	private int boardId;
	@Column(name = "topic_title")
	private String topicTitle;
	@Column(name = "topic_views")
	private int views;
	@Column(name = "topic_replies")
	private int replies;
	@Column(name = "topic_city")
	private String city;
	@Column(name = "topic_summary")
	private String summary;
	@Column(name = "topic_rank")
	private String rank;
	@Column(name = "topic_recommend")
	private String recommend;
	@Column(name = "topic_consume")
	private String consume;
	@Column(name = "topic_ticket")
	private String ticket;
	@Column(name = "topic_tel")
	private String tel;
	@Column(name = "topic_address")
	private String address;
	@Column(name = "topic_route")
	private String route;

	public int getTopicId() {
		return topicId;
	}

	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getTopicTitle() {
		return topicTitle;
	}

	public void setTopicTitle(String topicTitle) {
		this.topicTitle = topicTitle;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getReplies() {
		return replies;
	}

	public void setReplies(int replies) {
		this.replies = replies;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getRecommend() {
		return recommend;
	}

	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}

	public String getConsume() {
		return consume;
	}

	public void setConsume(String consume) {
		this.consume = consume;
	}

	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRoute() {
		return route;
	}

	public void setRoute(String route) {
		this.route = route;
	}



}
