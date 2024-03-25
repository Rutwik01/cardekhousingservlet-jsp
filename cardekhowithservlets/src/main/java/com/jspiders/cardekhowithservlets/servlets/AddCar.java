package com.jspiders.cardekhowithservlets.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspiders.cardekhowithservlets.jdbc.CarJDBC;

@WebServlet("/add_car")
public class AddCar extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String brand = req.getParameter("brand");
		Double price = Double.parseDouble(req.getParameter("price"));
		String fuelType = req.getParameter("fuelType");
		String colour = req.getParameter("colour");
//		String message= req.getAttribute(message);
		int res = CarJDBC.addCar(id, name, brand, price, fuelType, colour);
		

		if (res == 1) {
			req.setAttribute("message", "Car Added");
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("AddCar.jsp");
			requestDispatcher.forward(req, resp);
		} else {
			req.setAttribute("message", "Car not Added");
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("AddCar.jsp");
			requestDispatcher.forward(req, resp);
		}

	}

}
