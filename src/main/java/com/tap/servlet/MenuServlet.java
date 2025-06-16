package com.tap.servlet;

import java.io.IOException;
import java.util.List;

import com.tap.dao.MenuDAO;
import com.tap.daoimpl.MenuDAOImpl;
import com.tap.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Hi from menu servelt...");
		
		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		
		MenuDAO mdao = new MenuDAOImpl();
		
		List<Menu> menuByRestaurantId = mdao.getMenuByRestaurantId(restaurantId);
		
		req.setAttribute("menuByRestaurantId", menuByRestaurantId);
		
		for(Menu menu : menuByRestaurantId) {
			 System.out.println(menu);
		}
			
		RequestDispatcher rd = req.getRequestDispatcher("/menu.jsp");
			
		rd.forward(req, resp);
	}
}