package com.vehicle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vehicle.dao.BoardDao;
import com.vehicle.dao.CityDao;
import com.vehicle.dao.CommentDao;
import com.vehicle.dao.CountDao;
import com.vehicle.dao.DescrDao;
import com.vehicle.dao.Page;
import com.vehicle.dao.TopicDao;
import com.vehicle.dao.UserDao;
import com.vehicle.domain.Board;
import com.vehicle.domain.City;
import com.vehicle.domain.Comment;
import com.vehicle.domain.Descr;
import com.vehicle.domain.Topic;

@Service
public class VehicleService {
	@Autowired
	private TopicDao topicDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private CommentDao commentDao;
	@Autowired
	private DescrDao descrDao;
	@Autowired
	private CountDao countDao;
	@Autowired
	private CityDao cityDao;

	/**
	 * 增加网页被访问次数
	 * 
	 * @param countId
	 */
	/*
	 * public void updateCountNum(String countId) { Count count =
	 * countDao.get(countId); count.setCountNum(count.getCountNum() + 1);
	 * countDao.update(count); }
	 */

	/**
	 * 添加一个回复帖子
	 * 
	 * @param comment
	 */
	public void addComment(Comment comment) {
		commentDao.save(comment);
		Topic topic = topicDao.get(comment.getTopic().getTopicId());
		topic.setReplies(topic.getReplies() + 1);
		// topic处于Hibernate受管状态，无须显示更新？？？？？
		// topicDao.update(topic);
		// 通过topicDao.get(post.getTopicId())方法从数据表中加载Topic实例，
		// 所以这个Topic实例处于受管的状态
	}

	/**
	 * 删除一个回复
	 * 
	 * @param postId
	 */
	public void removeComment(int commentId) {
		Comment comment = commentDao.get(commentId);
		commentDao.remove(comment);
		// 为什么不直接Topic topic = post.getTopic()？？
		Topic topic = topicDao.get(comment.getTopic().getTopicId());
		topic.setReplies(topic.getReplies() - 1);
		// topic处于Hibernate受管状态，无须显示更新
		// topicDao.update(topic);
		// userDao.update(user);
	}

	/**
	 * 删除一个图片解释
	 * 
	 * @param postId
	 */
	public void removeDescr(int descrId) {
		Descr descr = descrDao.get(descrId);
		descrDao.remove(descr);
		// topic处于Hibernate受管状态，无须显示更新
		// topicDao.update(topic);
		// userDao.update(user);
	}

	/**
	 * 获取所有的版块
	 * 
	 * @return
	 */
	public List<Board> getAllBoards() {
		return boardDao.loadAll();
	}

	/**
	 * 获取所有的城市
	 * 
	 * @return
	 */

	public List<City> getAllCitys() {
		return cityDao.loadAll();
	}
	/**
	 * 获取论坛版块某一页主题帖
	 * 
	 * @param boardId
	 * @return
	 */
	public Page getPagedTopics(int boardId, int pageNo, int pageSize) {
		return topicDao.getPagedTopics(boardId, pageNo, pageSize);
	}

	/**
	 * 获取版块某个城市的所有主题
	 * 
	 * @param boardId
	 * @return
	 */
	public Page getPageTopicsByCity(int boardId, String city, int pageNo,
			int pageSize) {
		return topicDao.queryTopicByCity(boardId, city, pageNo, pageSize);
	}

	/**
	 * 获取同主题每一页评论，以最后回复时间降序排列
	 * 
	 * @param topicId
	 * @return
	 */
	public Page getPagedComments(int topicId, int pageNo, int pageSize) {
		return commentDao.getPagedComments(topicId, pageNo, pageSize);
	}

	/**
	 * 获取主题图片解释,分页显示
	 * 
	 * @param topicId
	 * @return
	 */
	public Page getPagedDescrs(int topicId, int pageNo, int pageSize) {
		return descrDao.getPagedDescrs(topicId, pageNo, pageSize);
	}

	/**
	 * 获取主题图片解释，全部显示
	 * 
	 * @param topicId
	 * @return
	 */
	public List getAllDescrs(int topicId) {
		return descrDao.getDescrsByTopicId(topicId);
	}

	/**
	 * 查找出所有包括标题包含title的主题帖
	 * 
	 * @param title
	 *            标题查询条件
	 * @return 标题包含title的主题帖
	 */
	public Page queryTopicByTitle(String title, int pageNo, int pageSize) {
		return topicDao.queryTopicByTitle(title, pageNo, pageSize);
	}

	/**
	 * 根据boardId获取Board对象
	 * 
	 * @param boardId
	 */
	public Board getBoardById(int boardId) {
		return boardDao.get(boardId);
	}
	
	/**
	 * 根据cityId获取City对象
	 * 
	 * @param cityId
	 */
	public City getCityById(int cityId) {
		return cityDao.get(cityId);
	}

	/**
	 * 根据topicId获取Topic对象
	 * 
	 * @param topicId
	 * @return Topic
	 */
	public Topic getTopicByTopicId(int topicId) {
		return topicDao.get(topicId);
	}

	/**
	 * 获取回复的对象
	 * 
	 * @param commentId
	 * @return 回复的对象
	 */
	public Comment getCommentByCommentId(int commentId) {
		return commentDao.get(commentId);
	}

	/**
	 * 获取主题图片解释对象
	 * 
	 * @param descrId
	 * @return 回复的对象
	 */
	public Descr getDescrByDescrId(int descrId) {
		return descrDao.get(descrId);
	}

	/**
	 * 更改主题帖
	 * 
	 * @param topic
	 */
	public void updateTopic(Topic topic) {
		topicDao.update(topic);
	}

	/**
	 * 更改回复的内容
	 * 
	 * @param comment
	 */
	public void updateComment(Comment comment) {
		commentDao.update(comment);
	}

	/**
	 * 更改主题图片的内容
	 * 
	 * @param post
	 */
	public void updateDescr(Descr descr) {
		descrDao.update(descr);
	}
}
