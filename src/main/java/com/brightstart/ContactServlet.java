package com.brightstart;

import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContactServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setHeader("Cache-Control", "no-store");
        ContactForm form = new ContactForm(request.getParameter("name"), request.getParameter("email"),
                request.getParameter("service"), request.getParameter("message"));
        Map<String, String> errors = form.validate();
        if (!errors.isEmpty()) {
            request.setAttribute("form", form);
            request.setAttribute("errors", errors);
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            request.getRequestDispatcher("/contact.jsp").forward(request, response);
            return;
        }
        // Demo only: validate without saving personal information or sending email.
        request.getSession().setAttribute("contactSuccess", Boolean.TRUE);
        response.setStatus(HttpServletResponse.SC_SEE_OTHER);
        response.setHeader("Location", request.getContextPath() + "/contact.jsp#contact-form");
    }
}
