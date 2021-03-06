<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html;charset=ISO-8859-1" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="<c:url value="/img/logo.jpg"/>">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Asilar</title>

        <!-- Bootstrap -->
        <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/css/estilos.css"/>" rel="stylesheet">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="<c:url value="/js/html5shiv.min.js"/>"></script>
            <script src="<c:url value="/js/respond.min.js"/>"></script>
        <![endif]-->
    </head>
    <body>
        <jsp:include page="../../navusuariolista.jsp"/>
        <jsp:include page="../../barralateral.jsp"/>
        
        <ul class="breadcrumb col-sm-offset-2">
            <li><a class="breadcrumb-item" href="<c:url value="/home"/>">Home</a></li>
            <li><a class="breadcrumb-item" href="<c:url value="/cadastro/usuario/lista"/>">Usuários</a></li>
            <c:if test="${empty usuario.nome}"><li><span class="breadcrumb-item active">Novo Usuário</span></li></c:if>
            <c:if test="${not empty usuario.nome}"><li><span class="breadcrumb-item active">${usuario.nome}</span></li></c:if>
        </ul>
        
        <h1 align="center">Cadastrar Usuário</h1>

        <form class="form-horizontal col-lg-offset-2" method="post">
            <input type="hidden" name="id" value="${usuario.id}">
            <input type="hidden" name="senha" class="form-control" value="${usuario.senha}">
                    
            <div class="form-group <c:if test="${not empty errors.nome}">has-error has-feedback</c:if>">
                <label for="nome" class="col-sm-2 control-label">Nome:</label>
                <div class="col-sm-6">
                    <input type="text" name="nome" class="form-control" placeholder="Nome" value="${usuario.nome}" maxlength="60" required="">
                    <c:if test="${not empty errors.nome}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.nome}"><span class="alert-danger">${errors.nome}</span></c:if>
                </div>
            </div>
                
            <div class="form-group <c:if test="${not empty errors.usuario}">has-error has-feedback</c:if>">
                <label for="usuario" class="col-sm-2 control-label">Usuário:</label>
                <div class="col-sm-6">
                    <input type="text" name="usuario" class="form-control" placeholder="Usuário" value="${usuario.usuario}" maxlength="150" required="">
                    <c:if test="${not empty errors.usuario}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.usuario}"><span class="alert-danger">${errors.usuario}</span></c:if>
                </div>
            </div>
                
            <div class="form-group">
                <label for="rg" class="col-sm-2 control-label">RG:</label>
                <div class="col-sm-6">
                    <input type="text" name="rg" class="form-control" placeholder="RG" value="${usuario.rg}" maxlength="30" required="">
                    <c:if test="${not empty errors.rg}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.rg}"><span class="alert-danger">${errors.rg}</span></c:if>
                </div>
            </div>

            <div class="form-group <c:if test="${not empty errors.cpf}">has-error has-feedback</c:if>">
                <label for="cpf" class="col-sm-2 control-label">CPF:</label>
                <div class="col-sm-6">
                    <input type="text" name="cpf" class="form-control" placeholder="CPF" value="${usuario.cpf}" maxlength="30" required="" onfocus="$(this).mask('000.000.000-00', {reverse: true});">
                    <c:if test="${not empty errors.cpf}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.cpf}"><span class="alert-danger">${errors.cpf}</span></c:if>
                </div>
            </div>
            
            <div class="form-group">
                <label for="telfixo" class="col-sm-2 control-label">Telefone Fixo:</label>
                <div class="col-sm-6">
                    <input id="telefone" type="text" name="telfixo" class="form-control" placeholder="Telefone Fixo" maxlength="20" value="${usuario.telfixo}" required="">
                    <c:if test="${not empty errors.telfixo}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.telfixo}"><span class="alert-danger">${errors.telfixo}</span></c:if>
                </div>
            </div>

            <div class="form-group">
                <label for="celular" class="col-sm-2 control-label">Celular:</label>
                <div class="col-sm-6">
                    <input id="celular" type="text" name="celular" class="form-control" placeholder="Celular" maxlength="20" value="${usuario.celular}" required="">
                    <c:if test="${not empty errors.celular}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.celular}"><span class="alert-danger">${errors.celular}</span></c:if>
                </div>
            </div>

            <div class="form-group <c:if test="${not empty errors.email}">has-error has-feedback</c:if>">
                <label for="email" class="col-sm-2 control-label">E-Mail:</label>
                <div class="col-sm-6">
                    <input type="email" name="email" class="form-control" placeholder="E-Mail" maxlength="50" value="${usuario.email}" required="">
                    <c:if test="${not empty errors.email}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.email}"><span class="alert-danger">${errors.email}</span></c:if>
                </div>
            </div>
                
            <div class="form-group">
                <label for="tipoUsuario" class="col-sm-2 control-label">Tipo de usuário:</label>
                <div class="col-sm-6">
                    <select class="form-control" name="tipoUsuario" required="">
                        <c:if test="${empty usuario.tipoUsuario}"><option value="">Selecione...</option></c:if>
                        <option value="1" <c:if test="${usuario.tipoUsuario eq 1}"> selected </c:if>>Administrador</option>
                        <option value="2" <c:if test="${usuario.tipoUsuario eq 2}"> selected </c:if>>Gerente de Estoque</option>
                        </select>
                        <c:if test="${not empty errors.tipoUsuario}"><span class="alert-danger">${errors.tipoUsuario}</span></c:if>
                </div>
             </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span> Cadastrar</button>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-cancelar"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
                </div>
            </div>

        </form>
                        
        <jsp:include page="../../modais.jsp"/>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="<c:url value="/js/jquery.min.js"/>"></script>
        <script src="<c:url value="/js/jquery.mask.min.js"/>"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="<c:url value="/js/bootstrap.min.js"/>"></script>
        <jsp:include page="../../scripts.jsp"/>
    </body>
</html>