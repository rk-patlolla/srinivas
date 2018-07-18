package com.springmvcexample.utils;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

@Configuration
public class MessageConfiguration {
	 @Bean
     public MessageSource messageSource() {
         ReloadableResourceBundleMessageSource bean = new ReloadableResourceBundleMessageSource();
         bean.setBasename("classpath:messages");
         bean.setDefaultEncoding("UTF-8");
         return bean;
     }

     @Bean
     public LocalValidatorFactoryBean validator() {
         LocalValidatorFactoryBean bean = new LocalValidatorFactoryBean();
         bean.setValidationMessageSource(messageSource());
         return bean;
     }

}
