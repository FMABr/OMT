package com.br.OMT.data.model;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.br.OMT.data.model.enumerated.EstadoCivil;
import com.br.OMT.data.model.enumerated.Raca;
import com.br.OMT.data.model.enumerated.Sexo;

@Entity
public class Discente extends Usuario {

	@Column(nullable = false, length = 40)
	private String rg;

	@Column(nullable = false, length = 11)
	private String cpf;

	@Column(length = 11)
	private String telefone;

	@Column(length = 128)
	private String lattes;

	@Column(length = 128)
	private String linkedIn;

	@Column(nullable = false)
	private LocalDate nascimento;

	@Enumerated
	private Sexo sexo;

	@Enumerated
	private EstadoCivil estadoCivil;

	@Enumerated
	private Raca raca;

	@OneToMany
	private List<Projeto> projetos;

	@OneToMany
	private List<Curso> cursos;

	@ManyToMany
	private List<Trabalho> inscricoes;

	@ManyToOne
	private Trabalho trabalho;
}
