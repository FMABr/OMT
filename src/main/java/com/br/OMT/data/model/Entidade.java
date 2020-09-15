package com.br.OMT.data.model;

import java.util.List;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Entidade {

	@Id
	@GeneratedValue
	private UUID id;

	@Column(nullable = false, length = 14, unique = true)
	private String cnpj;

	@Column(nullable = false, length = 50)
	private String cnae;

	@Column(nullable = false, length = 120)
	private String nome;

	@Column(nullable = false, length = 120)
	private String nomeFantasia;

	@Column(length = 60)
	private String atividadeFoco;

	@Column(length = 16)
	private String telefone;

	@Column(length = 80)
	private String email;

	@OneToOne(cascade = CascadeType.ALL, optional = false, orphanRemoval = true)
	private Endereco endereco;

	@OneToMany(mappedBy = "", cascade = { CascadeType.PERSIST, CascadeType.MERGE,
			CascadeType.REMOVE }, orphanRemoval = true)
	private List<Funcionario> funcionarios;

	@OneToMany(mappedBy = "", cascade = { CascadeType.PERSIST, CascadeType.MERGE,
			CascadeType.REMOVE }, orphanRemoval = true)
	private List<Trabalho> trabalhos;

	@OneToMany(mappedBy = "", cascade = CascadeType.ALL)
	private List<Evento> eventos;
}
