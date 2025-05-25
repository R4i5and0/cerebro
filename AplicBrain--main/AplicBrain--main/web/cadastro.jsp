<%-- 
    Document   : formFilme
    Created on : 10 de mai. de 2025, 17:37:28
    Author     : Raissa
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro | Meu Cérebro, Meu Universo</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="assets/js/script.js" defer></script>
</head>
<body class="index-body">

<div class="stars"></div> <!-- fundo com estrelas -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">🧠 Meu Cérebro</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Início</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Entrar</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 85vh;">
    <div class="card p-5" style="width: 100%; max-width: 450px; background-color: rgba(0, 0, 0, 0.85); border: 1px solid #6f42c1;">
        <h2 class="text-center text-light mb-3">Criar uma Conta</h2>
        <p class="text-center text-light fst-italic mb-4">Ao se cadastrar, você começa a registrar seu próprio universo de lembranças e inspirações.</p>

        <!-- Mensagem de erro se houver -->
        <% String erro = request.getParameter("erro");
           if (erro != null) { %>
           <div class="alert alert-danger text-center" role="alert">
               <%= erro %>
           </div>
        <% } %>

        <form action="CadastroServlet" method="post">
            <div class="mb-3">
                <label for="nome" class="form-label text-light">Nome completo</label>
                <input type="text" name="nome" class="form-control" required placeholder="Seu nome">
            </div>
            <div class="mb-3">
                <label for="email" class="form-label text-light">E-mail</label>
                <input type="email" name="email" class="form-control" required placeholder="voce@universo.com">
            </div>
            <div class="mb-3">
                <label for="senha" class="form-label text-light">Senha</label>
                <input type="password" name="senha" class="form-control" required placeholder="********">
            </div>
            <button type="submit" class="btn btn-success w-100">Cadastrar</button>
        </form>

        <p class="mt-3 text-center text-light">
            Já tem uma conta? <a href="login.jsp" class="text-info">Entrar</a>
        </p>
    </div>
</div>

</body>
</html>
