package com.adventnet.nms.webclient.home.widgets;

import com.adventnet.nms.webclient.home.DataSource;

import com.adventnet.nms.webclient.home.DataSourceResponse;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import com.adventnet.nms.webclient.home.WidgetParams;

public class Ac implements DataSource

{

	public DataSourceResponse generateWidgetData(WidgetParams params)

	{

		// TODO Auto-generated method stub

		DataSourceResponse dataSrcResponse = new DataSourceResponse();

		dataSrcResponse.forward = "ac";// No i18n

		return dataSrcResponse;

	}

}