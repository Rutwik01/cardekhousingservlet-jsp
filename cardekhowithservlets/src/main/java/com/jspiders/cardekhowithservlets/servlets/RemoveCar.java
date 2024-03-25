package com.jspiders.cardekhowithservlets.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspiders.cardekhowithservlets.jdbc.CarJDBC;
@WebServlet("/remove_car")
public class RemoveCar extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		int cars = CarJDBC.removeCar(id);
		if (cars ==1) {
			req.setAttribute("message", "car deleted");
		}
		else {
			req.setAttribute("message", "car not found");
		}
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("RemoveCar.jsp");
		requestDispatcher.forward(req, resp);
	}

}
