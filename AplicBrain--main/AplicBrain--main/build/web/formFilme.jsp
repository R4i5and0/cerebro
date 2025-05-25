<%-- 
    Document   : formFilme.jsp
    Criado por : Raissa
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bean.Filme" %>
<%
    Filme filme = (Filme) request.getAttribute("filme");
    boolean editando = (filme != null);
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title><%= editando ? "Editar Filme" : "Novo Filme" %></title>
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <script src="assets/js/script.js" defer></script>
    </head>
    <body class="bg-dark text-white index-body">

        <div class="stars"></div>

        <!-- 🌌 Navbar com navegação completa -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-black shadow">
            <div class="container">
                <a class="navbar-brand" href="home.jsp">🧠 Meu Cérebro</a>
                <div class="ms-auto d-flex gap-2">
                    <a href="home.jsp" class="btn btn-outline-light btn-sm">🏠 Home</a>
                    <a href="FilmeServlet?action=listar" class="btn btn-outline-light btn-sm">🎬 Ver Filmes</a>
                    <a href="sugerirMusica.jsp" class="btn btn-outline-light btn-sm">🎵 Músicas</a>
                </div>
            </div>
        </nav>

        <div class="container mt-5">
            <h2 class="text-center mb-4 text-info glow-text">
                <%= editando ? "✏️ Editar Filme" : "🎬 Novo Filme" %>
            </h2>

            <!-- Frase poética/científica -->
            <div class="text-center mb-4">
                <blockquote class="blockquote fst-italic px-3">
                    <p>“O cinema grava no hipocampo as emoções que as palavras não alcançam.”</p>
                </blockquote>
            </div>

            <!-- 🌠 Formulário de cadastro/edição -->
            <form action="FilmeServlet" method="post"
                  class="bg-black text-white p-4 rounded-4 shadow-lg mx-auto"
                  style="max-width: 500px;">
                <% if (editando) { %>
                <input type="hidden" name="id" value="<%= filme.getId() %>">
                <input type="hidden" name="action" value="atualizar">
                <% } else { %>
                <input type="hidden" name="action" value="inserir">
                <% } %>

                <% com.bean.Usuario usuarioLogado = (com.bean.Usuario) session.getAttribute("usuario"); %>
                <% if (usuarioLogado != null) { %>
                <input type="hidden" name="usuarioId" value="<%= usuarioLogado.getId() %>">
                <% } %>

                <div class="mb-3">
                    <label for="titulo" class="form-label">🎬 Título</label>
                    <input type="text" class="form-control form-control-sm" id="titulo" name="titulo" required
                           value="<%= editando ? filme.getTitulo() : "" %>">
                </div>

                <div class="mb-3">
                    <label for="genero" class="form-label">🎞️ Gênero</label>
                    <input type="text" class="form-control form-control-sm" id="genero" name="genero" required
                           value="<%= editando ? filme.getGenero() : "" %>">
                </div>

                <div class="mb-3">
                    <label for="nota" class="form-label">⭐ Nota (0 a 10)</label>
                    <input type="number" class="form-control form-control-sm" id="nota" name="nota" min="0" max="10" step="0.1" required
                           value="<%= editando ? filme.getNota() : "" %>">
                </div>

                <div class="mb-3">
                    <label for="descricao" class="form-label">📝 Descrição</label>
                    <textarea class="form-control form-control-sm" id="descricao" name="descricao" rows="3"
                              placeholder="O que torna este filme inesquecível?"><%= editando ? filme.getDescricao() : "" %></textarea>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-outline-info btn-lg fw-bold glow-button">
                        <%= editando ? "💾 Salvar Alterações" : "📥 Cadastrar Filme" %>
                    </button>
                </div>
            </form>

        </div>
                    
        <footer class="text-center text-light py-3 mt-auto">
            <hr class="bg-light">
            <p class="mb-1">🧬 <em>Sabia que uma lembrança musical pode ativar mais áreas do cérebro do que qualquer outro estímulo?</em></p>
            <small>© 2025 Meu Cérebro, Meu Universo — desenvolvido com criatividade e ciência por RAISSA ANUNCIAÇÃO.</small>
        </footer>

    </body>
</html>
