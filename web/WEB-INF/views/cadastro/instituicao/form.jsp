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
        <h1 align="center">Cadastro de instituição</h1>

        <form class="form-horizontal" method="post">
            <input type="hidden" name="id" value="${instituicao.id}">
           
            <div class="form-group <c:if test="${not empty errors.nome}">has-error has-feedback</c:if>">
                <label for="nome" class="col-sm-2 control-label">Nome:</label>
                <div class="col-sm-6">
                    <input type="text" name="nome" class="form-control" placeholder="Nome" value="${instituicao.nome}" maxlength="150" required="">
                    <c:if test="${not empty errors.nome}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.nome}"><span class="alert-danger">${errors.nome}</span></c:if>        
                </div>
            </div>

            <div class="form-group <c:if test="${not empty errors.cnpj}">has-error has-feedback</c:if>">
                <label for="cnpj" class="col-sm-2 control-label">CNPJ:</label>
                <div class="col-sm-6">
                    <input type="text" name="cnpj" class="form-control" placeholder="CNPJ" value="${instituicao.cnpj}" maxlength="20" required="">
                    <c:if test="${not empty errors.cnpj}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.cnpj}"><span class="alert-danger">${errors.cnpj}</span></c:if>
                </div>
            </div>
                
            <div class="form-group <c:if test="${not empty errors.telefone}">has-error has-feedback</c:if>">
                <label for="telefone" class="col-sm-2 control-label">Telefone:</label>
                <div class="col-sm-6">
                    <input type="text" name="telefone" class="form-control" placeholder="Telefone" value="${instituicao.telefone}" maxlength="20" required="">
                    <c:if test="${not empty errors.telefone}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.telefone}"><span class="alert-danger">${errors.telefone}</span></c:if>
                </div>
            </div>
                
            <div class="form-group <c:if test="${not empty errors.email}">has-error has-feedback</c:if>">
                <label for="email" class="col-sm-2 control-label">E-mail:</label>
                <div class="col-sm-6">
                    <input type="text" name="email" class="form-control" placeholder="E-mail" value="${instituicao.email}" maxlength="150" required="">
                    <c:if test="${not empty errors.email}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.email}"><span class="alert-danger">${errors.email}</span></c:if>
                </div>
            </div>
            
            <div class="form-group <c:if test="${not empty errors.rua}">has-error has-feedback</c:if>">
                <label for="rua" class="col-sm-2 control-label">Rua:</label>
                <div class="col-sm-6">
                    <input type="text" name="rua" class="form-control" placeholder="Rua" value="${instituicao.rua}" maxlength="150" required="">
                    <c:if test="${not empty errors.rua}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.rua}"><span class="alert-danger">${errors.rua}</span></c:if>
                </div>
            </div>

            <div class="form-group <c:if test="${not empty errors.numero}">has-error has-feedback</c:if>">
                <label for="numero" class="col-sm-2 control-label">Número:</label>
                <div class="col-sm-6">
                    <input type="text" name="numero" class="form-control" placeholder="Número" value="${instituicao.numero}" maxlength="5" required="">
                    <c:if test="${not empty errors.numero}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.numero}"><span class="alert-danger">${errors.numero}</span></c:if>
                </div>
            </div>

            <div class="form-group <c:if test="${not empty errors.bairro}">has-error has-feedback</c:if>">
                <label for="bairro" class="col-sm-2 control-label">Bairro:</label>
                <div class="col-sm-6">
                    <input type="text" name="bairro" class="form-control" placeholder="Bairro" value="${instituicao.bairro}" maxlength="150" required="">
                    <c:if test="${not empty errors.bairro}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.bairro}"><span class="alert-danger">${errors.bairro}</span></c:if>
                </div>
            </div>

            <div class="form-group <c:if test="${not empty errors.cep}">has-error has-feedback</c:if>">
                <label for="cep" class="col-sm-2 control-label">CEP:</label>
                <div class="col-sm-6">
                    <input type="text" name="cep" class="form-control" placeholder="CEP" value="${instituicao.cep}" maxlength="15" required="">
                    <c:if test="${not empty errors.cep}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.cep}"><span class="alert-danger">${errors.cep}</span></c:if>
                </div>
            </div>
             
            <div class="form-group <c:if test="${not empty errors.cidade}">has-error has-feedback</c:if>">
                <label for="cidade" class="col-sm-2 control-label">Município:</label>
                <div class="col-sm-6">
                    <input type="text" name="cidade" class="form-control" placeholder="Município" value="${instituicao.cidade}" maxlength="150" required="">
                    <c:if test="${not empty errors.cidade}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.cidade}"><span class="alert-danger">${errors.cidade}</span></c:if>
                </div>
            </div>
            <div class="form-group <c:if test="${not empty errors.estado}">has-error has-feedback</c:if>">
                <label for="estade" class="col-sm-2 control-label">Estado:</label>
                <div class="col-sm-6">
                    <input type="text" name="estado" class="form-control" placeholder="Estado" value="${instituicao.estado}" maxlength="5" required="">
                    <c:if test="${not empty errors.estado}"><span class="glyphicon glyphicon-remove form-control-feedback"></span></c:if>
                    <c:if test="${not empty errors.estado}"><span class="alert-danger">${errors.estado}</span></c:if>
                </div>
            </div>
                
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span> Cadastrar</button>
                    <button type="button" class="btn btn-danger btnCancelar"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
                </div>
            </div>
           

        </form>
        
        <jsp:include page="../../modais.jsp"/>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="<c:url value="/js/jquery.min.js"/>"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="<c:url value="/js/bootstrap.min.js"/>"></script>
        <jsp:include page="../../scripts.jsp"/>
    </body>
</html>