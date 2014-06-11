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
@Table(name = "t_app")
public class App extends BaseDomain{
	
	// Fields
	private Integer id;
	private String type;
	private String name;
	private String size;
	private String short_des;
	private String long_des;
	private Integer poster_num;
	private Integer download_num;

	// Constructors

	/** default constructor */
	public App() {
	}

	/** full constructor */
	public App(Integer id, String type, String name, String size, 
			String short_des, String long_des, Integer poster_num, Integer download_num) {
		this.id = id;
		this.type = type;
		this.name = name;
		this.size = size;
		this.short_des = short_des;
		this.long_des = long_des;
		this.poster_num = poster_num;
		this.download_num = download_num;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "type")
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Column(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "size")
	public String getSize() {
		return this.size;
	}

	public void setSize(String size) {
		this.size = size;
	}
	
	@Column(name = "short_des")
	public String getShort_des() {
		return this.short_des;
	}

	public void setShort_des(String short_des){
		this.short_des = short_des;
	}
	
	@Column(name = "long_des")
	public String getLong_des(){
		return this.long_des;
	}

	public void setLong_des(String long_des){
		this.long_des = long_des;
	}
	
	@Column(name = "poster_num")
	public Integer getPoster_num(){
		return this.poster_num;
	}

	public void setPoster_num(Integer poster_num){
		this.poster_num = poster_num;
	}
	
	@Column(name = "download_num")
	public Integer getDownload_num(){
		return this.download_num;
	}

	public void setDownload_num(Integer download_num){
		this.download_num = download_num;
	}
	
}
