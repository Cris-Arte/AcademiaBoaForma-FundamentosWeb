package br.com.academia.controller;

import br.com.academia.model.Cliente;
import br.com.academia.dao.ClienteDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class CadastroServlet
 */
@WebServlet("/cadastro")

public class CadastroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastroServlet() {
        super();
     }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//pega os dados do formulário
		String nome = request.getParameter("nome");
		String telefone = request.getParameter("telefone");
		String plano = request.getParameter("plano");
		
		//cria o objeto cliente a tendo como referencia a classe Cliente do arquivo Cliente.java
		Cliente cliente = new Cliente (nome, telefone, plano);
		
		//Salvar no banco de dados
		ClienteDAO clienteDAO = new ClienteDAO();
		clienteDAO.addCliente(cliente);
		
		//redireciona para página de sucesso
		response.sendRedirect("cadastroSucesso.jsp");
	}
}
