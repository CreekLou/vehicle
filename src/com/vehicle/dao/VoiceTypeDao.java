/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vehicle.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.vehicle.domain.Video;

/**
 *
 * @author liu.huazhou <khzliu@163.com>
 */
@Repository
public class VoiceTypeDao extends BaseDao<Video>{
    protected final String GET_ALL_VOICETYPE = "from Voicetype";

	/**
	 * 分页查询对象
	 * 
	 * @param type Voice的类型
	 */
	public List getAllVoiceType() {
		return find(GET_ALL_VOICETYPE);
	}
    
}
