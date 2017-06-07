<%-- $Id: DateInput.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>

<title><fmt:message key='webclient.common.date.window.title'/></title>
<style>
	td {font-family: Tahoma, Verdana, sans-serif; font-size: 12px;}
	<!--
	a { text-decoration: none}
	-->
</style>

<%@ include file="/webclient/common/jspf/commonIncludes.jspf"%>
<%@ include file="/webclient/common/jspf/PopupInterface.jspf"%>
<%@ include file="/webclient/common/jspf/DateHTML.jspf"%>

<script language="javaScript">
function Highlight(e)
{
    if(document.cal.selDate.value=="")
    {
        document.getElementById('date'+dt_current.getDate()).className="calendarText"
        document.getElementById('date'+e).className="calSelected"
    }
    else
    {
        var prevDate = "date"+ document.cal.selDate.value
        document.getElementById(prevDate).className="calendarText"
        document.getElementById('date'+e).className="calSelected"
    }
    document.cal.selDate.value=e;
    selected_date(e);
}
</script>
</head>


<body class="calendarBg">

<script language="JavaScript">
document.write('<form onsubmit="javascript:set_datetime(true)" name="cal">');
</script>

<input type="hidden" name="selDate">
  <table width="200" border="0" cellspacing="0" cellpadding="0" align="center">

    <tr>
      <td><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/cal_img1.gif" width="9" height="3"></td>
      <td class="calTopBorderBg"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
      <td><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/cal_img2.gif" width="11" height="3"></td>
    </tr>
    <tr>
      <td width="9" class="calLeftBorderBg"></td>
      <td width="180" valign="top">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td class="calMonthYrBg">
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="left" height="22">

	<script language="JavaScript">
	document.write('<SELECT NAME="Month" class="calendarCombo" style=width:78  onchange="javascript:selected_month(document.cal.Month.selectedIndex)">');
        for(var i=0;i<12;i++)
	{
        	if(i==dt_current.getMonth())
        	{
        		document.write('<OPTION VALUE="'+ ARR_MONTHS[i] +'>" SELECTED>'+ ARR_MONTHS[i]+'</OPTION>');
        	}
        	else
        	{
        		document.write('<OPTION VALUE="'+ ARR_MONTHS[i] +'">'+ ARR_MONTHS[i]+'</OPTION>');
        	}
	}
    	document.write('</SELECT>');
	</script>
                  </td>
		  <td align="right">

	<script language="javascript">

	document.write('<SELECT NAME="Year" class="calendarCombo" onchange="javascript:selected_year(document.cal.Year.options[document.cal.Year.selectedIndex].value)">');
	for(var i=2003;i<=2010;i++)
	{
    		if(i==dt_current.getFullYear())
     		{
                	document.write('<OPTION VALUE="'+ i +'>" SELECTED>'+ i+'</OPTION>');
     		}
    		else
     		{
       	     		document.write('<OPTION VALUE="'+ i +'">'+ i +'</OPTION>');
     		}
	}
	document.write('</SELECT>');
	</script>

                 </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>
              <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr>
                  <td width="2" class="calMonthYrBg"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
                  <td class="calInBorderBg" width="157"><img src="/webclient/common/images/cal_in_imga.gif" width="1" height="1"></td>
                  <td width="1"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/cal_in_imgb.gif" width="1" height="1"></td>
                </tr>
                <tr>
                  <td width="2" class="calInBorderBg1"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
                  <td class="calDateBg">
                    <table width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
                      <tr align="center">
                        <td class="calMonthBg" colspan="7">
                          <table width="90%" border="0" cellspacing="1" cellpadding="1" align="center">
                          <tr class="boldtext">
<script language="javascript">
document.write(
'<td align="left" width="10%"></td>'+
'<td align="center" width="80%" >'+ARR_MONTHS[dt_current.getMonth()]+' '+dt_current.getFullYear() + '</td>'+
'<td align="right"  width="10%"></td>');
</script>
                         </tr>
                         </table>
                         </td>
                         </tr>
                      <tr align="center">
<script language="javascript">

// print weekdays titles
for (var n=0; n<7; n++)
	document.write('<td class="calDayBg">'+ARR_WEEKDAYS[(NUM_WEEKSTART+n)%7]+'</td>');
document.write('</tr>');

// print calendar table

var dt_current_day = new Date(dt_firstday);
while (dt_current_day.getMonth() == dt_current.getMonth() || dt_current_day.getMonth() == dt_firstday.getMonth())
{
	// print row heder
	document.write('<tr>');
    	var sel="false";
	for (var n_current_wday=0; n_current_wday<7; n_current_wday++)
        {


            if (dt_current_day.getMonth() == this.dt_current.getMonth())
                {

		            if (dt_current_day.getDate() == dt_current.getDate() && dt_current_day.getMonth() == dt_current.getMonth())
			    {

			    // print current date
			    document.write('<td id="date'+dt_current_day.getDate()+'" align="center" width="14%" class="calSelected">');
			    sel="true";
			    }
			    else
			    {

			    document.write('<td id="date'+dt_current_day.getDate()+'" align="center" width="14%" class="calendarText">');
			    sel="false";
			    }
			    // print days of current month
			    //document.write('<a href="javascript:set_datetime('+dt_current_day.valueOf() +', false);" class="calendarText">');

			    if(sel=="false")
			    {
			    document.write('<a href="javascript:Highlight('+dt_current_day.getDate()+'); " >');
			    }
			    else
			    {
			    document.write('<a href="javascript:Highlight('+dt_current_day.getDate()+');" >');
			    }

			    document.write(dt_current_day.getDate()+'</a></td>');
		}
		else
		{
		     if (dt_current_day.getDate() == dt_current.getDate() && dt_current_day.getMonth() == dt_current.getMonth())
		     {

                    // print current date
		    document.write('<td align="center" width="14%" class="calSelected">');
		    sel="true";
		    }
		    else
		    {

		    document.write('<td align="center" width="14%" class="calendarText">');
		    sel="false";
		    }
		}

            dt_current_day.setDate(dt_current_day.getDate()+1);
        }
	// print row footer
	document.write('</tr>');

}

</script>


</table>
                  </td>
                  <td width="1"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
                </tr>
                <tr>
                  <td width="2"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/cal_in_imgd.gif" width="2" height="2"></td>
                  <td class="calInBorderBg3" width="157" height="1"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
                  <td width="1" class="calInBorderBg3"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
                </tr>
              </table>
            </td>
          </tr>

	  <SCRIPT>
 if (obj_caller)
{
document.write('<tr class="calMonthYrBg" ><td class="boldText" height="25"><fmt:message key='webclient.common.date.timefield.message'/>&nbsp;<input type="text" class="calendarCombo" name="time" value="'+gen_time(dt_current)+'" size="6" maxlength="8"  onchange="selected_time(document.cal.time.value)">');
	document.write('&nbsp;&nbsp;<select name="ampm" class="calendarCombo" onchange="javascript:selected_ampm(document.cal.ampm.options[document.cal.ampm.selectedIndex].value)">');
		if(gen_am(dt_current) >= 1)
	{
 		document.write('<option value="AM" ><c:out value="${AmString}"/></option><option VALUE="PM" selected><c:out value="${PmString}"/></option>');
	}
	else
	{
 		document.write('<option value="AM" selected><c:out value="${AmString}"/></option><option value="PM" ><c:out value="${PmString}"/></option>');
	}
	document.write('</select></td></tr>');
}

</script>
</table>
</td>
      <td width="11" class="calRightBorderBg">&nbsp;</td>
    </tr>
    <tr>
      <td width="9"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/cal_img7.gif" width="9" height="1"></td>
      <td class="calGreenBg"></td>
      <td class="calRightBorderBg" width="11"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
    </tr>
    <tr>
      <td class="calPreBtmLeftBg" width="9"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
      <td align="right" height="40">
        <input type="submit" class="button" name="Submit" value="<fmt:message key='webclient.common.date.applybutton.text'/>">
        <input type="button" class="button" name="cancel" value="<fmt:message key='webclient.common.date.cancelbutton.text'/>" onclick="javascript:window.close()">
      </td>
      <td class="calPreBtmRightBg" width="11">&nbsp;</td>
    </tr>
    <tr>
      <td width="9" class="calBtmLeftBg"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
      <td width="162" valign="top" class="calBtmBg"><img src="/webclient/common/images/trans.gif" width="1" height="2"></td>
      <td width="11" class="calBtmRightBg"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
    </tr>
  </table>
</form>
</body>
</html>
