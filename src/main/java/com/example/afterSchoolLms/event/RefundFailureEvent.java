package com.example.afterSchoolLms.event;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class RefundFailureEvent {
	private final int enrollmentId;
	private final String errorMessage;
}
