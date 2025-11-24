<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String[] imagens = {
        "imagens/luta1.jpg",
        "imagens/luta2.jpg",
        "imagens/luta3.jpg",
        "imagens/luta4.jpg",
        "imagens/luta5.jpg",
        "imagens/luta6.jpg"  
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
    <title>Lutas - Academia Boa Forma</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="header">
        <h1>Academia Boa Forma</h1>
        <p>Aulas de Lutas</p>
    </div>

    <div class="galeria-container">
        <div class="galeria">
            <a href="luta.jsp?acao=anterior&index=<%= imagemAtual %>">
                <button class="seta seta-esquerda">◀</button>
            </a>
            
            <div class="imagem-container">
                <img src="<%= imagens[imagemAtual] %>" alt="Aula de Lutas">
                <div class="contador"><%= (imagemAtual + 1) %> / <%= imagens.length %></div>
            </div>
            
            <a href="luta.jsp?acao=proximo&index=<%= imagemAtual %>">
                <button class="seta seta-direita">▶</button>
            </a>
        </div>
        
        <div class="descricao">
            Lutas: Defesa pessoal, condicionamento e disciplina
        </div>
    </div>

    <div style="text-align: center; margin-top: 20px;">
        <a href="cadastroForm.jsp"><button>Fazer Cadastro</button></a>
        <a href="index.jsp"><button>Voltar para Home</button></a>
    </div>
</body>
</html>