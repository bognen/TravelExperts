package com.travelexperts.security;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.travelexperts.model.User;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
public class JwtGen {
	
	  // Variables to set token expiration
	 // Date d = new Date();
	 // Date expiry = new Date(d.getTime() + 1800000L);
	
	  public String generate(User jwtUser) {


	        Claims claims = Jwts.claims()
	                .setSubject(jwtUser.getUsername());
	        claims.put("userId", String.valueOf(jwtUser.getUserId()));
	        claims.put("customerId", jwtUser.getCustomerId());


	        return Jwts.builder()
	                .setClaims(claims)
	        //        .setExpiration(expiry)
	                .signWith(SignatureAlgorithm.HS512, "fenerbahce")
	                .compact();
	    }
}
