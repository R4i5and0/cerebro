package com.controller;

import com.bean.Filme;
import com.model.FilmeDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;


/**
 *
 * @author Raissa
 */
@WebServlet("/formFilme") // isso define o caminho acessado no navegador
public class FormFilmeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.isEmpty()) {
                int id = Integer.parseInt(idParam);
                FilmeDAO dao = new FilmeDAO();
                Filme filme = dao.buscarPorId(id);
                request.setAttribute("filme", filme);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("formFilme.jsp");
        rd.forward(request, response);
    }
}