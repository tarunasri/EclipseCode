<%-- $Id: ctForm.jsp,v 1.3 2010/10/29 13:47:05 swaminathap Exp $ --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@include file="/webclient/config/jspf/taskconfig.jspf" %>
<script type="text/javascript" src="/webclient/config/js/taskconfig.js"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script type="text/javascript">
	
var resultxml;
var resulttxt;
</script>
</head>
<body onload="javascript:loadCTForm()">
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="pageHeaderStr">
  <tbody>
    <tr>
      <c:choose>
      <c:when test="${operation eq 'execute'}">
          <td nowrap="nowrap"><h1><fmt:message key="webclient.config.ctask.execute.title"/></h1></td>
      </c:when>
      <c:otherwise>
	  <td nowrap="nowrap"><h1><fmt:message key="webclient.config.ctask.form.title"/></h1></td>
      </c:otherwise>
      </c:choose>
    </tr>
  </tbody>
</table>
<form name="ComboTaskForm" method="POST" action="/config/TaskList.do">
<input type="hidden" name="overwrite" value='<c:out value="${overwrite}"/>'/>
<input type="hidden" name="subtaskVsseldl" value="">
    <table class="greyboxStyle1" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td style="padding:5px;">
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
                <tbody>
                    <tr>
                        <td width="5"><img height="5" width="5" src="/webclient/common/images/corner2-1.gif"/></td>
                        <td nowrap="nowrap" valign="top" align="left" class="alarmLeftBdrTop"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
                        <td height="5" width="5"><img height="5" width="5" src="/webclient/common/images/corner2-2.gif"/></td>
                    </tr>
		    <tr>
	                 <td class="alarmLeftBdrLeft"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
		         <td style="padding:4px 8px 4px 8px;" valign="top" class="whiteBg">
		         <table style="margin-top:10px;clear:both" width="100%" cellspacing="0" cellpadding="3" border="0" align="left">
                	     <tbody>
                                 <tr>
                    		     <td width="10%" valign="top" nowrap="nowrap"><fmt:message key="webclient.config.ctask.form.taskName"/> :</td>
				     <c:choose>
				     <c:when test="${taskName eq null}">
				     <td valign="top"><input type="text" style="width:250px;" class="formstyle" name="taskName" value="<c:out value='${taskName}'/>"/></td>
				     </c:when>
				     <c:otherwise>
				     <td valign="top"><input type="text" style="width:250px;" class="disabledBg" name="taskName" value="<c:out value='${taskName}'/>" readonly="readonly"/></td>
				     </c:otherwise>
				     </c:choose>


		                 </tr>
				 <tr>
		                     <td valign="top" nowrap="nowrap"><fmt:message key="webclient.config.task.form.desc"/> :</td>
				     <td valign="top"><textarea style="width:250px;" name="description" class="formstyle"><c:out value="${description}"/></textarea></td>
		                 </tr>
                	     </tbody>
                         </table>
			 <table style="margin-top:10px;clear:both" width="100%" cellspacing="0" cellpadding="3" border="0" align="left">
			  <tbody>
			    <tr>
				<td valign='top' width='60%'>
				<c:choose>
				    <c:when test="${operation ne 'execute'}">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					    <tr>
						<td valign="top" class="tableBdr2">
						    <table class="tableStyle1" width="100%" cellspacing="0" cellpadding="2" border="0">
							<tr class="generalTBHeader">
							    <td style="width:10px;padding-left:5px;">&nbsp;</td>
							    <td width="20%" style="padding-left:5px;" nowrap><fmt:message key="webclient.config.ctask.avltask"/></td>
							    <td align="right" style="padding-left:5px;padding-right:10px;"><a class="blueLink" href="javascript:toggleSubTasks('')"><fmt:message key="webclient.config.ctask.show"/></a> | <a class="blueLink" href="javascript:toggleSubTasks('none')"><fmt:message key="webclient.config.ctask.hide"/></a></td>
							</tr>
							<c:forEach var="protocolBasedList" items="${taskList}" varStatus="status">
						        <c:choose>
							    <c:when test="${status.count==1}">
								<TR class='generalEvenRow selectedRow' id="<c:out value='${protocolBasedList.key}_tr'/>">
								<td style="padding-left:2px;"><a href="javascript:toggleTaskList('<c:out value='${protocolBasedList.key}'/>')"><img id="<c:out value='${protocolBasedList.key}_img'/>" border="0" align="absmiddle" src="/webclient/common/images/toggleIcon1.gif"/></a></td>
							    </c:when>
						            <c:when test="${status.count%2==0}">
						                <TR class='generalOddRow'id="<c:out value='${protocolBasedList.key}_tr'/>">
								<td style="padding-left:2px;"><a href="javascript:toggleTaskList('<c:out value='${protocolBasedList.key}'/>')"><img id="<c:out value='${protocolBasedList.key}_img'/>" border="0" align="absmiddle" src="/webclient/common/images/toggleIcon2.gif"/></a></td>
						            </c:when>
						            <c:otherwise>
							        <TR class='generalEvenRow' id="<c:out value='${protocolBasedList.key}_tr'/>">
								<td style="padding-left:2px;"><a href="javascript:toggleTaskList('<c:out value='${protocolBasedList.key}'/>')"><img id="<c:out value='${protocolBasedList.key}_img'/>" border="0" align="absmiddle" src="/webclient/common/images/toggleIcon2.gif"/></a></td>
           						    </c:otherwise>
							</c:choose>
							    <td style="padding-left:5px;"><c:out value='${protocolBasedList.key}'/></td>
							    <td style="padding-left:5px;">&nbsp;</td>
							</tr>
							<c:choose>
							    <c:when test="${status.count==1}">
							        <tbody id="<c:out value='${protocolBasedList.key}'/>" class="tbodyChild" style="display:;">
							    </c:when>
							    <c:otherwise>
								<tbody id="<c:out value='${protocolBasedList.key}'/>" class="tbodyChild" style="display:none;">
							    </c:otherwise>
							</c:choose>
							    <c:choose>
							    <c:when test="${!empty protocolBasedList.value}">
							    <c:forEach var="taskList" items="${protocolBasedList.value}" varStatus="status">
							    <tr onmouseover="this.className='reportsOddRow';javascript:showDetails('<c:out value='${protocolBasedList.key}'/>','<c:out value='${taskList[0]}'/>')" onmouseout="this.className='tbodyChild';hideDetails()" >
							    <td style="padding-left:5px;">&nbsp;</td>
							    <td style="padding-left:5px;">&nbsp;</td>
                                                            <c:choose>
                                                                <c:when test="${status.count%2==0}">
                                                                    <td onmouseover="this.className='tbodyChildHOver'" onmouseout="this.className='tbodyChildRow'" class="tbodyChildRow" style="padding-left:5px;">
                                                            	</c:when>
                                                                <c:otherwise>
                                                                    <td onmouseover="this.className='tbodyChildHOver'" onmouseout="this.className='tbodyChildRow'" class="tbodyChildRow" style="padding-left:5px;">
                                                                </c:otherwise>
								</c:choose>
							    <input style="vertical-align:middle" type="checkbox" value="<c:out value='${taskList[0]}'/>" id="<c:out value='${taskList[0]}'/>" name="subtasks"/> &nbsp; <label for="<c:out value='${taskList[0]}'/>"><c:out value="${taskList[0]}"/></label></td>
						            </tr>
							    </c:forEach>
							    </c:when>
							    <c:otherwise>
								<td style="padding-left:5px;">&nbsp;</td><td style="padding-left:5px;">&nbsp;</td><td onmouseover="this.className='tbodyChildHOver'" onmouseout="this.className='tbodyChildRow'" class="tbodyChildRow" style="padding-left:5px;"><fmt:message key="webclient.ctform.subtasks.empty"/></td></tr>
							    </c:otherwise>
							    </c:choose>
							</tbody>
							</c:forEach>
						    </table>
						</td>
					    </tr>
				        </table>
				    </c:when>
				    <c:otherwise>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tableID">
                                            <tr>
                                                <td valign="top" class="tableBdr2">
                                                    <table class="tableStyle1" width="100%" cellspacing="0" cellpadding="2" border="0">
                                                        <tr class="generalTBHeader">
                                                            <td style="width:10px;padding-left:5px;">&nbsp;</td>
                                                            <td width="20%" style="padding-left:5px;" nowrap><fmt:message key="webclient.config.ctask.associatedtask"/></td>
                                                            <td align="right" style="padding-left:5px;padding-right:10px;"><a class="blueLink" href="javascript:toggleSubTasks('')"><fmt:message key="webclient.config.ctask.show"/></a> | <a class="blueLink" href="javascript:toggleSubTasks('none')"><fmt:message key="webclient.config.ctask.hide"/></a></td>
                                                        </tr>
							<c:forEach var="protocolBasedList" items="${subtaskList}" varStatus="status">
                                                        <c:choose>
                                                            <c:when test="${status.count%2==0}">
                                                                <TR class='generalOddRow'id="<c:out value='${protocolBasedList.key}_tr'/>">
                                                                <td style="padding-left:2px;"><a href="javascript:toggleTaskList('<c:out value='${protocolBasedList.key}'/>')"><img id="<c:out value='${protocolBasedList.key}_img'/>" border="0" align="absmiddle" src="/webclient/common/images/toggleIcon1.gif"/></a></td>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <TR class='generalEvenRow' id="<c:out value='${protocolBasedList.key}_tr'/>">
                                                                <td style="padding-left:2px;"><a href="javascript:toggleTaskList('<c:out value='${protocolBasedList.key}'/>')"><img id="<c:out value='${protocolBasedList.key}_img'/>" border="0" align="absmiddle" src="/webclient/common/images/toggleIcon1.gif"/></a></td>
                                                            </c:otherwise>
                                                        </c:choose>
							    <td style="padding-left:5px;"><c:out value='${protocolBasedList.key}'/></td>
							    <td style="padding-left:5px;">&nbsp;</td>
							</tr>
                                                            <tbody id="<c:out value='${protocolBasedList.key}'/>" class="tbodyChild" style="display:;">
                                                            <c:choose>
                                                            <c:when test="${!empty protocolBasedList.value}">
							    <c:forEach var="subtask" items="${protocolBasedList.value}" varStatus="status">
                                                            <tr>
                                                            <td style="padding-left:5px;">&nbsp;</td>
                                                            <td style="padding-left:5px;">&nbsp;</td>
                                                            <c:choose>
                                                                <c:when test="${status.count%2==0}">
                                                                    <td onmouseover="this.className='tbodyChildHOver'" onmouseout="this.className='tbodyChildRow'" class="tbodyChildRow" style="padding-left:5px;">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td onmouseover="this.className='tbodyChildHOver'" onmouseout="this.className='tbodyChildRow'" class="tbodyChildRow" style="padding-left:5px;">
                                                                </c:otherwise>
                                                            </c:choose>
							    <input type="checkbox" checked="checked" disabled="true" name="subtasks" id="<c:out value='${subtask}'/>"><label for="<c:out value='${subask}'/>"><a href="javascript:showDeviceList('<c:out value='${subtask}'/>')"><c:out value="${subtask}"/></a></label></td>
							    </tr>
							    </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <td style="padding-left:5px;">&nbsp;</td><td style="padding-left:5px;">&nbsp;</td><td onmouseover="this.className='tbodyChildHOver'" onmouseout="this.className='tbodyChildRow'" class="tbodyChildRow" style="padding-left:5px;"><fmt:message key="webclient.ctform.subtasks.empty"/></td></tr>
                                                            </c:otherwise>
                                                            </c:choose>
							    </tbody>
                                                        </c:forEach>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
				    </c:otherwise>
				</c:choose>
				</td>
				<td valign='top' width='40%'>
				    <c:choose>
				    <c:when test="${operation ne 'execute'}">
					<div id="subTaskDetails" width="300px" style="display:'none';overflow:auto;"></div>
					<div id='defSubTaskDetails' style='display:'';'>
				       <table class='tableBdr2' width="100%" cellspacing="0" cellpadding="3" border="0" align="left" height="100%">
					       <tr><td class='generalTBHeader' colspan='2'><fmt:message key="webclient.config.ctask.subtask.details" /></td></tr> 
					<tr class='generalOddRow' onmouseout="this.className='generalOddRow'" onmouseover="this.className='generalHover'"><td class='hSeparator2' width='25%' style='padding-left:5px;'><fmt:message key='webclient.config.task.form.taskName'/></td><td id="taskName" width='30%' class='hSeparator2' style='padding-left:5px;'> : </td></tr>
					<tr class='generalEvenRow' onmouseout="this.className='generalEvenRow'" onmouseover="this.className='generalHover'"><td style='padding-left:5px;' width='25%'><fmt:message key='webclient.config.task.form.desc'/></td><td id="description"> : </td></tr>
                                       <tr class='generalOddRow' onmouseout="this.className='generalOddRow'" onmouseover="this.className='generalHover'"><td style='padding-left:5px;' width='25%'><fmt:message key='webclient.config.task.form.protocol'/></td><td id="protocol"> : </td></tr>
					<tr class='generalEvenRow' onmouseout="this.className='generalEvenRow'" onmouseover="this.className='generalHover'"><td style='padding-left:5px;' width='25%'><fmt:message key='webclient.config.task.form.rollback.isTemplate'/></td><td id="template"> : </td></tr>
					<tr class='generalOddRow' onmouseout="this.className='generalOddRow'" onmouseover="this.className='generalHover'"><td style='padding-left:5px;' width='25%'><fmt:message key='webclient.config.task.form.rbconfig'/></td><td id="rollback"> : </td></tr>
					<tr class='generalEvenRow' onmouseout="this.className='generalEvenRow'" onmouseover="this.className='generalHover'"><td style='padding-left:5px;' width='25%'><fmt:message key='webclient.config.task.form.lastExecTime'/></td><td id="exetime"> : </td></tr>
				        </table>
					</div>
				    </c:when>
				    <c:otherwise>
					<div id="subTaskVsDL" width="300px" style="display:none;overflow:auto;"></div>
				    </c:otherwise>
				    </c:choose>
				</td>
			    </tr>
			    </tbody>
			 </table>
	   		 </td>
			<td class="alarmLeftBdrRight"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
		    </tr>			    
	            <tr>
           		<td class="generalCurveLeftBot"><img height="1" width="1" src="/webclient/common/images/corner2-4.gif"/></td>
		        <td class="alarmLeftBdrBottom"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
		        <td class="generalCurveRightBot"><img height="5" width="5" src="/webclient/common/images/corner2-3.gif"/></td>
		    </tr>
	        </tbody>
	</table>
	</td></tr></table>
            <table style="margin-top:15px;" width="100%" border="0" cellspacing="0" cellpadding="0" id='refTable1'>
              <tr>
                <td align="center">
                <c:choose>
                <c:when test="${operation eq 'execute'}">
		<input type="button" value="<fmt:message key='webclient.config.task.executeform.execute'/>" class="button" name="SaveandExecute" onclick="javascript:executeComboTask(this.form,'<fmt:message key='webclient.config.task.exe.msg'/><br/><fmt:message key='webclient.config.task.exe.msg2'/>')"/>
                </c:when>
                <c:otherwise>
                  <input type="button" value="<fmt:message key='webclient.config.task.save'/>" class="button" name="Save" onclick="javascript:saveComboTask()"/>
                </c:otherwise>
                </c:choose>
                  <input type="button" value="<fmt:message key='webclient.config.task.cancel'/>" class="button" name="Cancel" onclick="javascript:location.href='/config/TaskList.do';"/>
                </td>
              </tr>
            </table>
<div style="display:none; position:absolute; top:200px; left:350px; background-color:white;" id="ExecutionResult">
</div>
</form>
</body>
</html>
