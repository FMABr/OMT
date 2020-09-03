<%-- 
    Document   : alterar_formacao
    Created on : 02/12/2019, 19:21:41
    Author     : Daniela Ferreira
--%>
<%@page pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.br.OMT.model.Formacao"%>
<%@page import="com.br.OMT.repository.FormacaoDAO"%>
<jsp:useBean id="FormacaoDAO" class="com.br.OMT.repository.FormacaoDAO"/>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Alterar Forma��o</title>
        <link rel="stylesheet" href="../../../css/bootstrap.css"/>
        <link rel="stylesheet" href="../../../css/mdb.css"/>
        <link rel="stylesheet" href="../../../css/fontawesome-all.css">
        <link rel="stylesheet" href="../../../css/style.css">
    </head>
    <body>
        <jsp:include page="../../../header.jsp"/>
        <main>
            <div class="container-fluid col-lg-8">
                <nav class="navbar navbar-expand-lg navbar-light green darken-1">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a href="javascript:history.back()" class="nav-link text-white">
                                <i class="fa fa-arrow-alt-circle-left fa-lg"></i>
                                Voltar
                            </a>
                        </li>
                    </ul>
                </nav>
                <%
                            Formacao f = Formacao.getInstance();
                            FormacaoDAO fDAO = new FormacaoDAO();
                            f = fDAO.getById(Long.parseLong(request.getParameter("id")));
                        %>

                <div class="card px-4 py-4">
                    <form id="cadastrar-formacao" method="post" action="/OMT/FormacaoServlet">
                        <h3 class="font-weight-bold mb-4">Alterar Forma��o</h3>
                        <div class="form-group">
                            <label for="nome">Nome</label>
                            <input class="form-control validate" value="<%=f.getNome()%>" id="nome" name="nome" type="text">
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-8">
                                <label for="escola">Escola ou Instituto</label>
                                <input class="form-control validate" value="<%=f.getEscola()%>" id="escola" name="escola" type="text">
                            </div>
                            <div class="form-group col-lg-4">
                                <label>Ano de finaliza��o</label>
                                <select class="form-control" name="anofinalizacao" id="anofinalizacao" aria-described-by="infoAnoFinalizacao">
                                    <option value="<%=f.getAnoTermino()%>" selected><%=f.getAnoTermino()%></option>
                                </select>
                                <small id="infoAnoFinalizacao" class="form-text text-muted">
                                    Ano em que concluiu a forma��o
                                </small>
                            </div>
                            <input class="form-control" id="id" type="hidden" name="id" value="<%=f.getId()%>" readonly>
                        </div>
                        <div class="text-right">
                            <button type="submit" name="acao" value="alterar" class="btn btn-md btn-green waves-effect">
                                <i class="fa fa-edit fa-lg"></i>Alterar</button>
                            <button type="reset" class="btn btn-md btn-grey waves-effect"><i class="fas fa-eraser mr-1"></i>Limpar</button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
        <jsp:include page="../../../footer.jsp"/>
        <script src="../../../js/jquery-3.3.1.min.js"></script>
        <script src="../../../js/popper.min.js"></script>
        <script src="../../../js/bootstrap.js"></script>
        <script src="../../../js/mdb.min.js"></script>
        <script src="../../../js/general.js"></script>
        <script src="../../../js/jquery.mask.min.js"></script>
        <script src="../../../js/mascaras.js"></script>
        <script>
            $(document).ready(function () {
                var date = new Date();
                while (date.getFullYear() >= 1930) {
                    var x = document.getElementById("anofinalizacao");
                    var option = document.createElement("option");
                    option.text = date.getFullYear();
                    option.value = date.getFullYear();
                    x.add(option);
                    date.setFullYear(date.getFullYear() - 1);
                }
                $('select').formSelect();
            });

        </script>
    </body>
</html>

