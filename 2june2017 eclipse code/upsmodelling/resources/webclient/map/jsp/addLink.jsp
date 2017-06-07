<%-- $Id: addLink.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

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

<html:form  action = "/AddLinkAction.do" onsubmit="return validateAddLink(this);">

<!--<input type=hidden name="viewId" value="<c:out value='${param.mapName}'/>">
<input type=hidden name="actionToPerform" value="<c:out value='${param.actionToPerform}'/>">
-->
<span class="errorText"><html:errors/></span>

 <table width="100%" >
<tr class="header1Bg"> 
    <td height="30" class="header1Bg"><span class="header1">&nbsp;<fmt:message key='webclient.map.cv.addlink.header'/>
</span></td><td>&nbsp;</td>
</tr>
</table >

  <table width="80%" border="0" align="left"  cellpadding="2" class="botborder" cellspacing="1">

    <tr> 
    <td width="160"><span class="text"><fmt:message key="webclient.map.cv.addlink.name"/></span></td>
    <td><html:text property="name"  name="AddLink"  styleClass="formStyle" /><font color="red" size="2" weight="300" >*</td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addlink.objname"/></span></td>
    <td><html:text property="objName"  name="AddLink"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

 <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addlink.source"/></span></td>
    <td><html:text property="source" name="AddLink"  styleClass="formStyle" /><font color="red" size="2" weight="300" >*</td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addlink.dest"/></span></td>
    <td><html:text property="dest" name="AddLink" styleClass="formStyle" /><font color="red" size="2" weight="300" >*</td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addlink.thickness"/></span></td>
    <td><html:text property="thickness"  name="AddLink" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addlink.label"/></span></td>
    <td><html:text property="label" name="AddLink" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addlink.status"/></span></td>
    <td><html:text property="status" name="AddLink" readonly="true" value="Clear"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>
    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addlink.iconname"/></span></td>
    <td><html:text property="iconName" name="AddLink"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addlink.objtype"/></span></td>
    <td><html:text property="objType" name="AddLink" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addlink.linktype"/></span></td>
    <td><html:text property="linkType"  name="AddLink" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addlink.menuname"/></span></td>
    <td><html:text property="menuName" name="AddLink" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addlink.parentname"/></span></td>
    <td><html:text property="parentName" name="AddLink"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>
    
    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addlink.mapname"/></span></td>
    <td><html-el:text property="mapName" readonly="true" name="AddLink"  value ='${param.mapName}' styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>
   <!-- <tr> 
    <td><span class="text"><fmt:message key="WebNMS"/></span></td>
    <td><html:text property="WebNMS" name="AddLink"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr> -->

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addlink.anchored"/></span></td>
    <td><html-el:select property="anchored" name="AddLink"  styleClass="formStyle"> 
                <option selected>true
                <option>false
                </html-el:select>
         </td>
    <td>&nbsp;</td>
    </tr>
    
    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addlink.groupname"/></span></td>
    <td><html-el:text property="groupName" name="AddLink"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>
<!--
    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addlink.savechanges"/></span></td>
    <td><html:checkbox property="needToSave" name="AddLink" /></td>
    <td>&nbsp;</td>
    </tr> -->

    <tr> <td> &nbsp; </td>
    <td> <input name="symbolButton1" type="submit" class="button" value='   <fmt:message key="webclient.map.cv.addlink.button.addlink"/>   '>
    <input width="75" name="symbolButton2" type="reset" class="button" value='   <fmt:message key="webclient.map.cv.addlink.button.reset"/>   '>  </td>
        <td>&nbsp;</td>
  </tr>

</table>
</html:form>
 <html:javascript formName="AddLink"/> 
</body>
</html>
