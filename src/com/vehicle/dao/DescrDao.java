package com.vehicle.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.vehicle.domain.Descr;

/**
 * Descr的DAO类
 * 
 */
/**
 * @author louxuezheng
 */
@Repository
public class DescrDao extends BaseDao<Descr> {
	
	protected final String GET_PAGED_DESCRS = "from Descr where topic.topicId =?";

	protected final String DELETE_TOPIC_DESCRS = "delete from Descr where topic.topicId=?";
	protected final String GET_DESCRS = "from Descr where topic.topicId=?";
	protected final String DELETE_ONE_DESCR = "delete from Descr where descrId=?";
	/**
	 * 分页查询对象
	 * @param topicId 主题ID
	 */
	public Page getPagedDescrs(int topicId, int pageNo, int pageSize) {
		return pagedQuery(GET_PAGED_DESCRS, pageNo, pageSize, topicId);
	}

	public List getDescrsByTopicId(int topicId) {
		return find(GET_DESCRS, topicId);
	}
	/**
	 * 删除主题下的所有回复
	 * @param topicId 主题ID
	 */
	public void deleteTopicDescrs(int topicId) {
		getHibernateTemplate().bulkUpdate(DELETE_TOPIC_DESCRS, topicId);
	}	

	/**
	 * 删除主题下的一个解释
	 * 
	 * @param topicId
	 *            主题ID
	 */
	public void deleteOneDescr(int descrId) {
		getHibernateTemplate().bulkUpdate(DELETE_ONE_DESCR, descrId);
	}
}
