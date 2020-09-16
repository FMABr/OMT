package com.br.OMT.data.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Evento {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false, length = 50)
	private String nome;

	@Column(nullable = false, length = 50, unique = true)
	private String url;

	@Column(nullable = false, length = 100)
	private String descricao;

	@Column(nullable = false, length = 200)
	private String local;

	@Column(nullable = false)
	private LocalDateTime inicioInscricao;

	@Column(nullable = false)
	private LocalDateTime finalInscricao;

	@Column(nullable = false)
	private LocalDateTime inicioEvento;

	@Column(nullable = false)
	private LocalDateTime finalEvento;

	@ManyToOne(optional = false)
	@JoinColumn
	private Entidade entidade;
}
