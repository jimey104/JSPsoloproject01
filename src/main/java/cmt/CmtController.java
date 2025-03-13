package cmt;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CmtController
 */
@WebServlet("/view")
public class CmtController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CmtController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CmtDao dao = new CmtDao();

        try {	
        	String mId = request.getParameter("mId"); // 요청에서 mId 가져오기
        	request.setAttribute("mId", mId);
            	
            if (mId != null && !mId.isEmpty()) {
                List<Comment> list = dao.ReadAll(mId); // mId를 DAO에 전달
                request.setAttribute("list", list);
            }
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/board/view.jsp");
            dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
