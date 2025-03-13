package com.mycompany.servlet;

import com.mycompany.dao.ContactDAO;
import com.mycompany.model.Contact;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private ContactDAO contactDAO;

    @Override
    public void init() throws ServletException {
        try {
            contactDAO = ContactDAO.getInstance();
        } catch (SQLException e) {
            throw new ServletException("Database connection error in ContactServlet", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");

        Contact contact = new Contact();
        contact.setName(name);
        contact.setEmail(email);
        contact.setPhone(phone);
        contact.setMessage(message);

        if (contactDAO.saveContact(contact)) {
            request.setAttribute("successMessage", "Your message has been sent successfully!");
        } else {
            request.setAttribute("errorMessage", "Failed to send message. Please try again.");
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    System.out.println("ContactServlet: doGet() called");

    List<Contact> contactList = contactDAO.getAllContacts();

    if (contactList == null) {
        System.out.println("Contact list is null");
    } else {
        System.out.println("Contact list size: " + contactList.size());
    }

    request.setAttribute("contactList", contactList);
    request.getRequestDispatcher("admincontactmanage.jsp").forward(request, response);
}


}
