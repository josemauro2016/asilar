<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <li><span class="breadcrumb-item active">Cadastrados</span></li>
        </ul>


            <div class="form-group-lg">
                <form class="form-inline">
                    <div class="radio-inline ">
                        <label><input type="radio" name="presentes" value="presentes" onclick="javascript: submit()" <c:if test="${presentes eq 'presentes'}"> checked</c:if>>Presentes</label>
                        </div>
                        <div class="radio-inline">
                            <label><input type="radio" name="presentes" value="ausentes" onclick="javascript: submit()" <c:if test="${presentes eq 'ausentes'}"> checked</c:if>>Ausentes</label>
                        </div>
                        <div class="radio-inline">
                            <label><input type="radio" name="presentes" value="todos" onclick="javascript: submit()" <c:if test="${presentes eq 'todos'}"> checked</c:if>>Todos</label>
                        </div>
                        <br/>
                        <div class="form-group">
                            <label for="nome">Nome</label>
                            <input type="text" name="nome" class="form-control" placeholder="Nome">
                        </div>
                        <div class="form-group">
                            <label for="cpf">CPF:</label>
                            <input id="cpf" type="text" name="cpf" class="form-control" placeholder="CPF">
                        </div>
                        <button type="submit" class="btn btn-primary">Pesquisar</button>
                    </form>
                </div>

        


        <h1 class="col-sm-offset-2">Cadastrados</h1>

        

            <div class="col-sm-offset-2">
                <a class="btn btn-primary" href="<c:url value="/cadastro/assistido/novo"/>"><span class="glyphicon glyphicon-plus"></span> Adicionar</a>
        </div>


        <div class="table-responsive col-lg-offset-2">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Nome:</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                <c:if test="${empty assistidoList}"><h1>Não existem assistidos cadastrados!</h1></c:if>
                    <c:forEach items="${assistidoList}" var="assistido">
                        <tr>
                            <td><a href="<c:url value="/cadastro/assistido/${assistido.id}/info"/>">${assistido.nome}</a></td>
                            <td><a class="btn btn-primary" href="<c:url value="/cadastro/assistido/${assistido.id}/alterar"/>"><span class="glyphicon glyphicon-edit"></span> Alterar</a></td>
                            <td><button class="btn btn-danger" onclick="$('#confirma-exclusao').attr('href', '<c:url value="/cadastro/assistido/${assistido.id}/excluir"/>')" data-toggle="modal" data-target="#modal-confirmar"><span class="glyphicon glyphicon-trash"></span> Excluir</button></td>
                        </tr>
                    </c:forEach>
                    
                </tbody>
            </table>
            <c:if test="${count > 10}">
                <nav>
                    <ul class="pagination">
                        <li <c:if test="${offset <= 0}"> class="disabled" </c:if>>
                            <a <c:if test="${offset > 0}">href="<c:url value="/cadastro/assistido/lista?offset=${offset - 10}"/>"</c:if>aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        <c:forEach var="conta" begin="0" step="10" end="${count -1}">
                            <li <c:if test="${offset == conta}">class="active"</c:if>><a href="<c:url value="/cadastro/assistido/lista?offset=${conta}"/>"><fmt:formatNumber value="${(conta + 10) / 10}" pattern="#"/></a></li>
                            </c:forEach>
                        <li <c:if test="${offset > count - 10}"> class="disabled" </c:if>>
                            <a <c:if test="${offset < count - 10}"> href="<c:url value="/cadastro/assistido/lista?offset=${offset + 10}"/>" </c:if> aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
            </c:if>

        </div>

        <jsp:include page="../../modais.jsp"/>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="<c:url value="/js/jquery.min.js"/>"></script>
        <script src="<c:url value="/js/jquery.mask.min.js"/>"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="<c:url value="/js/bootstrap.min.js"/>"></script>
        <jsp:include page="../../scripts.jsp"/>
    </body>
</html>