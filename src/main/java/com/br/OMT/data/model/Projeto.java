package com.br.OMT.data.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Projeto {

	@Id
	@GeneratedValue
	private Long id;

	@Column(nullable = false, length = 50)
	private String nome;

	@Column(nullable = false, length = 100)
	private String descricao;

	@ManyToOne
	@JoinColumn(name = "discente")
	private Discente discente;
}
