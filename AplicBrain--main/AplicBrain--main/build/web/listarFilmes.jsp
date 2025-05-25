<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bean.Filme" %>
<%@ page import="com.bean.Usuario" %>
<%
    List<Filme> adminFilmes = (List<Filme>) request.getAttribute("adminFilmes");
    List<Filme> userFilmes = (List<Filme>) request.getAttribute("userFilmes");
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuario");
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Meus Filmes Favoritos</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
     <link rel="stylesheet" href="assets/css/style.css">
    <script src="assets/js/script.js" defer></script>
</head>
<body class="text-white">
    <div class="stars"></div>

    <nav class="navbar navbar-expand-lg navbar-dark bg-black shadow">
        <div class="container">
            <a class="navbar-brand fw-bold" href="home.jsp">🧠 Meu Cérebro</a>
            <div class="ms-auto d-flex gap-2">
                <a href="FilmeServlet?action=novo" class="btn btn-success fw-bold">+ Novo Filme</a>
                <a href="listarMusicas.jsp" class="btn btn-outline-light fw-bold">🎵 Músicas</a>
                <a href="home.jsp" class="btn btn-outline-light fw-bold">🏠 Home</a>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h2 class="text-center neon-title mb-4">🎬 Meus Filmes Favoritos</h2>

        <table class="table table-dark-custom table-hover table-bordered text-center align-middle rounded-3 overflow-hidden shadow-lg">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Título</th>
                    <th>Gênero</th>
                    <th>Nota</th>
                    <th>Descrição</th>
                    <th>Origem</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <% if ((adminFilmes == null || adminFilmes.isEmpty()) && (userFilmes == null || userFilmes.isEmpty())) { %>
                <tr>
                    <td colspan="7">Nenhum filme cadastrado ainda.</td>
                </tr>
                <% } else { 
                    if (adminFilmes != null && !adminFilmes.isEmpty()) {
                        for (Filme f : adminFilmes) {
                %>
                <tr>
                    <td><%= f.getId() %></td>
                    <td><%= f.getTitulo() %></td>
                    <td><%= f.getGenero() %></td>
                    <td><%= f.getNota() %></td>
                    <td><%= f.getDescricao() %></td>
                    <td><strong>Filme do Administrador</strong></td>
                    <td>
                        <a href="FilmeServlet?action=editar&id=<%= f.getId() %>" class="btn btn-sm btn-warning fw-bold me-1">Editar</a>
                        <a href="FilmeServlet?action=excluir&id=<%= f.getId() %>" class="btn btn-sm btn-danger fw-bold" onclick="return confirm('Tem certeza que deseja apagar este filme?');">Excluir</a>
                    </td>
                </tr>
                <% } } 
                    if (userFilmes != null && !userFilmes.isEmpty()) {
                        for (Filme f : userFilmes) {
                %>
                <tr>
                    <td><%= f.getId() %></td>
                    <td><%= f.getTitulo() %></td>
                    <td><%= f.getGenero() %></td>
                    <td><%= f.getNota() %></td>
                    <td><%= f.getDescricao() %></td>
                    <td><strong>Filme sugerido por um usuário</strong></td>
                    <td>
                        <% if (usuarioLogado != null && (usuarioLogado.getEmail().equals("admin@admin.com") || usuarioLogado.getId() == f.getUsuarioId())) { %>
                        <a href="FilmeServlet?action=editar&id=<%= f.getId() %>" class="btn btn-sm btn-warning fw-bold me-1">Editar</a>
                        <a href="FilmeServlet?action=excluir&id=<%= f.getId() %>" class="btn btn-sm btn-danger fw-bold" onclick="return confirm('Tem certeza que deseja apagar este filme?');">Excluir</a>
                        <% } else { %>
                        <span class="text-muted">Sem permissão</span>
                        <% } %>
                    </td>
                </tr>
                <% } } } %>
            </tbody>
        </table>
    </div>

    <footer class="text-center text-light py-3 mt-auto">
        <hr class="bg-light">
        <p class="mb-1">🧬 <em>Sabia que uma lembrança musical pode ativar mais áreas do cérebro do que qualquer outro estímulo?</em></p>
        <small>© 2025 Meu Cérebro, Meu Universo — desenvolvido com criatividade e ciência por RAISSA ANUNCIAÇÃO.</small>
    </footer>
</body>
</html>