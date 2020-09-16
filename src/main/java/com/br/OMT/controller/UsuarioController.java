package com.br.OMT.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.br.OMT.data.model.Discente;
import com.br.OMT.data.model.Funcionario;

public class UsuarioController {

	@GetMapping("/{usuario}")
	public String perfilUsuario(@PathVariable String usuario) {
		return "";
	}
	
	@PostMapping("/cadastro/discente")
	public String novoDiscente(@ModelAttribute Discente discente) {
		return "";
	}
	
	@PostMapping("/cadastro/funcionario")
	public String novoFuncionario(@ModelAttribute Funcionario funcionario) {
		return "";
	}
}
