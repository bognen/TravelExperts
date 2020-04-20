//********************************************//
// Dima Bognen, Jonathan Pirca, Abel Rojas, Manish Sudani
// Main configuration file
//********************************************//

package com.travelexperts.config;

import java.util.Collections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.travelexperts.security.JwtAuthFilter;
import com.travelexperts.security.JwtAuthProvider;
import com.travelexperts.security.JwtAuthenticationEntryPoint;
import com.travelexperts.security.JwtSuccessHandler;

@EnableGlobalMethodSecurity(prePostEnabled=true)
@EnableWebSecurity
@Configuration
public class TravelExpertsConfig extends WebSecurityConfigurerAdapter {
	
	//********************************************************************//
	
	@Autowired
	private JwtAuthProvider autheticationProvider;
	
	@Autowired
	private JwtAuthenticationEntryPoint entryPoint;

	@Bean
	public AuthenticationManager authenticationManager() {
		return new ProviderManager(Collections.singletonList(autheticationProvider));
	}
	
	//create a custom filter
	@Bean
	public JwtAuthFilter authTokenFilter() {
		
		JwtAuthFilter filter =new JwtAuthFilter();
		filter.setAuthenticationManager(authenticationManager());
		filter.setAuthenticationSuccessHandler(new JwtSuccessHandler());
		return filter;
		
	}
	
	//*******************************************************************//
	
	@Override
    public void configure(HttpSecurity http) throws Exception {
       http.csrf().disable().authorizeRequests()
        .antMatchers("**/auth/**").authenticated()
     //   .antMatchers("/").permitAll()
    //    .antMatchers(HttpMethod.POST,"/newuser").permitAll()
    //    .antMatchers(HttpMethod.POST, "/login").permitAll()
    //    .antMatchers(HttpMethod.POST,"/users/*").permitAll() 
    //    .antMatchers(HttpMethod.GET,"/packages/*").permitAll()
    //    .antMatchers(HttpMethod.GET,"/bookings/*").permitAll()
    //    .antMatchers(HttpMethod.GET,"/customers/*").permitAll()
        .and()
		.exceptionHandling().authenticationEntryPoint(entryPoint)
		.and()
		.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
		
		http.addFilterBefore(authTokenFilter(), UsernamePasswordAuthenticationFilter.class);	
		http.headers().cacheControl();
		
    //    .anyRequest().authenticated();
    }

}
