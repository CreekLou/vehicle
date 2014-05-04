package com.vehicle.domain;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @author louxuezheng
 */
public class BaseDomain implements Serializable {
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
