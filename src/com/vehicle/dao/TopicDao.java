package com.vehicle.dao;

import org.springframework.stereotype.Repository;

import com.vehicle.domain.Topic;

/**
 * topic 的DAO类
 *
 */
/**
 * @author louxuezheng 2013年12月12日
 */
@Repository
public class TopicDao extends BaseDao<Topic> {
	
	private final String GET_PAGED_TOPICS = "from Topic where boardId = ?";
	
	private final String QUERY_TOPIC_BY_TITILE = "from Topic  where topicTitle like ?";
	// private final String GET_CITY = "from Topic where city like ?";
	private final String QUERY_TOPIC_BY_CITY = "from Topic  where boardId = ? and city = ?";

	/**
	 * 获取版块分页的主题帖子 获取版块某一页的主题帖子
	 * 
	 * @param boardId
	 *            论坛版块ID
	 * @param pageNo
	 *            页号，从1开始。
	 * @param pageSize
	 *            每页的记录数
	 * @return 包含分页信息的Page对象
	 */
	public Page getPagedTopics(int boardId,int pageNo,int pageSize) {
		return pagedQuery(GET_PAGED_TOPICS,pageNo,pageSize,boardId);
	}

	public Page queryTopicByCity(int boardId,String city, int pageNo, int pageSize) {
		return pagedQuery(QUERY_TOPIC_BY_CITY, pageNo, pageSize,boardId, city);
	}
	/**
	 * 根据主题帖标题查询所有模糊匹配的主题帖
	 * 获取和主题帖标题模糊匹配的主题帖（某一页的数据）
	 * @param title 标题的查询条件
	 * @param pageNo 页号，从1开始。
	 * @param pageSize 每页的记录数
	 * @return 包含分页信息的Page对象
	 */
	public Page queryTopicByTitle(String title, int pageNo, int pageSize) {
		return pagedQuery(QUERY_TOPIC_BY_TITILE,pageNo,pageSize,title);
	}
	
}
