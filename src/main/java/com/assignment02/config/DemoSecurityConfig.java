package com.assignment02.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {
	
    private final CustomAuthenticationFailureHandler customAuthenticationFailureHandler;
    
    
	public DemoSecurityConfig(CustomAuthenticationFailureHandler customAuthenticationFailureHandler) {
		this.customAuthenticationFailureHandler = customAuthenticationFailureHandler;
	}


	@Bean
    public UserDetailsService userDetailsService() {
        return new UserDetailsServiceImpl();
    }
    
	
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
     
    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());
         
        return authProvider;
    }
 
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
    }
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.csrf().disable()
		.authorizeRequests()
			.antMatchers("/resources/**").permitAll()
			.antMatchers("/user/list-post").hasAuthority("ROLE_COMPANY")
            .antMatchers("/user/get-list-apply", "/user/get-list-company").hasAuthority("ROLE_CANDIDATE")
			.antMatchers("/detail-company/**", "/listUser/**").hasAuthority("ROLE_COMPANY")
			.antMatchers("/recruitment/detail-company/**", "/recruitment/category/**", "/company/detail-company/**", "/recruitment/detail/**").permitAll()
			.antMatchers("/listjob/**", "/auth/register/**", "/", "/recruitment/search/**", "/recruitment/searchaddress/**", "/company/search/**").permitAll()
			.antMatchers("/profile/**").authenticated()
//			.antMatchers("/auth/register").permitAll() 
//            .antMatchers("/auth/register/**").permitAll()
//			.antMatchers("/").permitAll()
			.anyRequest().authenticated()
			.and()
			.formLogin()
				.loginPage("/showMyLoginPage")
				.loginProcessingUrl("/auth/login")
				.defaultSuccessUrl("/", true)
//				.failureUrl("/login?error=true")
				.permitAll()
			.and()
			.logout()
				.logoutUrl("/logout")
	            .logoutSuccessUrl("/") 
	            .invalidateHttpSession(true) 
	            .clearAuthentication(true) 
	            .deleteCookies("JSESSIONID", "remember-me")
	            .permitAll()
			.and()
			.exceptionHandling().accessDeniedPage("/access-denied");
	}
}
