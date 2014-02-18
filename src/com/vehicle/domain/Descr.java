package com.vehicle.domain;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "t_descr")
public class Descr extends BaseDomain {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "descr_id")
	private int descrId;
	@Column(name = "board_id")
	private int boardId;
	@Column(name = "descr_name")
	private String descrName;
	@Column(name = "descr_pinyin")
	private String descrPinyin;
	@Column(name = "descr_text")
	private String descrText;
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(name = "topic_id")
	private Topic topic;

	public int getDescrId() {
		return descrId;
	}

	public void setDescrId(int descrId) {
		this.descrId = descrId;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getDescrName() {
		return descrName;
	}

	public void setDescrName(String descrName) {
		this.descrName = descrName;
	}

	public String getDescrText() {
		return descrText;
	}

	public void setDescrText(String descrText) {
		this.descrText = descrText;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public String getDescrPinyin() {
		return descrPinyin;
	}

	public void setDescrPinyin(String descrPinyin) {
		this.descrPinyin = descrPinyin;
	}
}
