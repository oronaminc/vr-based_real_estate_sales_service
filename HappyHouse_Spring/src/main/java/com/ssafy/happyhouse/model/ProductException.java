package com.ssafy.happyhouse.model;

import org.springframework.stereotype.Component;

@Component
public class ProductException extends RuntimeException {
	public ProductException() {
		super("오류 발생");
	}
	public ProductException(String msg) {
		super(msg);
	}
}
