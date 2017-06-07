<%-- $Id: addContainer.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><c:out value="${title}"/></title>

</head>
<body >

<html:form action = "/AddContainerAction.do" onsubmit="return validateAddContainer(this);">
<!--<input type=hidden name="viewId" value="<c:out value='${param.mapName}'/>">
<input type=hidden name="actionToPerform" value="<c:out value='${param.actionToPerform}'/>">
-->
<span class="errorText"><html:errors/></span>

 <table width="100%" >
<tr class="header1Bg"> 
    <td height="30" class="header1Bg"><span class="header1">&nbsp;<fmt:message key='webclient.map.cv.addcontainer.header'/>
</span></td><td>&nbsp;</td>
</tr>
</table >

  <table width="80%" border="0" align="left"  cellpadding="1" class="botborder" cellspacing="1">

    <tr> 
    <td width="160"><span class="text"><fmt:message key="webclient.map.cv.addcontainer.name"/></span></td>
    <td><html:text property="name"  name="AddContainer"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.objname"/></span></td>
    <td><html:text property="objName"  name="AddContainer"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.label"/></span></td>
    <td><html:text property="label" name="AddContainer" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.status"/></span></td>
    <td><html:text property="status" name="AddContainer" disabled="true" value="Clear"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>
<tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.iconname"/></span></td>
    <td><html:text property="iconName" name="AddContainer"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.objtype"/></span></td>
    <td><html:text property="objType" name="AddContainer" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.width"/></span></td>
    <td><html:text property="width" name="AddContainer"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.height"/></span></td>
        <td><html:text property="height" name="AddContainer" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

<tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.x"/></span></td>
    <td><html:text property="x"  name="AddContainer" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.y"/></span></td>
    <td><html:text property="y"  name="AddContainer" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.menuname"/></span></td>
    <td><html:text property="menuName" name="AddContainer" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.parentname"/></span></td>
    <td><html:text property="parentName" name="AddContainer"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>
    
    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.mapname"/></span></td>
    <td><html-el:text property="mapName" name="AddContainer"  value ='${param.mapName}' styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>
   <!-- <tr> 
    <td><span class="text"><fmt:message key="WebNMS"/></span></td>
    <td><html:text property="WebNMS" name="AddContainer"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr> -->

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.anchored"/></span></td>
    <td><html-el:select property="anchored" name="AddContainer"  styleClass="formStyle"> 
                <option selected>true
                <option>false
                </html-el:select>
    </td>
    <td>&nbsp;</td>
    </tr>
    
    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.currenttopology"/></span></td>
    <td><html-el:text property="currentTopology" name="AddContainer"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

 <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.groupname"/></span></td>
    <td><html-el:text property="groupName" name="AddContainer"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

 <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.topology"/></span></td>
    <td><html-el:text property="topology" name="AddContainer"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.containment"/></span></td>
    <td><html-el:select property="containment" name="AddContainer"  styleClass="formStyle"> 
                <option selected>true
                <option>false
                </html-el:select>
    </td>
    <td>&nbsp;</td>
    </tr>
<!--
    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addcontainer.savechanges"/></span></td>
    <td><html:checkbox property="needToSave" name="AddContainer" /></td>
    <td>&nbsp;</td>
    </tr> -->

    <tr> <td> &nbsp; </td>
    <td> <input name="symbolButton1" type="submit" class="button"  value='<fmt:message key="webclient.map.cv.addcontainer.button.addcontainer"/>'>
    <input width="75" name="symbolButton2" type="reset" class="button" value='<fmt:message key=" webclient.map.cv.addcontainer.button.reset "/>'>  </td>
        <td>&nbsp;</td>
  </tr>

</table>
</html:form>
 <html:javascript formName="AddContainer"/> 
</body>
</html>
