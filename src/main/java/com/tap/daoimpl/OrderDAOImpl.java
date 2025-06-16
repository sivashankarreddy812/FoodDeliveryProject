package com.tap.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import com.tap.dao.OrderDAO;
import com.tap.model.Order;
import com.tap.util.DBConnection;

public class OrderDAOImpl implements OrderDAO{

	private final String INSERT = "INSERT into `orders` (`restaurantid`, `userid`, `orderdate`, `totalamount`, `status`, `paymentmode`) values (?, ?, ?, ?, ?, ?)";
	private final String UPDATE = "UPDATE `orders` SET `restaurantid` = ?, `userid` = ?, `orderdate` = ?, `totalamount` = ?, `status` = ?, `paymentmode` = ? WHERE `orderid` = ?";
	private final String GET_ORDER_BY_ID = "SELECT * from `orders` WHERE `orderid` = ?";
	private final String GET_ALL_ORDERS = "SELECT * from `orders`";
	private final String DELETE = "DELETE from `orders` WHERE `orderid` = ?";

	@Override
	public int addOrder(Order order) {
		int orderId = 0;

		try (Connection connection = DBConnection.getConnection();
		     PreparedStatement prepareStatement = connection.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS)) {

			prepareStatement.setInt(1, order.getRestaurantid());
			prepareStatement.setInt(2, order.getUserid());
			prepareStatement.setTimestamp(3, order.getOrderdate());
			prepareStatement.setInt(4, order.getTotalamount());
			prepareStatement.setString(5, order.getStatus());
			prepareStatement.setString(6, order.getPaymentmode());

			int i = prepareStatement.executeUpdate();

			if (i == 0) {
				throw new SQLException("Creating order failed, no rows affected.");
			}

			try (ResultSet id = prepareStatement.getGeneratedKeys()) {
				if (id.next()) {
					orderId = id.getInt(1); // Corrected
				}
			}

			System.out.println("Order inserted with ID: " + orderId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderId;
	}


	@Override
	public void updateOrder(Order order) {

		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(UPDATE);)
		{
			prepareStatement.setInt(1, order.getRestaurantid());
			prepareStatement.setInt(2, order.getUserid());
			prepareStatement.setTimestamp(3, order.getOrderdate());
			prepareStatement.setInt(4, order.getTotalamount());
			prepareStatement.setString(5, order.getStatus());
			prepareStatement.setString(6, order.getPaymentmode());
			prepareStatement.setInt(7, order.getOrderid());

			int i = prepareStatement.executeUpdate();

			System.out.println(i);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrder(int orderid) {

		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(DELETE);)
		{

			prepareStatement.setInt(1, orderid);

			int i = prepareStatement.executeUpdate();

			System.out.println(i);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Order getOrderById(int orderid) {

		Order order = null;

		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(GET_ORDER_BY_ID);)
		{

			prepareStatement.setInt(1, orderid);

			ResultSet res = prepareStatement.executeQuery();

			while(res.next()) {

				int id = res.getInt("orderid");
				int restaurantid = res.getInt("restaurantid");
				int userid = res.getInt("userid");
				Timestamp orderdate = res.getTimestamp("orderdate");
				int totalamount = res.getInt("totalamount");
				String status = res.getString("status");
				String paymentmode = res.getString("paymentmode");

				order = new Order(id, restaurantid, userid, orderdate, totalamount, status, paymentmode);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return order;
	}

	@Override
	public List<Order> getAllOrders() {

		List<Order> orders = new ArrayList<Order>();
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(GET_ALL_ORDERS);)
		{
			ResultSet res = prepareStatement.executeQuery();

			while(res.next()) {

				int id = res.getInt("orderid");
				int restaurantid = res.getInt("restaurantid");
				int userid = res.getInt("userid");
				Timestamp orderdate = res.getTimestamp("orderdate");
				int totalamount = res.getInt("totalamount");
				String status = res.getString("status");
				String paymentmode = res.getString("paymentmode");

				Order ord = new Order(id, restaurantid, userid, orderdate, totalamount, status, paymentmode);
				orders.add(ord);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return orders;
	}
}