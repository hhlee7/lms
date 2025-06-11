package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VehiclePassenger {
	private int passengerId;
	private int assignmentId;
	private int paymentId;
	private String checkedAt;
}
