package com.dgca;

import java.rmi.Naming;
import java.rmi.RemoteException;

import com.adventnet.nms.eventdb.TrapAPI;
import com.adventnet.nms.eventdb.TrapFilter;
import com.adventnet.nms.eventdb.TrapFilterHolder;
import com.adventnet.nms.fault.FaultException;
import com.adventnet.nms.store.NmsStorageException;
import com.adventnet.snmp.snmp2.SnmpPDU;

public class TestTrapFilter implements TrapFilter {

	public void setTrapFilters()

	{

		/* Get the Handle of TrapAPI */

		TrapAPI trapAPI = getTrapAPI();

		/* Get the Trap Filter (Holder)to handle V1 Trap - Link Down */

		TrapFilterHolder tfp = getV1TrapFilterHolder("Example V1 Trap Filter", ".1.3.6.1.2.1.11", "2", "0", true,
				"test.LinkUpDownTrapFilter");

		/* Get the Trap Filter (Holder) to handle V2 Trap - Link Down */

		TrapFilterHolder holder = getV2TrapFilterHolder("Example V2 Trap Filter", ".1.3.6.1.6.3.1.1.5.3", true,
				"test.LinkUpDownTrapFilter");

		/**
		 * Construct an Array from the V1 Trap Filter and V2 Trap Filter
		 * (Holders)
		 **/

		TrapFilterHolder[] filterArray = { tfp, holder };

		/** Configure the Web NMS with the Trap Filters with the option to **/

		/**
		 * save the Trap Filters without overwriting the existing Trap Filters
		 **/

		try {
			trapAPI.setTrapFilters(filterArray, true, true);
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NmsStorageException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FaultException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NullPointerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * Method to construct a TrapFilterHolder Instance with the given values for
	 * V2 Trap
	 **/

	public TrapFilterHolder getV2TrapFilterHolder(String name, String trapOID, boolean toEnable,
			String trapFilterClassName)

	{

		TrapFilterHolder holder = new TrapFilterHolder();

		holder.setFilterName(name);

		holder.setTrapOID(trapOID);

		try

		{

			holder.setTrapFilter((TrapFilter) Class.forName(trapFilterClassName).newInstance());

		}

		catch (Exception ee)

		{

			ee.printStackTrace();

		}
		return holder;

	}

	/**
	 * Method to construct a TrapFilterHolder Instance with the given values for
	 * V1 Trap
	 **/

	public TrapFilterHolder getV1TrapFilterHolder(String name, String enterpriseOID, String genericType,
			String specificType, boolean toEnable, String trapFilterClassName)

	{

		TrapFilterHolder tfp = new TrapFilterHolder();

		tfp.setFilterName(name);

		tfp.setEnterpriseOID(enterpriseOID);

		tfp.setGenericType(genericType);

		tfp.setSpecificType(specificType);

		try

		{
			tfp.setTrapFilter((TrapFilter) Class.forName(trapFilterClassName).newInstance());

			// tfp.setTrapFilter(Class.forName(trapFilterClassName).newInstance());

		}

		catch (Exception e)

		{

			e.printStackTrace();

		}

		tfp.setEnableType(toEnable);

		return tfp;

	}

	/** Get the TrapAPI handle using RMI **/

	public TrapAPI getTrapAPI()

	{

		TrapAPI trapAPI = null;

		try

		{

			// hostName specifies the host in which Web NMS Server is running.

			String apiString = "//<10.208.0.82>/TrapAPI";

			// RMI lookup This fetches the TrapAPI handle

			trapAPI = (TrapAPI) Naming.lookup(apiString);
		}

		catch (

		Exception e) {

			e.printStackTrace();
		}

		return trapAPI;

	}

	@Override
	public Object applyTrapFilter(SnmpPDU arg0) {
		// TODO Auto-generated method stub
		System.out.println("Trap parser test");

		return null;
	}

}
