package com.example.afterSchoolLms.exception;

import lombok.Getter;

@Getter
public class RefundProcessException extends RuntimeException {
	private final int enrollmentId;
	
	public RefundProcessException(int enrollment, String message) {
		super(message);
		this.enrollmentId = enrollment;
	}
}
