package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VehicleAssignment {
	private int assignmentId;
	private int lectureId;
	private int vehicleId;
	private String driverId;
	private String location;
	private String assignedAt;
}
