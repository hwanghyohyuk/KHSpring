package board.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.*;
import board.model.vo.Board;
import board.model.dao.BoardDao;

public class BoardService {
	public BoardService(){}
	
	//전체 게시글 갯수 조회용
	public int getListCount(){
		Connection con = getConnection();
		int listCount = new BoardDao().getListCount(con);
		close(con);
		return listCount;
	}
	
	//페이지별 목록 조회용
	public ArrayList<Board> selectList(int currentPage, int limit){
		Connection con = getConnection();
		ArrayList<Board> list = new BoardDao().selectList(con, currentPage, limit);
		close(con);
		return list;
	}

	//원글 등록 처리용
	public int insertBoard(Board b) {
		Connection con = getConnection();
		int result = new BoardDao().insertBoard(con, b);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public void addReadCount(int bnum) {
		Connection con = getConnection();
		int result = new BoardDao().addReadCount(con, bnum);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return;
	}
	
	public Board selectBoard(int bnum){
		Connection con = getConnection();
		Board board = new BoardDao().selectBoard(con, bnum);
		close(con);
		return board;
	}

	public int deleteBoard(int bnum) {
		Connection con = getConnection();
		int result = new BoardDao().deleteBoard(con, bnum);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public void updateReplySeq(Board replyBoard) {
		Connection con = getConnection();
		int result = new BoardDao().updateReplySeq(con, replyBoard);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);		
	}

	public int insertReply(Board originBoard, Board replyBoard) {
		Connection con = getConnection();
		int result = new BoardDao().insertReply(con, originBoard, replyBoard);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public int updateReply(Board reply) {
		Connection con = getConnection();
		int result = new BoardDao().updateReply(con, reply);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public int updateBoard(Board b) {
		Connection con = getConnection();
		int result = new BoardDao().updateBoard(con, b);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public ArrayList<Board> selectTop3() {
		Connection con = getConnection();
		ArrayList<Board> list = new BoardDao().selectTop3(con);
		close(con);
		return list;
	}
}















