package com.controller;

import com.bean.Filme;
import com.bean.Usuario;
import com.model.FilmeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FilmeServlet", urlPatterns = {"/FilmeServlet"})
public class FilmeServlet extends HttpServlet {

    private FilmeDAO filmeDAO;

    @Override
    public void init() {
        filmeDAO = new FilmeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "listar";
        }

        try {
            switch (action) {
                case "listar":
                    listarFilmes(request, response);
                    break;

                case "novo":
                    showNovoForm(request, response);
                    break;

                case "editar":
                    editarFilme(request, response);
                    break;

                case "excluir":
                    deletarFilme(request, response);
                    break;

                case "sugerir":
                    exibirSugestoes(request, response);
                    break;

                default:
                    response.sendRedirect("home.jsp");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    private void showNovoForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("formFilme.jsp").forward(request, response);
    }

    private void listarFilmes(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<Filme> todosFilmes = filmeDAO.listar();
        List<Filme> adminFilmes = new ArrayList<>();
        List<Filme> userFilmes = new ArrayList<>();

        for (Filme f : todosFilmes) {
            if (f.getUsuarioId() == 0) { // Administrador cadastra com ID 0
                adminFilmes.add(f);
            } else {
                userFilmes.add(f);
            }
        }

        request.setAttribute("adminFilmes", adminFilmes);
        request.setAttribute("userFilmes", userFilmes);
        request.getRequestDispatcher("listarFilmes.jsp").forward(request, response);
    }

    private void editarFilme(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Usuario usuarioEditar = (Usuario) request.getSession().getAttribute("usuario");
        int idEditar = Integer.parseInt(request.getParameter("id"));
        Filme filmeEditar = filmeDAO.buscarPorId(idEditar);

        if (usuarioEditar != null
                && ("admin".equals(usuarioEditar.getTipo()) || usuarioEditar.getId() == filmeEditar.getUsuarioId())) {
            request.setAttribute("filme", filmeEditar);
            request.getRequestDispatcher("formFilme.jsp").forward(request, response);
        } else {
            response.sendRedirect("FilmeServlet?action=sugerir");
        }
    }

    private void deletarFilme(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Usuario usuarioExcluir = (Usuario) request.getSession().getAttribute("usuario");
        int idExcluir = Integer.parseInt(request.getParameter("id"));
        Filme filmeExcluir = filmeDAO.buscarPorId(idExcluir);

        if (usuarioExcluir != null
                && ("admin".equals(usuarioExcluir.getTipo()) || usuarioExcluir.getId() == filmeExcluir.getUsuarioId())) {
            filmeDAO.excluir(idExcluir);
            response.sendRedirect("FilmeServlet");
        } else {
            response.sendRedirect("FilmeServlet?action=sugerir");
        }
    }

    private void exibirSugestoes(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<Filme> lista = filmeDAO.listar();
        request.setAttribute("listaFilmes", lista);
        request.getRequestDispatcher("sugerirFilme.jsp").forward(request, response);
    }
    private void atualizarFilme(HttpServletRequest request, HttpServletResponse response) 
        throws Exception {
    int id = Integer.parseInt(request.getParameter("id"));
    String titulo = request.getParameter("titulo");
    String genero = request.getParameter("genero");
    double nota = Double.parseDouble(request.getParameter("nota"));
    String descricao = request.getParameter("descricao");

    Filme filme = new Filme();
    filme.setId(id);
    filme.setTitulo(titulo);
    filme.setGenero(genero);
    filme.setNota(nota);
    filme.setDescricao(descricao);

    filmeDAO.atualizar(filme);
    response.sendRedirect("FilmeServlet");
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("listarFilmes.jsp");
            return;
        }

        try {
            switch (action) {
                case "inserir":
                    inserirFilme(request, response);
                    break;

                case "atualizar":
                    atualizarFilme(request, response);
                    break;

                case "sugerir":
                    sugestaoFilme(request, response);
                    break;

                default:
                    response.sendRedirect("listarFilmes.jsp");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    private void inserirFilme(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String titulo = request.getParameter("titulo");
        String genero = request.getParameter("genero");
        double nota = Double.parseDouble(request.getParameter("nota"));
        String descricao = request.getParameter("descricao");

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        Filme filme = new Filme();
        filme.setTitulo(titulo);
        filme.setGenero(genero);
        filme.setNota(nota);
        filme.setDescricao(descricao);

        if (usuario != null) {
            filme.setUsuarioId(usuario.getId());
        }

        filmeDAO.inserir(filme);
        response.sendRedirect("FilmeServlet");
    }

    private void sugestaoFilme(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String titulo = request.getParameter("titulo");
        String genero = request.getParameter("genero");
        double nota = Double.parseDouble(request.getParameter("nota"));

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        Filme filme = new Filme();
        filme.setTitulo(titulo);
        filme.setGenero(genero);
        filme.setNota(nota);
        filme.setDescricao("Sugestão do usuário");

        if (usuario != null) {
            filme.setUsuarioId(usuario.getId());
        }

        filmeDAO.inserir(filme);
        response.sendRedirect("FilmeServlet?action=sugerir");
    }
}

