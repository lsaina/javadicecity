package com.herejava.ask.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.ask.service.AskService;
import com.herejava.ask.vo.Ask;

/**
 * Servlet implementation class AskUpdateFrmServlet
 */
@WebServlet(name = "AskUpdateFrm", urlPatterns = { "/askUpdateFrm.do" })
public class AskUpdateFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskUpdateFrmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int askNo = Integer.parseInt(request.getParameter("askNo"));
		
		AskService service = new AskService();
		Ask a = service.getAsk(askNo);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/ask/askUpdateFrm.jsp");
		request.setAttribute("a", a);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
