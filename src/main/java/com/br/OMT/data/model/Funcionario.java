package com.br.OMT.data.model;

import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

public class Funcionario extends Usuario {

	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	private Entidade entidade;
}
