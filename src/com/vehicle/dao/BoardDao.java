package com.vehicle.dao;

import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.vehicle.domain.Board;

@Repository
public class BoardDao extends BaseDao<Board>{
	protected final String GET_BOARD_NUM = "select count(f.boardId) from Board f";
	protected final String GET_BOARD = "select boradId,boardName,boardDesc,topicNum from Board";
	// 获取论坛板块数目
	public long getBoardNum() {    
		Iterator iter = getHibernateTemplate().iterate(GET_BOARD_NUM);
        return ((Long)iter.next());
	}

	// 获取所有Board
	public List getAllBoards() {
		return find(GET_BOARD);
	}
}
