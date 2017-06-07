package com.dgca.ups;

import java.util.Properties;

public class UPSDevice extends com.adventnet.nms.topodb.SnmpNode {

	// private String type;
	private String location;

	public UPSDevice() {
		setClassname("UPSDevice");
	}

	/*
	 * public String getType() { return type; }
	 * 
	 * 
	 * 
	 * 
	 * public void setType(String type) { this.type = type; }
	 */

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setProperties(Properties props) {

		/*
		 * String type_value = (String) props.remove("type"); if (type_value !=
		 * null) { type = type_value; }
		 */
		String location_value = (String) props.remove("location");
		if (location_value != null) {
			location = location_value;
		}

		super.setProperties(props);
	}

	public Properties getProperties() {
		Properties props = super.getProperties();

		/*
		 * if (getType() != null) { props.put("type", getType()); }
		 */
		if (getLocation() != null) {
			props.put("location", getLocation());

		}

		return props;
	}

}
