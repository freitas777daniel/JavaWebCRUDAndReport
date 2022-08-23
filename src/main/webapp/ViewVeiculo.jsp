<!DOCTYPE html>
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
<title>Visualização de Veiculos</title>
</head>
<body class="body-prop">
	<%@page import="dao.VeiculoDao"%>
	<%@ page import="conexao.Conexao, model.Veiculo, java.util.*" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	

	<h1>Listagem de Veiculos</h1>
	

	<table class="ui collapsing table">
		<tr>
			<th>ID</th>
			<th>PLACA</th>
			<th>RENAVAM</th>
			<th>ID_PROP</th>
			<th>CPF_CNPJ_PROP</th>
			<th>NOME_PROP</th>
			<th style="color:blue;padding:7px">Editar</th>
			<th style="color:red;padding:7px">Excluir</th>
		</tr>
		
		<c:forEach items="${list}" var="veiculo">
			<tr>
				<td>${veiculo.id}</td>
				<td>${veiculo.placa}</td>
				<td>${veiculo.renavam}</td>
				<td>${veiculo.proprietario.id}</td>
				<td>${veiculo.proprietario.cpf_cnpj}</td>
				<td>${veiculo.proprietario.nome}</td>
				<td><a href="VeiculoUpdate?id=${veiculo.id}">Editar</a></td>
				<td><a href="VeiculoDelete?id=${veiculo.id}">Excluir</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<a href="InsertVeiculo.jsp">Adicionar Novo Veiculo</a><br></br>
	<a href="VeiculoReport">Gerar Relatório</a><br><br>
	<a href="index.jsp">Voltar ao Menu Inicial</a><br><br>


</body>
</html>