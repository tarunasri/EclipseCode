package com.dgca.sns;

import java.util.Properties;

public class SNSDevice extends com.adventnet.nms.topodb.Node {

	private String location;

	public SNSDevice() {
		setClassname("SNSDevice");
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
