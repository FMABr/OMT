/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.repository;

import com.br.OMT.hibernate.HibernateFactory;
import com.br.OMT.hibernate.HibernateUtil;
import com.br.OMT.model.CursosEspecializantes;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 *
 * @author vinic
 */
public class CursosEspecializantesDAO {

    HibernateUtil<CursosEspecializantes> huce;
    private Session s;

    public CursosEspecializantesDAO() {
        HibernateFactory.initSessionFactory();
        huce = new HibernateUtil<>();
    }

    public String salvar(CursosEspecializantes ce) {
        return huce.salvar(ce);
    }

    public String atualizar(CursosEspecializantes ce) {
        return huce.atualizar(ce);
    }

    public String deletar(CursosEspecializantes ce) {
        return huce.deletar(ce);
    }

    public List<CursosEspecializantes> listEventos() {
        List<CursosEspecializantes> le = null;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from CursosEspecializantes c");
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
