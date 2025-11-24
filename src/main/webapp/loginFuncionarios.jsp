<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String erro = request.getParameter("erro");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Funcionários - Academia Boa Forma</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="header">
        <h1>Academia Boa Forma</h1>
        <p>Área Restrita - Funcionários</p>
    </div>

    <div class="form-container">
        <h2>Acesso Restrito</h2>
        
        <% if ("senha_incorreta".equals(erro)) { %>
            <div class="mensagem erro">
                Senha incorreta! Tente novamente.
            </div>
        <% } %>
        
        <form action="verificarLogin.jsp" method="post">
            <div class="form-group">
                <label for="senha">Senha de Acesso:</label>
                <input type="password" id="senha" name="senha" required>
            </div>
            
            <button type="submit" class="btn-submit">Acessar</button>
        </form>
        
        <div style="text-align: center; margin-top: 20px;">
            <a href="index.jsp"><button>Voltar para Home</button></a>
        </div>
    </div>
</body>
</html>