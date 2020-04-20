package com.travelexperts.security;

import org.springframework.stereotype.Component;

import com.travelexperts.model.User;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;


@Component
public class JwtVal {
	
	private String secret = "fenerbahce";

    public User validate(String token) {

        User jwtUser = null;
        try {
            Claims body = Jwts.parser()
                    .setSigningKey(secret)
                    .parseClaimsJws(token)
                    .getBody();

            jwtUser = new User();

            jwtUser.setUsername(body.getSubject());
            jwtUser.setUserId(Integer.valueOf(String.valueOf(body.get("userId"))));
            jwtUser.setCustomerId(Integer.valueOf(String.valueOf(body.get("customerId"))));
        }
        catch (Exception e) {
            System.out.println(e);
        }

        return jwtUser;
    }
}
