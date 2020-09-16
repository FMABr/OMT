package com.br.OMT.controller;

import java.util.Optional;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.br.OMT.data.model.Evento;

public class EventoController {
	
	@GetMapping({"/evento", "/eventos", "/evento/{evento}", "eventos/{evento}"})
	public String evento(@PathVariable Optional<String> evento) {
		if(evento.isPresent()) {
			return "";
		} else {
			return "";
		}
	}
	
	@GetMapping({"/cadastro/evento"})
	public String novoEvento() {
		return "";
	}
	
	@PostMapping("/evento")
	public String cadastrar(@ModelAttribute Evento evento) {
		return "";
	}
}
