package com.springmvcexample.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

@Configuration
@EnableWebSecurity
//@EnableGlobalMethodSecurity(securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Bean
	public WebFilter webFilter() {
		return new WebFilter();
	};
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	// *************************** inMemoryAuthentication********************************//
	/*
	 * @Autowired public void configureGlobal(AuthenticationManagerBuilder auth)
	 * throws Exception { auth.inMemoryAuthentication()
	 * .withUser("srinivas").password(passwordEncoder().encode("srinivas")).roles(
	 * "admin") .and() .withUser("user").password("{noop}user").roles("user"); }
	 */
	@Autowired
	DataSource dataSource;

	// ***************************jdbcAuthentication********************************//
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder())
				.usersByUsernameQuery(
						"select user_name,user_password, status_flag from group_users_details where user_name=?")
				.authoritiesByUsernameQuery("select user_name, user_role from group_users_details where user_name=?");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.csrf().disable()
		.authorizeRequests()
		.antMatchers("/adminHome", "/getGroups", "/editUser/**", "/updateUser", "/deleteUser/**","/deleteGroup/**", "/addGroup", "/getGroupForm", "/getByGroupId/**")
		.hasRole("ADMIN")
		.antMatchers("/getUsers").hasAnyRole("USER", "ADMIN").anyRequest().authenticated().and().addFilterAfter(webFilter(), BasicAuthenticationFilter.class)
		.formLogin().and().logout();

	}

}