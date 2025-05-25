<%-- 
    Document   : formFilme.jsp
    Criado por : Raissa
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Login | Meu Cérebro, Meu Universo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="assets/js/script.js" defer></script>
</head>
<body class="index-body">
    <div class="stars"></div>

    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">🧠 Meu Universo</a>
            <div class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Início</a></li>
                    <li class="nav-item"><a class="nav-link" href="cadastro.jsp">Cadastrar</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container d-flex justify-content-center align-items-center" style="height: 90vh;">
        <div class="col-md-6 p-4 rounded" style="background-color: rgba(0, 0, 0, 0.8); border: 1px solid #6f42c1;">
            <h2 class="text-center mb-3">Entrar no Universo</h2>
            <p class="text-center text-light fst-italic mb-4">Ao acessar, você está cruzando a sinapse da minha mente para explorar memórias, arte e emoção.</p>

            <% String erro = request.getParameter("erro");
               if (erro != null) {
                   String msg = "";
                   if ("1".equals(erro)) {
                       msg = "E-mail ou senha inválidos.";
                   } else if ("2".equals(erro)) {
                       msg = "Erro interno ao tentar realizar login.";
                   }
            %>
                <div class="alert alert-danger text-center"><%= msg %></div>
            <% } %>

            <form action="LoginServlet" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label text-light">E-mail:</label>
                    <input type="email" class="form-control" id="email" name="email" required placeholder="seu@email.com">
                </div>
                <div class="mb-3">
                    <label for="senha" class="form-label text-light">Senha:</label>
                    <input type="password" class="form-control" id="senha" name="senha" required placeholder="********">
                </div>
                <button type="submit" class="btn btn-primary w-100">Acessar</button>
            </form>
        </div>
    </div>
</body>
</html>
