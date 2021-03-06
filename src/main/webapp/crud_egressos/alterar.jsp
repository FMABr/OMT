<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="DiscenteDAO" class="com.br.OMT.repository.DiscenteDAO"/>
<c:set var="discente" value="${DiscenteDAO.buscarById(param['id'])}"/>
<jsp:useBean id="IOUtils" class="org.apache.commons.io.IOUtils"/>
<jsp:useBean id="Sexo" class="com.br.OMT.utils.beans.SexoBean"/>
<jsp:useBean id="EstadoCivil" class="com.br.OMT.utils.beans.EstadoCivilBean"/>
<jsp:useBean id="Etnia" class="com.br.OMT.utils.beans.EtniaBean"/>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Discente</title>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/mdb.css"/>
        <link rel="stylesheet" href="../css/fontawesome-all.css">
        <link rel="stylesheet" href="../css/inputFotoPerfil.css">
        <link rel="stylesheet" href="../css/croppie.css" media="all" type="text/css"/>
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <jsp:include page="../header.jsp"/>
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
                
                <div class="card px-4 py-4">
                    <h3 class="font-weight-bold text-center">Alterar dados</h3>
                    <form id="formAlterar" name="formAlterar" method="post" action="#" data-id="<c:out value="${discente.id}"/>">
                        <div class="section">
                            <div class="form-row">
                                <div class="form-group col-sm-12">
                                    <div class="text-center">
                                        <c:choose>
                                            <c:when test="${fn:length(discente.foto) > 0}">
                                                <div>
                                                    <img class="foto-curriculo border border-light rounded z-depth-1" src="${IOUtils.toString(discente.foto, 'UTF-8')}">
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div>
                                                    <img class="foto-curriculo border border-light rounded z-depth-1" src="../img/student.png">
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        <button class="btn btn-md btn-primary file-btn mt-4"> 
                                            <span><i class="fa fa-image fa-lg left"></i>Selecionar foto de perfil</span> 
                                            <input type="file" id="upload" name="upload" accept="image/*" value="Selecionar foto de perfil" /> 
                                        </button> 
                                    </div>
                                </div>
                                <h5 class="mb-4">Informações Básicas</h5>
                                <div class="form-group col-sm-12 col-lg-5">
                                    <div class="form-group"> 
                                        <div class="text-center">
                                            <div class="crop"> 
                                                <div id="upload-demo"></div>
                                                <button type="button" class="upload-result btn btn-md btn-primary">
                                                    <i class="fa fa-cut fa-lg left"></i>Recortar imagem
                                                </button> 
                                            </div> 
                                        </div> 
                                    </div> 
                                </div>
                                <div class="form-group col-sm-12 col-lg-4">
                                    <div class="text-center" id="result"></div> 
                                    <input type="hidden" value="" name="fotoCortada" id="fotoCortada">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-sm-12 col-lg-8">
                                    <label for="nome">Nome Completo</label>
                                    <input class="form-control" type="text" id="nome" name="nome" value="<c:out value="${discente.nome}"/>">
                                </div>
                                <div class="form-group col-sm-12 col-lg-4">
                                    <label for="dataNasc">Data de nascimento</label>
                                    <input class="form-control data" type="text" id="dataNasc" name="dataNasc" value="<fmt:formatDate type="both" dateStyle="short" pattern="dd/MM/yyyy" value="${discente.dataNascimento}"/>">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-sm-12 col-lg-6">
                                    <label for="nomeMae">Nome da mãe</label>
                                    <input class="form-control" type="text" id="nomeMae" name="nomeMae" value="<c:out value="${discente.nomeMae}"/>">
                                </div>
                                <div class="form-group col-sm-12 col-lg-6">
                                    <label for="nomePai">Nome do pai</label>
                                    <input class="form-control" type="text" id="nomePai" name="nomePai" value="<c:out value="${discente.nomePai}"/>">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-sm-12 col-lg-4">
                                    <label for="matricula">Matrícula</label>
                                    <input class="form-control" readonly="true" type="text" name="matricula" id="matricula" maxlength="14" value="<c:out value="${discente.usuario}"/>">
                                </div>
                                <div class="form-group col-sm-12 col-lg-4">
                                    <label for="cpf">CPF</label>
                                    <input class="form-control CPF" type="text" name="cpf" id="cpf" maxlength="14" value="<c:out value="${discente.CPF}"/>">
                                </div>
                                <div class="form-group col-sm-12 col-lg-4">
                                    <label for="rg">RG</label>
                                    <input class="form-control RG" type="text" id="rg" name="rg" maxlength="8" value="<c:out value="${discente.RG}"/>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email">E-mail</label>
                                <input class="form-control" type="email" name="email" id="email" maxlength="40" value="<c:out value="${discente.email}"/>">
                            </div>
                             <div class="form-group col-md-3">
                                <label for="email">Telefone</label>
                                <input class="form-control" type="text" name="telefone" id="telefone" maxlength="11">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-sm-12 col-lg-6">
                                    <label for="linkCurriculoLattes">Link Currículo Lattes</label>
                                    <input class="form-control" type="url" name="linkCurriculoLattes" id="linkCurriculoLattes" maxlength="128" value="<c:out value="${discente.linkCurriculoLattes}"/>">
                                </div>
                                <div class="form-group col-sm-12 col-lg-6">
                                    <label for="linkPerfilLinkedIn">Link Perfil LinkedIn</label>
                                    <input class="form-control" type="url" id="linkPerfilLinkedIn" name="linkPerfilLinkedIn" maxlength="128" value="<c:out value="${discente.linkPerfilLinkedIn}"/>">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-sm-12 col-lg-4">
                                    <label for="sexo">Sexo</label>
                                    <select class="form-control" name="sexo" id="sexo" required>
                                        <c:forEach items="${Sexo.values}" var="sexo" varStatus="loop">
                                            <c:choose>
                                                <c:when test="${sexo eq discente.sexo}">
                                                    <option value="${sexo}" selected="true">${sexo}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${sexo}">${sexo}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-sm-12 col-lg-4">
                                    <label for="estadoCivil">Estado Civil</label>
                                    <select class="form-control" name="estadoCivil" id="estadoCivil" required>
                                        <c:forEach items="${EstadoCivil.values}" var="estadoCivil" varStatus="loop">
                                            <c:choose>
                                                <c:when test="${estadoCivil eq discente.estadoCivil}">
                                                    <option value="${estadoCivil}" selected="true">${estadoCivil}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${estadoCivil}">${estadoCivil}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-sm-12 col-lg-4">
                                    <label for="etnia">Etnia</label>
                                    <select class="form-control" name="etnia" id="etnia" required>
                                        <c:forEach items="${Etnia.values}" var="etnia" varStatus="loop">
                                            <c:choose>
                                                <c:when test="${etnia eq discente.etnia}">
                                                    <option value="${etnia}" selected="true">${etnia}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${etnia}">${etnia}</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="mt-4">
                            <div class="text-right">
                                <button  name="acao" value="alterar" class="btn  btn-green btn-md">
                                    <i class="fa fa-check mr-1"></i>Alterar</button>
                                <!--button type="reset" class="btn btn-md btn-grey">
                                    <i class="fa fa-eraser mr-1"></i>Limpar</button-->
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </main>
        <jsp:include page="../footer.jsp"/>
        <script src="../js/jquery-3.3.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script src="../js/mdb.min.js"></script>
        <script src="../js/general.js"></script>
        <script src="../js/jquery.mask.min.js"></script>
        <script src="../js/mascaras.js"></script>
        <script src="../js/croppie.min.js"></script>
        <script>
            $('#formAlterar').submit(function () {
                $('#cpf').unmask('000.000.000-00');
                $('#rg').unmask('00.000.000-0');
            });
            var id = $('form[name="formAlterar"]').attr("id");
            $(function () {
                var $uploadCrop;

                function readFile(input) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            $uploadCrop.croppie('bind', {
                                url: e.target.result
                            });
                        }

                        reader.readAsDataURL(input.files[0]);
                    } else {
                        alert("Sorry - you're browser doesn't support the FileReader API");
                    }
                }

                $uploadCrop = $('#upload-demo').croppie({
                    viewport: {
                        width: 150,
                        height: 200,
                        type: 'square'
                    },
                    boundary: {
                        width: 250,
                        height: 250
                    }
                });

                $('#upload').on('change', function () {
                    $(".crop").show();
                    readFile(this);
                });
                $('.upload-result').on('click', function (ev) {
                    $uploadCrop.croppie('result', 'canvas').then(function (resp) {
                        popupResult({
                            src: resp
                        });
                    });
                });

                function popupResult(result) {
                    var html;
                    if (result.html) {
                        html = result.html;
                    }
                    if (result.src) {
                        var label = "<figcaption>Foto de perfil nova</figcaption>";
                        html = '<img class="foto-curriculo border border-light rounded z-depth-1 mb-4" src="' + result.src + '" />' + label;
                    }
                    $("#result").html(html);
                    $("#fotoCortada").val(result.src);
                }
            });
        </script>
    </body>
</html>
