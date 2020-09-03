/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.repository;

import com.br.OMT.hibernate.HibernateFactory;
import com.br.OMT.hibernate.HibernateUtil;
import com.br.OMT.model.Formacao;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 *
 * @author vinic e Daniela
 */
public class FormacaoDAO {

    HibernateUtil<Formacao> huf;
    Session s;

    public FormacaoDAO() {
        HibernateFactory.initSessionFactory();
        huf = new HibernateUtil<>();
    }

    public String salvar(Formacao f) {
        return huf.salvar(f);
    }

    public String atualizar(Formacao f) {
        return huf.atualizar(f);
    }

    public String deletar(Formacao f) {
        return huf.deletar(f);
    }
    
    public Formacao getById(Long id) {
        Formacao t;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from Formacao f where f.id =:id")
                    .setParameter("id", id);
            t = (Formacao) query.getSingleResult();
            s.getTransaction().commit();
            return t;
        } catch (HibernateException ex) {
            s.getTransaction().rollback();
            return null;
        } finally {
            s.close();
        }
    }
    
    public List<Formacao> listarPorID(Long id){
        List<Formacao> le = null;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from Formacao f where f.discente.id =:id");
            query.setParameter("id", id);
            le = query.getResultList();
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
