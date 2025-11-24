<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Cliente - Academia Boa Forma</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="header">
        <h1>Academia Boa Forma</h1>
        <p>Cadastro de Cliente</p>
    </div>

    <div class="form-container">
        <h2>Preencha seus dados</h2>
        
        <form action="cadastro" method="post">
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" required 
                       placeholder="Digite seu nome completo">
            </div>
            
            <div class="form-group">
                <label for="telefone">Telefone:</label>
                <input type="text" id="telefone" name="telefone" required 
                       placeholder="(11) 99999-9999" maxlength="15">
            </div>
            
            <div class="form-group">
                <label for="plano">Plano:</label>
                <select id="plano" name="plano" required>
                    <option value="">Selecione um plano</option>
                    <option value="Plano Mensal">Mensal - 1 x R$120</option>
                    <option value="Plano Trimestral">Trimestarl - 3 x R$110</option>
                    <option value="Plano Semestral">Semestral - 6 x R$100</option>
                    <option value="Plano Anual">Anual - 12 x R$90</option>
                </select>
            </div>
            
            <button type="submit" class="btn-submit">Cadastrar</button>
        </form>
        
        <div style="text-align: center; margin-top: 20px;">
            <a href="index.jsp"><button>Voltar para Home</button></a>
        </div>
    </div>
</body>
</html>