<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.bean.Filme, com.bean.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Filme> lista = (List<Filme>) request.getAttribute("listaFilmes");
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Sugerir Filme</title>
        <link rel="stylesheet" href="assets/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>
    <body class="bg-dark text-white index-body">
        <div class="stars"></div>

        <nav class="navbar navbar-expand-lg navbar-dark bg-black shadow">
            <div class="container-fluid">
                <a class="navbar-brand" href="home.jsp">🎬 Universo de <%= usuario.getNome() %></a>
                <div class="d-flex">
                    <a href="home.jsp" class="nav-link">Voltar</a>
                </div>
            </div>
        </nav>

        <div class="container mt-5">
            <h2 class="text-center display-5 mb-4 glow-text">🎥 Filmes sugeridos</h2>
            
            <div class="row">
                <%  
                    boolean temFilmesExibidos = false;
                    if (lista != null && !lista.isEmpty()) { 
                        for (Filme f : lista) { 
                            temFilmesExibidos = true;
                %>

                <div class="col-md-4 mb-4">
                    <div class="card bg-secondary text-white shadow-lg h-100">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title fw-bold"><%= f.getTitulo() %></h5>
                            
                            
                            <p class="card-text mb-1">🎞 <strong>Gênero:</strong> <%= f.getGenero() %></p>
                            <p class="card-text mb-1">⭐ <strong>Nota:</strong> <%= f.getNota() %></p>
                            <p class="card-text mb-1"><strong>Descrição:</strong> <%= f.getDescricao() %></p>
                            <p class="card-text"><strong>Sugerido por:</strong> <%= f.getNomeUsuario() != null ? f.getNomeUsuario() : "Administrador" %></p>

                            <div class="mt-auto d-flex justify-content-between">
                              <%--  <a href="FilmeServlet?action=editar&id=<%= f.getId() %>" class="btn btn-outline-light btn-sm">✏ Editar</a>
                                <a href="FilmeServlet?action=deletar&id=<%= f.getId() %>" class="btn btn-outline-danger btn-sm" onclick="return confirm('Tem certeza que deseja remover este filme?')">🗑 Remover</a>--%>
                                <a href="FilmeServlet?action=listar" class="btn btn-outline-light btn-sm"> Editar</a>

                            </div>
                        </div>
                    </div>
                </div>
                <% } } 

                    if (!temFilmesExibidos) { %>
                <p class="text-center">Nenhum filme sugerido ainda. Seja o primeiro a contribuir!</p>
                <% } %>
            </div>

            
            <hr class="text-white my-5">

            <div class="text-center mb-4">
                <button type="button" class="btn btn-outline-info btn-lg fw-bold glow-button" data-bs-toggle="modal" data-bs-target="#sugestaoFilmeModal">
                    🌌 Sugira um novo filme para o seu universo
                </button>
            </div>

            <div class="modal fade" id="sugestaoFilmeModal" tabindex="-1" aria-labelledby="sugestaoFilmeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content bg-dark text-white">
                        <div class="modal-header">
                            <h5 class="modal-title" id="sugestaoFilmeModalLabel">🌌 Sugira um novo filme</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="FilmeServlet" method="post">
                                <input type="hidden" name="action" value="sugerir">

                                <div class="mb-3">
                                    <label for="titulo" class="form-label">🎬 Título</label>
                                    <input type="text" class="form-control form-control-sm" id="titulo" name="titulo" required>
                                </div>

                                <div class="mb-3">
                                    <label for="genero" class="form-label">🎞 Gênero</label>
                                    <input type="text" class="form-control form-control-sm" id="genero" name="genero" required>
                                </div>

                                <div class="mb-3">
                                    <label for="nota" class="form-label">⭐ Nota (0 a 10)</label>
                                    <input type="number" class="form-control form-control-sm" id="nota" name="nota" min="0" max="10" step="0.1" required>
                                </div>

                                <div class="mb-3">
                                    <label for="descricao" class="form-label">📝 Descrição</label>
                                    <textarea class="form-control form-control-sm" id="descricao" name="descricao" rows="3" placeholder="Compartilhe por que esse filme é especial..."></textarea>
                                </div>

                                <div class="d-grid">
                                    <button type="submit" class="btn btn-outline-info btn-lg fw-bold glow-button">📤 Enviar sugestão</button>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                            </div>
                    </div>
                </div>
            </div>
            </div>
            
<footer class="text-center text-light py-3 mt-auto">
    <hr class="bg-light">
    <p class="mb-1">🧬 <em>Sabia que uma lembrança cinematográfica pode ativar mais áreas do cérebro do que qualquer outro estímulo?</em></p>
    <small>© 2025 Mente ativa, Universo Infinito — desenvolvido com criatividade e ciência por RAISSA ANUNCIAÇÃO & HECTOR BERNHARDT.</small>
</footer>
            
            
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="assets/js/script.js" defer></script>
    </body>
</html>