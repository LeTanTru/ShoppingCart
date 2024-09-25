package com.dopamine.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dopamine.io.ProductIO;
import com.dopamine.model.Cart;
import com.dopamine.model.LineItem;
import com.dopamine.model.Product;

/**
 * Servlet implementation class CartController
 */
@WebServlet("/cart")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.getRequestDispatcher("/views/cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at doPost: ").append(request.getContextPath());

		ServletContext sc = getServletContext();

		// get current action
		String action = request.getParameter("action");
		if (action == null) {
			action = "cart"; // default action
		}

		// perform action and set URL to appropriate page
		if (action.equals("shop")) {
			response.sendRedirect("home");
		} else if (action.equals("cart")) {
			String productCode = request.getParameter("productCode");
			String quantityString = request.getParameter("quantity");

			HttpSession session = request.getSession();
			Cart cart = (Cart) session.getAttribute("cart");
			if (cart == null) {
				cart = new Cart();
			}

			// if the user enters a negative or invalid quantity,
			// the quantity is automatically reset to 1.
			int quantity;
			try {
				quantity = Integer.parseInt(quantityString);
				if (quantity < 0) {
					quantity = 1;
				}
			} catch (NumberFormatException nfe) {
				quantity = 1;
			}

			String path = sc.getRealPath("/WEB-INF/products.txt");
			Product product = ProductIO.getProduct(productCode, path);

			LineItem lineItem = new LineItem();
			lineItem.setProduct(product);
			lineItem.setQuantity(quantity);
			if (quantity > 0) {
				cart.addItem(lineItem);
			} else if (quantity == 0) {
				cart.removeItem(lineItem);
			}

			session.setAttribute("cart", cart);
			response.sendRedirect("cart");
		} else if (action.equals("checkout")) {
			response.sendRedirect("checkout");
		}

	}

}
