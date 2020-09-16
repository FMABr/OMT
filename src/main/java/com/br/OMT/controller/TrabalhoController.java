package com.br.OMT.controller;

import java.security.Principal;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.br.OMT.data.model.Trabalho;

public class TrabalhoController {

	@GetMapping({"/trabalho", "/oferta"})
	public String trabalhos(Principal principal) {
		return "";
	}
	
	@GetMapping({"/cadastro/trabalho", "/cadastro/oferta"})
	public String novoTrabalho() {
		return "";
	}

	@PostMapping({"/trabalho", "/oferta"})
	public String cadastrar(@ModelAttribute Trabalho trabalho) {
		return "";
	}
}
