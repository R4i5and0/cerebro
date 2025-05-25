<%-- 
    Document   : home
    Created on : 10 de mai. de 2025, 18:51:48
    Author     : Raissa
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bean.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Bem-vindo | Meu Cérebro, Meu Universo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="assets/js/script.js" defer></script>
</head>
<body class="index-body">

<div class="stars"></div>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container-fluid">
        <a class="navbar-brand" href="home.jsp">🧠 Universo de <%= usuario.getNome() %></a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="FilmeServlet?action=home">Filmes</a></li>
                <li class="nav-item"><a class="nav-link" href="listarMusicas.jsp">Músicas</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp">Início</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container text-center text-light d-flex flex-column justify-content-center align-items-center" style="min-height: 85vh;">
    <h1 class="display-4 fw-bold glow-text">Bem-vindo, <%= usuario.getNome() %>!</h1>
    <p class="lead mt-3 mb-4" style="max-width: 700px;">
        Seu cérebro é um universo em expansão, onde filmes e músicas registram emoções, memórias e sonhos. Explore, sinta, registre.
    </p>

    <div class="d-flex flex-column flex-md-row gap-3">
        <a href="FilmeServlet?action=sugerir" class="btn btn-outline-light btn-lg px-5 py-3 shadow">🎬 Sugerir Filme</a>
        <a href="sugerirMusica.jsp" class="btn btn-outline-info btn-lg px-5 py-3 shadow">🎵 Sugerir Música</a>
    </div>
</div>

</body>
</html>
