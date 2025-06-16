package com.tap.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.tap.dao.*;
import com.tap.daoimpl.*;
import com.tap.model.*;

@WebServlet("/user-registration")
public class UserRegisterServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String phonenumber = req.getParameter("phonenumber");
		String address = req.getParameter("address");
		String role = req.getParameter("role");
		
		User user = new User(name, username, password, email, phonenumber, address, role);
		
		UserDAO udao = new UserDAOImpl();
		
		udao.addUser(user);
		
		resp.sendRedirect("login.jsp");
	}
}