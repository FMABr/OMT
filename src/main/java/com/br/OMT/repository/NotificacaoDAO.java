/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.OMT.repository;

import com.br.OMT.hibernate.HibernateFactory;
import com.br.OMT.hibernate.HibernateUtil;
import com.br.OMT.model.Notificacao;
import com.br.OMT.model.Usuario;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 *
 * @author daniela
 */
public class NotificacaoDAO {
  HibernateUtil<Notificacao> hude;
    private Session s;

    public NotificacaoDAO() {
        hude = new HibernateUtil<>();
    }

    public String salvar(Notificacao de) {
        return hude.salvar(de);
    }

    public String atualizar(Notificacao de) {
        return hude.atualizar(de);
    }
    
    public List<Notificacao> listarTudo() {
        List<Notificacao> le = null;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from Notificacao n");
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
    
    public List<Notificacao> listarNotificacaoUsuario(Usuario u) {
        List<Notificacao> le = null;
        try {
            s = HibernateFactory.getSessionFactory().openSession();
            s.beginTransaction();
            Query query = s.createQuery("from Notificacao n where n.destinatario =:u").setParameter("u", u);
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
    
    public String deletar(Notificacao de) {
        return hude.deletar(de);
    }   
}
