package com.example.afterSchoolLms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@AllArgsConstructor
@Getter
public class MetricDto {
    private double currentValue;
    private double maxValue;
    private String description;
}
