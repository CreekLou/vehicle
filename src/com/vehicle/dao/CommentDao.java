package com.vehicle.dao;

import org.springframework.stereotype.Repository;

import com.vehicle.domain.Comment;

/**
 * Comment的DAO类
 * 
 */
/**
 * @author louxuezheng
 */
@Repository
public class CommentDao extends BaseDao<Comment> {
	
	protected final String GET_PAGED_COMMENTS = "from Comment where topic.topicId =? order by createTime desc";

	protected final String DELETE_TOPIC_COMMENTS = "delete from Comment where topic.topicId=?";
	protected final String DELETE_ONE_COMMENT = "delete from Comment where commentId=?";
	/**
	 * 分页查询对象
	 * @param topicId 主题ID
	 */
	public Page getPagedComments(int topicId, int pageNo, int pageSize) {
		return pagedQuery(GET_PAGED_COMMENTS, pageNo, pageSize, topicId);
	}

	/**
	 * 删除主题下的所有回复
	 * @param topicId 主题ID
	 */
	public void deleteTopicComments(int topicId) {
		getHibernateTemplate().bulkUpdate(DELETE_TOPIC_COMMENTS, topicId);
	}	

	/**
	 * 删除主题下的一个回复,完全可以没有
	 * 
	 * @param commentId
	 *            主题ID
	 */
	public void deleteOneComment(int commentId) {
		getHibernateTemplate().bulkUpdate(DELETE_ONE_COMMENT, commentId);
	}
}
