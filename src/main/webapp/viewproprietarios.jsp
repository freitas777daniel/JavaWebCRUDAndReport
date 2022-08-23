<!DOCTYPE html>
<%@page import="dao.ProprietarioDao"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<link rel="stylesheet" type="text/css" href="styles/styles.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="semantic/dist/semantic.min.js"></script>
<title>Visualização de Proprietários</title>
</head>
<body class="body-prop">

	<%@ page import="conexao.Conexao, model.Proprietario, java.util.*" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	

	<h1>Listagem de Proprietários</h1>
	

	<table class="ui collapsing table">
		<tr>
			<th>ID</th>
			<th>CPF-CNPJ</th>
			<th>Nome</th>
			<th>Endereço</th>
			<th style="color:blue;padding:7px">Editar</th>
			<th style="color:red;padding:7px">Excluir</th>
		</tr>
		
		<c:forEach items="${list}" var="proprietario">
			<tr>
				<td>${proprietario.id}</td>
				<td>${proprietario.cpf_cnpj}</td>
				<td>${proprietario.nome}</td>
				<td>${proprietario.endereco}</td>
				<td><a href="ProprietarioUpdate?id=${proprietario.id}">Editar</a></td>
				<td><a href="ProprietarioDelete?id=${proprietario.id}">Excluir</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	
	<a href="insertform.html">Adicionar Novo Proprietario</a><br></br>
	<a href="ProprietarioReport">Gerar Relatório</a><br><br>
	<a href="index.jsp">Voltar ao Menu Inicial</a><br><br>


</body>
</html>