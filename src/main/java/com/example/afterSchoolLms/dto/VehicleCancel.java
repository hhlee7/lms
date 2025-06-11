package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VehicleCancel {
	private int decisionId;
	private int paymentId;
	private int assignmentId;
	private String decidedAt;
	private String cancelReason;
}
