<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.com.academia.dao.ClienteDAO" %>
<%@ page import="br.com.academia.model.Cliente" %>
<%@ page import="java.util.List" %>
<%
    // Verifica se o funcionário está logado
    if (session.getAttribute("funcionarioLogado") == null) {
        response.sendRedirect("loginFuncionarios.jsp");
        return;
    }

    ClienteDAO clienteDAO = new ClienteDAO();
    List<Cliente> clientes = null;
    String mensagem = "";
    
    // Ação: Excluir cliente
    String acao = request.getParameter("acao");
    String idExcluir = request.getParameter("id");
    
    if ("excluir".equals(acao) && idExcluir != null) {
        try {
            int id = Integer.parseInt(idExcluir);
            clienteDAO.excluirCliente(id);
            mensagem = "Cliente excluído com sucesso!";
        } catch (Exception e) {
            mensagem = "Erro ao excluir cliente: " + e.getMessage();
        }
    }
    
    // Carrega a lista de clientes
    clientes = clienteDAO.listarClientes();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Área Funcionários - Academia Boa Forma</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .lista-clientes {
            max-width: 800px;
            margin: 20px auto;
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .cliente-item {
            padding: 15px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .cliente-item:last-child {
            border-bottom: none;
        }
        
        .cliente-info {
            flex-grow: 1;
        }
        
        .cliente-nome {
            font-weight: bold;
            font-size: 1.1em;
            color: #333;
        }
        
        .cliente-detalhes {
            color: #666;
            font-size: 0.9em;
            margin-top: 5px;
        }
        
        .btn-excluir {
            background: #ff6b6b;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.9em;
        }
        
        .btn-excluir:hover {
            background: #ff5252;
        }
        
        .sem-clientes {
            text-align: center;
            padding: 40px;
            color: #666;
            font-style: italic;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Academia Boa Forma</h1>
        <p>Área de Funcionários - Gerenciar Clientes</p>
    </div>

    <div style="text-align: center; margin: 20px;">
        <a href="funcionarios.jsp"><button>Atualizar Lista</button></a>
        <a href="cadastroForm.jsp"><button>Cadastrar Novo Cliente</button></a>
        <a href="index.jsp"><button>Voltar para Home</button></a>
    </div>

    <% if (!mensagem.isEmpty()) { %>
        <div class="mensagem sucesso" style="max-width: 800px; margin: 20px auto;">
            <%= mensagem %>
        </div>
    <% } %>

    <div class="lista-clientes">
        <h2 style="text-align: center; margin-bottom: 20px;">Clientes Cadastrados</h2>
        
        <% if (clientes == null || clientes.isEmpty()) { %>
            <div class="sem-clientes">
                Nenhum cliente cadastrado.
            </div>
        <% } else { %>
            <% for (Cliente cliente : clientes) { %>
                <div class="cliente-item">
                    <div class="cliente-info">
                        <div class="cliente-nome"><%= cliente.getNome() %></div>
                        <div class="cliente-detalhes">
                            Plano: <%= cliente.getPlano() %> | Telefone: <%= cliente.getTelefone() %>
                        </div>
                    </div>
                    <div>
                        <a href="funcionarios.jsp?acao=excluir&id=<%= cliente.getId() %>" 
                           onclick="return confirm('Tem certeza que deseja excluir <%= cliente.getNome() %>?')">
                            <button class="btn-excluir">Excluir</button>
                        </a>
                    </div>
                </div>
            <% } %>
        <% } %>
    </div>
</body>
</html>