<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String senhaDigitada = request.getParameter("senha");
    String SENHA_PADRAO = "123456"; // mesma senha do Android
    
    if (SENHA_PADRAO.equals(senhaDigitada)) {
        session.setAttribute("funcionarioLogado", "true");
        response.sendRedirect("funcionarios.jsp");
    } else {
        response.sendRedirect("loginFuncionarios.jsp?erro=senha_incorreta");
    }
%>