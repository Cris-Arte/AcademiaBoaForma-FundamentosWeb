<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String[] imagens = {
        "imagens/treinos1.jpg",
        "imagens/treinos2.jpg",
        "imagens/treinos3.jpg",
        "imagens/treinos4.jpg",
        "imagens/treinos5.jpg"
    };
    
    String acao = request.getParameter("acao");
    int imagemAtual = 0;
    
    try {
        imagemAtual = Integer.parseInt(request.getParameter("index"));
    } catch (Exception e) {
        imagemAtual = 0;
    }
    
    if ("proximo".equals(acao)) {
        imagemAtual++;
        if (imagemAtual >= imagens.length) {
            imagemAtual = 0;
        }
    } else if ("anterior".equals(acao)) {
        imagemAtual--;
        if (imagemAtual < 0) {
            imagemAtual = imagens.length - 1;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Treinos - Academia Boa Forma</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="header">
        <h1>Academia Boa Forma</h1>
        <p>Treinos de Musculação</p>
    </div>

    <div class="galeria-container">
        <div class="galeria">
            <a href="treinos.jsp?acao=anterior&index=<%= imagemAtual %>">
                <button class="seta seta-esquerda">◀</button>
            </a>
            
            <div class="imagem-container">
                <img src="<%= imagens[imagemAtual] %>" alt="Treino de Musculação">
                <div class="contador"><%= (imagemAtual + 1) %> / <%= imagens.length %></div>
            </div>
            
            <a href="treinos.jsp?acao=proximo&index=<%= imagemAtual %>">
                <button class="seta seta-direita">▶</button>
            </a>
        </div>
        
        <div class="descricao">
            Treinos: Musculação, cardio e hipertrofia
        </div>
    </div>

    <div style="text-align: center; margin-top: 20px;">
        <a href="cadastroForm.jsp"><button>Fazer Cadastro</button></a>
        <a href="index.jsp"><button>Voltar para Home</button></a>
    </div>
</body>
</html>