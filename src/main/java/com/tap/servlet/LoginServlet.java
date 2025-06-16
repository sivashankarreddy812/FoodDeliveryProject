package com.tap.servlet;

import java.io.IOException;

import com.tap.dao.UserDAO;
import com.tap.daoimpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("Hi from login servlet");

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();
        Integer attempts = (Integer) session.getAttribute("loginAttempts");
        if (attempts == null) attempts = 0;

        UserDAO udao = new UserDAOImpl();

        if (attempts >= 2) {
            req.setAttribute("error", "Account locked. Contact admin for support.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        User user = udao.getUserByEmailAndPassword(email, password);

        if (user == null) {
            attempts++;
            session.setAttribute("loginAttempts", attempts);

            // Check if it's the last attempt
            String message = (attempts >= 3)
                ? "Account locked. Contact admin for support."
                : String.format("Invalid email or password! %d attempt%s remaining.", (3 - attempts), (3 - attempts > 1 ? "s" : ""));

            req.setAttribute("error", message);
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            // Successful login
            session.setAttribute("userId", user.getUserid());
            session.setAttribute("userAddress", user.getAddress());
            session.setAttribute("user", user);
            session.removeAttribute("loginAttempts");
            req.getRequestDispatcher("home").forward(req, resp);
        }
    }
}
