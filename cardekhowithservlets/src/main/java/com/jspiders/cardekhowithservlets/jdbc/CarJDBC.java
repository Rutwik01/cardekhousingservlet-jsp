package com.jspiders.cardekhowithservlets.jdbc;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jspiders.cardekhowithservlets.object.Car;

public class CarJDBC {
	private static Driver driver;
	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static String query;
	private static ResultSet resultSet;

	private static void openConnection() throws SQLException {
		driver = new com.mysql.cj.jdbc.Driver();
		DriverManager.registerDriver(driver);
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/weja3", "root", "root");
	}

	private static void closeConnection() throws SQLException {
		if (connection != null) {
			connection.close();
		}
		if (preparedStatement != null) {
			preparedStatement.close();
		}
		if (resultSet != null) {
			resultSet.close();
		}
		DriverManager.deregisterDriver(driver);

	}

	public static int addCar(int id, String name, String brand, double price, String fuelType, String colour) {
		int res = 0;
		try {
			openConnection();
			query = "INSERT INTO car1 VALUES(?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			preparedStatement.setString(2, name);
			preparedStatement.setString(3, brand);
			preparedStatement.setDouble(4, price);
			preparedStatement.setString(5, fuelType);
			preparedStatement.setString(6, colour);
			res = preparedStatement.executeUpdate();
			System.out.println(res + " row(s) affected");
			closeConnection();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;

	}

	public static List<Car> viewCars() {
		List<Car> cars = new ArrayList<>();
		try {
			openConnection();
			query = "SELECT * FROM car1";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Car car = new Car();
				car.setId(resultSet.getInt(1));
				car.setName(resultSet.getString(2));
				car.setBrand(resultSet.getString(3));
				car.setPrice(resultSet.getDouble(4));
				car.setFuelType(resultSet.getString(5));
				car.setColour(resultSet.getString(6));
				cars.add(car);
			}
			closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cars;

	}

	public static List<Car> searchCarById(int id) {
		List<Car> cars = new ArrayList<>();
		try {
			openConnection();
			query = "SELECT * FROM car1 where id=?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Car car = new Car();
				car.setId(resultSet.getInt(1));
				car.setName(resultSet.getString(2));
				car.setBrand(resultSet.getString(3));
				car.setPrice(resultSet.getDouble(4));
				car.setFuelType(resultSet.getString(5));
				car.setColour(resultSet.getString(6));
				cars.add(car);
			}
			closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cars;
	}

	public static List<Car> editCar(int id) {
		List<Car> cars = new ArrayList<>();
		try {
			openConnection();
			query = "SELECT * FROM car1 where id=?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Car car = new Car();
				car.setId(resultSet.getInt(1));
				car.setName(resultSet.getString(2));
				car.setBrand(resultSet.getString(3));
				car.setPrice(resultSet.getDouble(4));
				car.setFuelType(resultSet.getString(5));
				car.setColour(resultSet.getString(6));
				cars.add(car);
			}
			closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cars;
	}

	public static List<Car> updateCar(int id, String name, String brand, Double price, String fuelType, String colour) {
		List<Car> cars = new ArrayList<>();
		int res=0;
		try {
			openConnection();
			if (name != null) {
				query = "Update car1 set name=?, brand=?, price=?, fuelType=?, colour=? where id=?";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(6, id);
				preparedStatement.setString(2, brand);
				preparedStatement.setDouble(3, price);
				preparedStatement.setString(4, fuelType);
				preparedStatement.setString(5, colour);
				preparedStatement.setString(1, name);
				res = preparedStatement.executeUpdate();
				System.out.println(res + " row(s) affected");
				if (res==1) {
					query = "SELECT * FROM car1 where id=?";
					preparedStatement = connection.prepareStatement(query);
					preparedStatement.setInt(1, id);
					resultSet = preparedStatement.executeQuery();
					while (resultSet.next()) {
					Car car = new Car();
					car.setId(resultSet.getInt(1));
					car.setName(resultSet.getString(2));
					car.setBrand(resultSet.getString(3));
					car.setPrice(resultSet.getDouble(4));
					car.setFuelType(resultSet.getString(5));
					car.setColour(resultSet.getString(6));
					cars.add(car);
					}
				}
			}

			closeConnection();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return cars;
	}

	public static int removeCar(int id) {
		int res=0;
		try {
			openConnection();
			query = "DELETE from car1 where id=?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			res = preparedStatement.executeUpdate();
			System.out.println(res + " row(s) affected");
			closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
}
