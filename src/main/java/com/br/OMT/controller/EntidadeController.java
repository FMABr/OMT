package com.br.OMT.controller;

import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.br.OMT.data.model.Entidade;

@Controller
public class EntidadeController {

	@GetMapping({"/e", "/e/{entidade}", "/entidade/{entidade}", "/empresa/{entidade}"})
	public String entidade(@PathVariable Optional<String> entidade) {
		if(entidade.isPresent()) {
			return "";
		} else {
			return "";
		}
	}
	
	@GetMapping({"/cadastro/entidade", "/cadastro/empresa"})
	public String novaEntidade() {
		return "";
	}

	@PostMapping({"/e","/entidade", "/empresa"})
	public String cadastrar(@ModelAttribute Entidade entidade) {
		return "";
	}
}
