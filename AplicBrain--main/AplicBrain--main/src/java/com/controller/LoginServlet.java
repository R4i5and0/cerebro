package com.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.bean.Usuario;
import com.model.UsuarioDAO;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email").trim().toLowerCase();
        String senha = request.getParameter("senha").trim();

        try {
            UsuarioDAO dao = new UsuarioDAO();
            Usuario usuario = dao.login(email, senha);

            if (usuario != null) {
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);

                boolean isAdmin = "admin".equalsIgnoreCase(usuario.getTipo());
                session.setAttribute("isAdmin", isAdmin);

                // Redireciona conforme o tipo de usuário
                if (isAdmin) {
                    response.sendRedirect("formFilme.jsp");
                } else {
                    response.sendRedirect("home.jsp");
                }

            } else {
                response.sendRedirect("login.jsp?erro=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?erro=2");
        }
    }
}
