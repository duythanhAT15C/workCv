package com.assignment02.config;


import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.assignment02")
@PropertySource({ "classpath:persistence-mysql.properties", "classpath:application.properties" })
public class DemoAppConfig {
	@Autowired
	private Environment env;

	private static final Logger logger = LoggerFactory.getLogger(DemoAppConfig.class);

	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/view/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}

	@Bean
	public MultipartResolver multipartResolver() {
		return new CommonsMultipartResolver();
	}

	@Bean
	public DataSource securityDataSource() {
		HikariDataSource securityDataSource = new HikariDataSource();
		securityDataSource.setDriverClassName(env.getProperty("spring.datasource.driver-class-name"));
		logger.info(">>>> jdbc.url=" + env.getProperty("spring.datasource.url"));
		logger.info(">>>> jdbc.user=" + env.getProperty("spring.datasource.username"));
		securityDataSource.setJdbcUrl(env.getProperty("spring.datasource.url"));
		securityDataSource.setUsername(env.getProperty("spring.datasource.username"));
		securityDataSource.setPassword(env.getProperty("spring.datasource.password"));

		securityDataSource
				.setMinimumIdle(Integer.parseInt(env.getProperty("spring.datasource.hikari.minimum-idle", "5")));
		securityDataSource.setMaximumPoolSize(
				Integer.parseInt(env.getProperty("spring.datasource.hikari.maximum-pool-size", "20")));
		securityDataSource
				.setIdleTimeout(Integer.parseInt(env.getProperty("spring.datasource.hikari.idle-timeout", "300000")));

		return securityDataSource;
	}

}
