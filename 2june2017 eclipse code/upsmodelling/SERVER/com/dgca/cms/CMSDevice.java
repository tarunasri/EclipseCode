package com.dgca.cms;

import java.util.Properties;

public class CMSDevice extends com.adventnet.nms.topodb.SnmpNode {

	private String location;

	public CMSDevice() {
		setClassname("CMSDevice");
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setProperties(Properties props) {

		String location_value = (String) props.remove("location");
		if (location_value != null) {
			location = location_value;
		}

		super.setProperties(props);
	}

	public Properties getProperties() {
		Properties props = super.getProperties();

		if (getLocation() != null) {
			props.put("location", getLocation());

		}

		return props;
	}

}
