package com.br.OMT.data.model;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Trabalho {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false, length = 50)
	private String posição;

	@Column(nullable = false)
	private Double salario;

	@Column(nullable = false)
	private String descricao;

	@Column(nullable = false)
	private int vagas;

	@Column(nullable = false)
	private boolean disponivel;

	@Column(nullable = false)
	private LocalDateTime inicio;

	@Column(nullable = false)
	private LocalDateTime fim;

	@ManyToMany(mappedBy = "inscricoes")
	private List<Discente> candidatos;

	@OneToMany(mappedBy = "trabalho")
	private List<Discente> aprovados;

	@ManyToOne
	private Entidade entidade;
}