<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro Realizado - Academia Boa Forma</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="header">
        <h1>Academia Boa Forma</h1>
        <p>Cadastro Realizado com Sucesso!</p>
    </div>

    <div class="form-container">
        <div class="sucesso-container">
            <div class="icone-sucesso">✓</div>
            
            <div class="mensagem-sucesso">
                <h2>Parabéns! Seu cadastro foi realizado com sucesso!</h2>
                <p>Em breve nossa equipe entrará em contato para finalizar sua matrícula.</p>
            </div>
            
            <p><strong>Próximos passos:</strong></p>
            <ul class="ul-cadastroSucesso">
                <li>Apresentar documento de identidade na recepção</li>
                <li>Realizar avaliação física gratuita</li>
                <li>Definir seus objetivos com nosso personal trainer</li>
            </ul>
            
            <div style="margin-top: 30px;">
                <a href="index.jsp"><button>Voltar para Home</button></a>
                <a href="cadastroForm.jsp"><button>Fazer Novo Cadastro</button></a>
            </div>
        </div>
    </div>
</body>
</html>