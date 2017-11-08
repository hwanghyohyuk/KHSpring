package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class BoardReplyServlet
 */
@WebServlet("/breply")
public class BoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 댓글 등록 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		String btitle = request.getParameter("btitle");
		String bwriter = request.getParameter("bwriter");
		String bcontent = request.getParameter("bcontent");
		
		BoardService bservice = new BoardService();
		
		//원글 조회
		Board originBoard = bservice.selectBoard(bnum);
		
		//댓글 객체 생성, 값 기록
		Board replyBoard = new Board();
		replyBoard.setBoardContent(bcontent);
		replyBoard.setBoardTitle(btitle);
		replyBoard.setBoardWriter(bwriter);
		replyBoard.setBoardLevel(originBoard.getBoardLevel() + 1);
		replyBoard.setBoardRef(originBoard.getBoardRef());
		if(replyBoard.getBoardLevel() == 2)
			replyBoard.setBoardReplyRef(originBoard.getBoardNum());
		replyBoard.setBoardReplySeq(1);
		
		//같은 레벨의 기존 댓글의 seq 1증가 처리함
		bservice.updateReplySeq(replyBoard);
		
		//댓글 등록 처리
		int result = bservice.insertReply(originBoard, replyBoard);
		
		if(result > 0){
			response.sendRedirect("/first/blist?page=" + currentPage);
		}else{
			RequestDispatcher view = request.getRequestDispatcher("views/board/boardError.jsp");
			request.setAttribute("message", "댓글 달기 실패!");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}










