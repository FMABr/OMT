package com.br.OMT.data.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.br.OMT.data.model.enumerated.FormaCurso;

@Entity
public class Curso {
	
    @Id
    @GeneratedValue
    private Long id;
    
    @Enumerated
    private FormaCurso forma; 
    
    @Column(nullable = false, length = 80)
    private String nome;
    
    @ManyToOne
    @JoinColumn
    private Discente discente;
}
