package com.travelexperts.service;

import com.travelexperts.model.User;
import com.travelexperts.security.JwtGen;

public class TokenService {

	private JwtGen generator;

	public TokenService(JwtGen generator) {

		this.generator = generator;
	}

	public String generate(User user) {

		return generator.generate(user);
	}

}