<%-- 
    Document   : vaga_trabalho
    Created on : 12/06/2019, 22:03:04
    Author     : daniela
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Observatório Mundo do Trabalho - Vaga de cursos</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <jsp:include page="../header.jsp" />

        <main>
            <div class="container-fluid">

                <div class="row justify-content-center">
                    <div class="col-lg-2"> 
                        <jsp:include page="perfil_flutuante.jsp"/>
                        <br>
                    </div>
                    <div class="col-lg-8">
                        <ul class="nav nav-tabs nav-justified green darken-1" role="tablist">
                            <li class="nav-item">
                                <a href="index.jsp" class="nav-link">
                                    <i class="fas fa-home fa-lg"></i>
                                    Página Inicial
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="evento.jsp" class="nav-link">
                                    <i class="fas fa-calendar-check fa-lg"></i>
                                    Eventos
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="vaga_trabalho.jsp" class="nav-link">
                                    <i class="fas fa-briefcase fa-lg"></i> 
                                    Vagas
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="curso.jsp" class="nav-link active">
                                    <i class="fa fa-chalkboard-teacher fa-lg"></i>
                                    Cursos
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="discente.jsp" class="nav-link">
                                    <i class="fa fa-user-graduate fa-lg"></i>
                                    Egresso
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="#" class="nav-link" data-toggle="tab" role="tab">
                                    <i class="fa fa-university fa-lg"></i>
                                    Campus
                                </a>
                            </li>
                        </ul>

                        <div class="tab-content card mb-5">
                            <div class="tab-pane fade in show active" id="graficos" role="tabpanel">
                                <div class="card px-4 py-4">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <h3 class="font-weight-bold">Cursos de sua empresa</h3>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row justify-content-end">
                                                <a class="btn btn-green" href="../crud_cursos/cadastro.jsp"><i class="fa fa-plus"></i> Novo curso</a>
                                            </div>
                                        </div> 
                                    </div>
                                    <div class="mr-3 ml-3 mt-3">
                                        <table class="table table-sm table-striped table-bordered table-hover" id="filtro">
                                            <caption>Lista de cursos de sua empresa</caption>
                                            <thead>
                                                <tr class="auto">
                                                    <th>Nome<i class="fa fa-sort float-right"></i></th>
                                                    <th>Nível<i class="fa fa-sort float-right"></i></th>
                                                    <th>Quantidade de Vagas<i class="fa fa-sort float-right"></i></th>
                                                    <th>Ação<i class="fa fa-sort float-right"></i></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Informática básica</td>               
                                                    <td>Subsequente</td>
                                                    <td>20</td>
                                                    <td>
                                                        <a class="blue-text">Ver mais</a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tfoot>

                                                <tr class="auto">
                                                    <th>Profissão</th>
                                                    <th>Salário</th>
                                                    <th>Quantidade de Vagas</th>
                                                    <th>Ação</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../footer.jsp" />
    </body>
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/mdb.min.js"></script>
    <script src="../js/general.js"></script>
    <script src="../js/jquery.mask.min.js"></script>
    <script src="../js/mascaras.js"></script>
    <script src="../js/addons/datatables.min.js"></script>
    <script src="../js/filtro/filtro.js"></script>
    <script src="../js/funcao_back/volta_atualiza.js"></script>
</html>
