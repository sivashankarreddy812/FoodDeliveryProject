package com.tap.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tap.dao.OrderItemDAO;
import com.tap.model.OrderItem;
import com.tap.util.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO{

	private final String INSERT = "INSERT into `orderitems` (`orderid`, `menuid`, `quantity`, `totalamount`) values (?, ?, ?, ?)";
	private final String UPDATE = "UPDATE `orderitems` SET `orderid` = ?, `menuid` = ?, `quantity` = ?, `totalamount` = ? WHERE `orderitemid` = ?";
	private final String GET_ORDERITEM_BY_ID = "SELECT * from `orderitems` WHERE `orderitemid` = ?";
	private final String GET_ALL_ORDERITEMS = "SELECT * from `orderitems`";
	private final String DELETE = "DELETE from `orderitems` WHERE `orderitemid` = ?";

	@Override
	public void addOrderItem(OrderItem orderitem) {

		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(INSERT);)
		{

			prepareStatement.setInt(1, orderitem.getOrderid());
			prepareStatement.setInt(2, orderitem.getMenuid());
			prepareStatement.setInt(3, orderitem.getQuantity());
			prepareStatement.setInt(4, orderitem.getTotalamount());

			int i = prepareStatement.executeUpdate();

			System.out.println(i);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void updateOrderItem(OrderItem orderitem) {

		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(UPDATE);)
		{

			prepareStatement.setInt(1, orderitem.getOrderid());
			prepareStatement.setInt(2, orderitem.getMenuid());
			prepareStatement.setInt(3, orderitem.getQuantity());
			prepareStatement.setInt(4, orderitem.getTotalamount());
			prepareStatement.setInt(5, orderitem.getOrderitemid());

			int i = prepareStatement.executeUpdate();

			System.out.println(i);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrderItem(int orderitemid) {

		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(DELETE);)
		{

			prepareStatement.setInt(1, orderitemid);

			int i = prepareStatement.executeUpdate();

			System.out.println(i);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public OrderItem getOrderItemById(int orderitemid) {
		
		OrderItem orderitem = null;
		
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(GET_ORDERITEM_BY_ID);)
		{

			prepareStatement.setInt(1, orderitemid);

			ResultSet res = prepareStatement.executeQuery();
			
			while(res.next()) {
				int id = res.getInt("orderitemid");
				int orderid = res.getInt("orderid");
				int menuid = res.getInt("menuid");
				int quantity = res.getInt("quantity");
				int totalamount = res.getInt("totalamount");
				
				orderitem = new OrderItem(id, orderid, menuid, quantity, totalamount);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return orderitem;
	}

	@Override
	public List<OrderItem> getAllOrderItems() {
		
		List<OrderItem> orderitems = new ArrayList<OrderItem>();
		try(Connection connection = DBConnection.getConnection();
				PreparedStatement prepareStatement = connection.prepareStatement(GET_ALL_ORDERITEMS);)
		{
			ResultSet res = prepareStatement.executeQuery();
			
			while(res.next()) {
				int id = res.getInt("orderitemid");
				int orderid = res.getInt("orderid");
				int menuid = res.getInt("menuid");
				int quantity = res.getInt("quantity");
				int totalamount = res.getInt("totalamount");
				
				OrderItem ord_item = new OrderItem(id, orderid, menuid, quantity, totalamount);
				orderitems.add(ord_item);
				
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return orderitems;
	}

}