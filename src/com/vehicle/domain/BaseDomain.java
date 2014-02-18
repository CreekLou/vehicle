package com.vehicle.domain;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

public class BaseDomain implements Serializable {
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
