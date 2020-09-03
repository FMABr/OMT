/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.controller;

import com.br.OMT.model.Discente;
import com.br.OMT.model.Formacao;
import com.br.OMT.repository.DiscenteDAO;
import com.br.OMT.repository.FormacaoDAO;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vinic
 */
public class FormacaoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("ISO-8859-1");
        Formacao f = Formacao.getInstance();
        FormacaoDAO fdao = new FormacaoDAO();
                   
        if (request != null) {
            String butao = request.getParameter("acao");
            if (butao.equals("cadastrar")) {
                f.setNome(request.getParameter("nome"));
                f.setEscola(request.getParameter("escola"));
                f.setAnoTermino(Integer.parseInt(request.getParameter("anofinalizacao")));
                Discente d = (Discente) request.getSession().getAttribute("usuario");
                DiscenteDAO ddao = new DiscenteDAO();
                try {
                    d = ddao.buscarById(new Long(d.getId()));
                    f.setDiscente(d);
                    String str = fdao.salvar(f);
                    if (str.equals("")) {
                        response.getWriter().println("Certo!");
                        response.sendRedirect("../OMT/feedback/sucesso.jsp");
                    } else {
                        response.sendRedirect("../OMT/feedback/erro.jsp?erro=" + str);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(FormacaoServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else if(butao.equals("alterar")){
                    String id = request.getParameter("id");
                    //id tá nulo
                    System.out.println("o id da formacao:" + id);
                    Long idLong = Long.parseLong(id);
                    f = fdao.getById(idLong);
                    f.setNome(request.getParameter("nome"));
                    f.setEscola(request.getParameter("escola"));
                    
                    f.setAnoTermino(Integer.parseInt(request.getParameter("anofinalizacao")));
                    String str;
                    try {
                        str = fdao.atualizar(f);
                        if (str.equals("")) {
                            response.sendRedirect("../OMT/feedback/atualizado.jsp");
                        } else {
                            response.sendRedirect("../OMT/feedback/erro.jsp?erro=" +str);
                        }
                    } catch (Exception ex) {
                        response.sendRedirect("../OMT/feedback/erro.jsp?erro=" +ex.getMessage());
                    }
                } else {
                    if (butao.equals("deletar")) {
                        String id = request.getParameter("id_formacao");
                        Long idLong = Long.parseLong(id);
                        f = fdao.getById(idLong);
                        fdao.deletar(f);
                        response.sendRedirect("../OMT/feedback/deletado.jsp");
                    }
                }
            }
        }
    
}
