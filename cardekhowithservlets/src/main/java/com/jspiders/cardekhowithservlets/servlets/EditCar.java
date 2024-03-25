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
import com.jspiders.cardekhowithservlets.object.Car;
@WebServlet("/edit_car")
public class EditCar extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		List<Car> cars = CarJDBC.editCar(id);
		req.setAttribute("cars", cars);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("EditCar.jsp");
		requestDispatcher.include(req, resp);
		
//		int id=Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String brand = req.getParameter("brand");
		Double price = Double.parseDouble(req.getParameter("price"));
		String fuelType = req.getParameter("fuelType");
		String colour = req.getParameter("colour");
		List<Car> car = CarJDBC.updateCar(id,name,brand,price,fuelType,colour);
		if (car.size() == 1) {
			req.setAttribute("message", "Car Details Updated");
			
		} else {
			req.setAttribute("message", "Car Details Not Updatded");
		}
		requestDispatcher = req.getRequestDispatcher("EditCar.jsp");
		requestDispatcher.forward(req, resp);
	}
}
