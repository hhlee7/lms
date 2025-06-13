package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VehicleAssignment {
	private int assignmentId;
	private Integer lectureId;	// [윤성권] null 값을 허용 시키려고 수정함
	private int vehicleId;
	private String driverId;
	private String location;
	private String assignedAt;
}
