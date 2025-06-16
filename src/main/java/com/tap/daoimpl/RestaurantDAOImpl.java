package com.tap.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.util.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    private final String INSERT = "INSERT INTO restaurants (name, address, phonenumber, cusinetype, deliverytime, admineuserid, rating, isactive, imagepath, createddate, lastlogindate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private final String UPDATE = "UPDATE restaurants SET name = ?, address = ?, phonenumber = ?, cusinetype = ?, deliverytime = ?, admineuserid = ?, rating = ?, isactive = ?, imagepath = ? WHERE restaurantid = ?";
    private final String DELETE = "DELETE FROM restaurants WHERE restaurantid = ?";
    private final String GET_BY_ID = "SELECT * FROM restaurants WHERE restaurantid = ?";
    private final String GET_ALL = "SELECT * FROM restaurants";
    private final String SEARCH = "SELECT * FROM restaurants WHERE name LIKE ? OR cusinetype LIKE ?";

    @Override
    public void addRestaurant(Restaurant restaurant) {
        try (Connection con = DBConnection.getConnection(); PreparedStatement pst = con.prepareStatement(INSERT)) {
            pst.setString(1, restaurant.getName());
            pst.setString(2, restaurant.getAddress());
            pst.setString(3, restaurant.getPhonenumber());
            pst.setString(4, restaurant.getCusinetype());
            pst.setString(5, restaurant.getDeliverytime());
            pst.setInt(6, restaurant.getAdmineuserid());
            pst.setString(7, restaurant.getRating());
            pst.setString(8, restaurant.getIsactive());
            pst.setString(9, restaurant.getImagepath());
            pst.setTimestamp(10, new Timestamp(System.currentTimeMillis()));
            pst.setTimestamp(11, new Timestamp(System.currentTimeMillis()));
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateRestaurant(Restaurant restaurant) {
        try (Connection con = DBConnection.getConnection(); PreparedStatement pst = con.prepareStatement(UPDATE)) {
            pst.setString(1, restaurant.getName());
            pst.setString(2, restaurant.getAddress());
            pst.setString(3, restaurant.getPhonenumber());
            pst.setString(4, restaurant.getCusinetype());
            pst.setString(5, restaurant.getDeliverytime());
            pst.setInt(6, restaurant.getAdmineuserid());
            pst.setString(7, restaurant.getRating());
            pst.setString(8, restaurant.getIsactive());
            pst.setString(9, restaurant.getImagepath());
            pst.setInt(10, restaurant.getRestaurantid());
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteRestaurant(int restaurantid) {
        try (Connection con = DBConnection.getConnection(); PreparedStatement pst = con.prepareStatement(DELETE)) {
            pst.setInt(1, restaurantid);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Restaurant getRestaurantById(int restaurantid) {
        Restaurant restaurant = null;
        try (Connection con = DBConnection.getConnection(); PreparedStatement pst = con.prepareStatement(GET_BY_ID)) {
            pst.setInt(1, restaurantid);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                restaurant = extractRestaurant(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurant;
    }

    @Override
    public List<Restaurant> getAllRestaurants() {
        List<Restaurant> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); PreparedStatement pst = con.prepareStatement(GET_ALL)) {
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(extractRestaurant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Restaurant> searchRestaurants(String query) {
        List<Restaurant> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection(); PreparedStatement pst = con.prepareStatement(SEARCH)) {
            String q = "%" + query + "%";
            pst.setString(1, q);
            pst.setString(2, q);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(extractRestaurant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private Restaurant extractRestaurant(ResultSet rs) throws SQLException {
        return new Restaurant(
                rs.getInt("restaurantid"),
                rs.getString("name"),
                rs.getString("address"),
                rs.getString("phonenumber"),
                rs.getString("cusinetype"),
                rs.getString("deliverytime"),
                rs.getInt("admineuserid"),
                rs.getString("rating"),
                rs.getString("isactive"),
                rs.getString("imagepath"),
                rs.getTimestamp("createddate"),
                rs.getTimestamp("lastlogindate")
        );
    }
}
