<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Array de imagens
    String[] imagens = {
        "imagens/pilates1.jpg",
        "imagens/pilates2.jpg", 
        "imagens/pilates3.jpg",
        "imagens/pilates4.jpg",
        "imagens/pilates5.jpg"
    };
    
    //pega o parâmetro da URL
    String acao = request.getParameter("acao");
    int imagemAtual = 0;
    
    // Tenta pegar o índice da sessão, se não existir, começa em 0
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
    <title>Pilates - Academia Boa Forma</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="header">
        <h1>Academia Boa Forma</h1>
        <p>Aulas de Pilates</p>
    </div>

    <!-- GALERIA -->
    <div class="galeria-container">
        <div class="galeria">
            <!-- Botão Anterior -->
            <a href="pilates.jsp?acao=anterior&index=<%= imagemAtual %>">
                <button class="seta seta-esquerda">
                	<img alt="Voltar" src="imagens/setaesquerda.png">
                </button>
            </a>
            
            <!-- Imagem Atual -->
            <div class="imagem-container">
                <img src="<%= imagens[imagemAtual] %>" alt="Aula de Pilates">
                <div class="contador"><%= (imagemAtual + 1) %> / <%= imagens.length %></div>
            </div>
            
            <!-- Botão Próximo -->
            <a href="pilates.jsp?acao=proximo&index=<%= imagemAtual %>">
                <button class="seta seta-direita">
                	<img alt="Voltar" src="imagens/setadireita.png">
                </button>
            </a>
        </div>
        
        <div class="descricao">
            Pilates: Alongamento, fortalecimento e consciência corporal
        </div>
    </div>

    <div style="text-align: center; margin-top: 20px;">
        <a href="cadastroForm.jsp"><button>Fazer Cadastro</button></a>
        <a href="index.jsp"><button>Voltar para Home</button></a>
    </div>
</body>
</html>