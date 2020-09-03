/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.repository;

import com.br.OMT.hibernate.HibernateFactory;
import com.br.OMT.hibernate.HibernateUtil;
import com.br.OMT.model.FormacaoEmCampus;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 *
 * @author vinic
 */
public class FormacaoEmCampusDAO{

    HibernateUtil<FormacaoEmCampus> hufec;
    Session s;

    public FormacaoEmCampusDAO() {
        HibernateFactory.initSessionFactory();
        hufec = new HibernateUtil<>();
    }

    public String salvar(FormacaoEmCampus fec) {
        return hufec.salvar(fec);
    }

    public String atualizar(FormacaoEmCampus fec) {
        return hufec.atualizar(fec);
    }

    public String deletar(FormacaoEmCampus fec) {
        return hufec.deletar(fec);
    }
    
    public FormacaoEmCampus procurarPorID(Long id){
        FormacaoEmCampus le = null;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from FormacaoEmCampus fec where fec.discente.id =:id");
            query.setParameter("id", id);
            le = (FormacaoEmCampus) query.getSingleResult();
            s.getTransaction().commit();
            return le;
        } catch (HibernateException ex) {
            s.getTransaction().rollback();
            return null;
        } finally {
            s.close();
        }
    }
}
