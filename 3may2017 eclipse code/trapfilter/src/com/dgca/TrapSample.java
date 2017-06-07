package com.dgca;

import java.sql.Connection;
import java.sql.Statement;
import java.util.Date;
import java.util.Enumeration;
import java.util.StringTokenizer;

import com.adventnet.nms.eventdb.Event;
import com.adventnet.nms.eventdb.TrapFilter;
import com.adventnet.snmp.snmp2.SnmpAPI;
import com.adventnet.snmp.snmp2.SnmpPDU;
import com.adventnet.snmp.snmp2.SnmpVarBind;

public class TrapSample implements TrapFilter {

	private static final String CODES = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";

	private static byte[] base64Decode(String input) {
		if (input.length() % 4 != 0) {
			throw new IllegalArgumentException("Invalid base64 input");
		}
		byte decoded[] = new byte[((input.length() * 3) / 4)
				- (input.indexOf('=') > 0 ? (input.length() - input.indexOf('=')) : 0)];
		char[] inChars = input.toCharArray();
		int j = 0;
		int b[] = new int[4];
		for (int i = 0; i < inChars.length; i += 4) {
			// This could be made faster (but more complicated) by precomputing
			// these index locations.
			b[0] = CODES.indexOf(inChars[i]);
			b[1] = CODES.indexOf(inChars[i + 1]);
			b[2] = CODES.indexOf(inChars[i + 2]);
			b[3] = CODES.indexOf(inChars[i + 3]);
			decoded[j++] = (byte) ((b[0] << 2) | (b[1] >> 4));
			if (b[2] < 64) {
				decoded[j++] = (byte) ((b[1] << 4) | (b[2] >> 2));
				if (b[3] < 64) {
					decoded[j++] = (byte) ((b[2] << 6) | b[3]);
				}
			}
		}

		return decoded;
	}

	private static String base64Encode(byte[] in) {
		StringBuilder out = new StringBuilder((in.length * 4) / 3);
		int b;
		for (int i = 0; i < in.length; i += 3) {
			b = (in[i] & 0xFC) >> 2;
			out.append(CODES.charAt(b));
			b = (in[i] & 0x03) << 4;
			if (i + 1 < in.length) {
				b |= (in[i + 1] & 0xF0) >> 4;
				out.append(CODES.charAt(b));
				b = (in[i + 1] & 0x0F) << 2;
				if (i + 2 < in.length) {
					b |= (in[i + 2] & 0xC0) >> 6;
					out.append(CODES.charAt(b));
					b = in[i + 2] & 0x3F;
					out.append(CODES.charAt(b));
				} else {
					out.append(CODES.charAt(b));
					out.append('=');
				}
			} else {
				out.append(CODES.charAt(b));
				out.append("==");
			}
		}

		return out.toString();
	}

	@Override
	public Object applyTrapFilter(SnmpPDU pdu) {
		// PDU
		// we
		// are
		// getting
		// remote
		// host

		Event event = null;
		Connection conn = null;
		Statement stmt = null;
		try {
			if (pdu.getVersion() == SnmpAPI.SNMP_VERSION_2 || pdu.getVersion() == SnmpAPI.SNMP_VERSION_2C
					|| pdu.getVersion() == SnmpAPI.SNMP_VERSION_3) {

				if (pdu.getRemoteHost() == null) {
					return pdu;
				}
				if (pdu.getRemoteHost().equals("172.18.62.76")) {
					System.out.println("My Trap sample filter" + pdu.getRemoteHost());// from

					/*
					 * event = new Event(); event.setTime((new
					 * Date()).getTime()); event.setSource("172.18.62.76");
					 * event.setEntity("172.18.62.76");
					 * event.setText("FireWallsAlrt");
					 * event.setCategory("Topology");
					 * event.setSeverity(Integer.parseInt("1"));
					 * System.out.println("event object creation"); return event
					 */
					return null;

				} else if (pdu.getRemoteHost().equals("10.208.0.11")) {
					Event events = null;

					System.err.println("varbs : " + pdu.printVarBinds());
					System.err.println("==============getVariableBindings==============");
					for (Enumeration e = pdu.getVariableBindings().elements(); e.hasMoreElements();) {

						String input1 = ((SnmpVarBind) e.nextElement()).toTagString();
						System.out.println("Input1 : " + input1);
						String displayName = null;
						String description1 = null;
						String description2 = null;
						if (input1.contains("Object ID: .1.3.6.1.4.1.9.9.712.1.1.2.1.9.0")) {
							StringTokenizer stTokenizer = new StringTokenizer(input1, ":");
							if (stTokenizer.hasMoreTokens()) {
								String s = stTokenizer.nextToken();// it will
																	// print the
																	// first
																	// part
																	// before :
								displayName = stTokenizer.nextToken();// it will
																		// print
																		// after
																		// :

							}

						}
						
						/*if (input1.contains("Object ID: .1.3.6.1.4.1.9.9.712.1.1.2.1.10.0")) {
							StringTokenizer stTokenizer = new StringTokenizer(input1, ":");
							if (stTokenizer.hasMoreTokens()) {
								String s = stTokenizer.nextToken();// it will
																	// print the
																	// first
																	// part
																	// before :
								description1 = stTokenizer.nextToken();// it will
																		// print
																		// after
																		// :
								description2 = stTokenizer.nextToken();
								
								System.out.println("Description at 10.0 : " +description2 );

							}

						}*/

						if (input1.contains("Object ID: .1.3.6.1.4.1.9.9.712.1.1.2.1.12.0")) {

							String reportingAddress = input1.substring(
									input1.indexOf("reportingEntityAddress=") + "reportingEntityAddress=".length(),
									input1.indexOf("reportingEntityAddress=") + "reportingEntityAddress=".length()
											+ 12);
							if (reportingAddress.contains(",")) {

								String str[] = reportingAddress.split("\\,");
								reportingAddress = str[0];
								System.out.println("After Splitting:" + reportingAddress);

							}
							/*String description = input1.substring(
									input1.indexOf("description=") + "description=".length(),
									input1.indexOf("applicationSpecificAlarmID"));*/
							
							String description = input1.substring(
									input1.indexOf("description=") + "description=".length(),
									input1.lastIndexOf(".,"));
							System.out.println("Description at 12.0" +description);
							
							//System.out.println("Description:"+input1.substring(description.length()));

							String severity = input1.substring(input1.indexOf("severity=") + "severity=".length(),
									input1.indexOf("severity=") + "severity=".length() + 1);

							System.out.println("Severity of Cisco" + severity);
							if (severity.equals("0"))
								severity = "1";
							if (severity.equals("1"))
								severity = "1";
							if (severity.equals("2"))
								severity = "2";
							if (severity.equals("3"))
								severity = "3";
							if (severity.equals("4"))
								severity = "4";
							if (severity.equals("5"))
								severity = "5";
							if (severity.equals("6"))
								severity = "6";
							if (severity.equals("7"))
								severity = "6";

							reportingAddress = reportingAddress.trim();
							System.out.println("reportingAddress : " + reportingAddress);

							/*
							 * pdu.setAgentAddr(reportingAddress);
							 * 
							 * try { InetAddress address =
							 * InetAddress.getByName(reportingAddress);
							 * pdu.setAgentAddress(address); } catch (Exception
							 * e1) { e1.printStackTrace(); } UDPProtocolOptions
							 * opt = new UDPProtocolOptions();
							 * System.out.println("Remote Host cisco pi: " +
							 * reportingAddress);
							 * opt.setRemoteHost(reportingAddress);
							 * opt.setRemotePort(161);
							 * 
							 * pdu.setProtocolOptions(opt); System.err.println(
							 * "Trap Receiver : Agent ADDR : " +
							 * pdu.getAgentAddr()); System.err.println(
							 * "Trap Receiver : Remote Host : " +
							 * pdu.getRemoteHost()); System.out.println(
							 * "My Message: " + description);
							 */

							TestMO1.AddNode(reportingAddress, displayName);
							System.out.println("Displayname displayed");

							System.out.println("In Cisco  PI  Testing" + severity);

							events = new Event();
							events.setTime((new Date()).getTime());
							events.setSource(reportingAddress);
							//events.setSource(displayName);
							events.setEntity(reportingAddress);
							events.setText(description);// events.set("cisco
														// alaram")
							events.setCategory("Topology");
							events.setSeverity(Integer.parseInt(severity));// events.setSeverity("1");

						}
					}
					System.err.println("==============getVariableBindings End=========");
					return events;
				} else if (pdu.getRemoteHost().equals("10.131.135.5") || pdu.getRemoteHost().equals("10.131.128.69")
						|| pdu.getRemoteHost().equals("10.131.134.229") || pdu.getRemoteHost().equals("10.131.135.5")) {
					StringBuilder stBuilder = new StringBuilder();

					System.err.println("CMS varbs : " + pdu.printVarBinds());
					for (Enumeration e = pdu.getVariableBindings().elements(); e.hasMoreElements();) {

						String input = ((SnmpVarBind) e.nextElement()).toTagString();
						if (input.contains("Object ID: .1.3.6.1.4.1.6718.3.3.1.2.12.0")) {

							String parse = input.substring(input.indexOf(":", input.indexOf(":") + 1), input.length());
							String parse1 = parse.substring(1, parse.length()).trim();
							String op = "rtuComputerName:" + parse1;
							stBuilder.append(op + ",");

						}
						if (input.contains("Object ID: .1.3.6.1.4.1.6718.3.3.1.2.1.0")) {

							String parse = input.substring(input.indexOf(":", input.indexOf(":") + 1), input.length());
							String parse1 = parse.substring(1, parse.length()).trim();
							String op = "FaultType:" + parse1;
							stBuilder.append(op + ",");

						}

						System.out.println("CMS Input : " + input);
					}

					event = new Event();
					event.setTime((new Date()).getTime());
					event.setSource(pdu.getRemoteHost());
					event.setEntity(pdu.getRemoteHost());
					event.setText(stBuilder.toString());
					event.setCategory("Topology");
					event.setSeverity(1);
					System.out.println("I am in CMS block");
					return event;
				} else if (pdu.getRemoteHost().equals("10.208.0.21")|| pdu.getRemoteHost().equals("10.208.0.22")) {

					System.err.println("varbs : " + pdu.printVarBinds());
					System.err.println("==============getVariableBindings==============");
					for (Enumeration e = pdu.getVariableBindings().elements(); e.hasMoreElements();) {

						String input1 = ((SnmpVarBind) e.nextElement()).toTagString();
						System.out.println("Input1 : " + input1);
						String managedObjectName = null;
						String displayName = null;
						String description = null;
						String severity = null;
						if (input1.contains("Object ID: .1.3.6.1.4.1.9.9.311.1.1.2.1.15.0")) {
							StringTokenizer stTokenizer = new StringTokenizer(input1, ":");
							if (stTokenizer.hasMoreTokens()) {
								String s = stTokenizer.nextToken();// it will //
																	// print the
																	// // first
								// part // before : managedObjectName =
								stTokenizer.nextToken();// it // will // print
														// // after
								System.out.println("CPP managed object" + managedObjectName);
							}

						}

						if (input1.contains("Object ID: .1.3.6.1.4.1.9.9.311.1.1.2.1.13.0")) {

							// Node=PROJGSR-KMMGMTCP01:
							StringTokenizer st = new StringTokenizer(input1, ":");
							if (st.hasMoreTokens()) {
								String s1 = st.nextToken();
								String s2 = st.nextToken();
								StringTokenizer st1 = new StringTokenizer(s2, "=");
								if (st1.hasMoreTokens()) {
									String s3 = st1.nextToken();
									displayName = st1.nextToken();
								}
								System.out.println(displayName);
							}

						}
						if (input1.contains("Object ID: .1.3.6.1.4.1.9.9.311.1.1.2.1.16.0")) {
							StringTokenizer stTokenizer = new StringTokenizer(input1, ":");
							if (stTokenizer.hasMoreTokens()) {
								String s = stTokenizer.nextToken();// it will //
																	// print the
																	// // first
								// part // before : description =
								description = stTokenizer.nextToken();// it will // print //
														// after // :
								System.out.println("Description at 16.0" + description);

							}

						}
						if (input1.contains("Object ID: .1.3.6.1.4.1.9.9.311.1.1.2.1.7.0")) {
							StringTokenizer stTokenizer = new StringTokenizer(input1, ":");
							if (stTokenizer.hasMoreTokens()) {
								String s = stTokenizer.nextToken();// it will //
																	// print the
																	// // first
								// part // before :
								severity = stTokenizer.nextToken();// it will //
																	// print //
																	// after
								if (severity.equals("NodeUnreachable")) {
									severity = "2";

								} else if (severity.equals("RebootDetected")) {
									severity = "2";

								} else {

									severity = "6";
								}

							}

							TestMO1.AddNode(managedObjectName, displayName);
							System.out.println("Displayname displayed");

							event = new Event();
							event.setTime((new Date()).getTime());
							event.setSource(managedObjectName);
							event.setEntity(managedObjectName);
							event.setText(description);
							event.setCategory("Topology");
							event.setSeverity(Integer.parseInt(severity));

						}
					}
					System.err.println("==============getVariableBindings End=========");
					return event;
				}
				
				else if (pdu.getRemoteHost().equals("172.18.62.68") || pdu.getRemoteHost().equals("172.18.62.70")
						|| pdu.getRemoteHost().equals("172.18.62.71") || pdu.getRemoteHost().equals("172.18.62.72")
						|| pdu.getRemoteHost().equals("172.18.62.76") || pdu.getRemoteHost().equals("172.18.62.77")) {
					StringBuilder stBuilder = new StringBuilder();

					System.err.println("SNS(Firewalls) varbs : " + pdu.printVarBinds());
					for (Enumeration e = pdu.getVariableBindings().elements(); e.hasMoreElements();) {

						String input = ((SnmpVarBind) e.nextElement()).toTagString();
						
						if (input.contains("Object ID: .1.3.6.1.4.1.9.9.637.1.2.1.3")) {

							String parse = input.substring(input.indexOf(":", input.indexOf(":") + 1), input.length());
							String parse1 = parse.substring(1, parse.length()).trim();
							String op = "cscRdrDestInetAddress:" + parse1;
							stBuilder.append(op + ",");

						}
						if (input.contains("Object ID: .1.3.6.1.4.1.9.9.637.1.2.1.4")) {

							String parse = input.substring(input.indexOf(":", input.indexOf(":") + 1), input.length());
							String parse1 = parse.substring(1, parse.length()).trim();
							String op = "cscRdrDestPort:" + parse1;
							stBuilder.append(op + ",");

						}

						System.out.println("SNS(Firewalls) Input : " + input);
					}

					event = new Event();
					event.setTime((new Date()).getTime());
					event.setSource(pdu.getRemoteHost());
					event.setEntity(pdu.getRemoteHost());
					event.setText(stBuilder.toString());
					event.setCategory("Topology");
					event.setSeverity(6);
					System.out.println("I am in SNS(Firewalls) block");
					return event;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return pdu;
	}
}
