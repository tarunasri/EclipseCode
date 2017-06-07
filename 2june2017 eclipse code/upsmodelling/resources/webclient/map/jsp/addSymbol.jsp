<%-- $Id: addSymbol.jsp,v 1.4 2010/10/29 13:47:10 swaminathap Exp $ --%>

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

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><h1>Network Maps</h1></td>
        </tr>
      </table>


<html:form  action = "/AddSymbolAction.do" onsubmit="return validateAddMapSymbol(this);" >
<input type=hidden name="viewId" value="<c:out value='${selectedNode}'/>">
<!-- <input type=hidden name="actionToPerform" value="<c:out value='${param.actionToPerform}'/>"> -->

<span class="errorText"><html:errors/></span>

<table style="margin-bottom:10px;" width="80%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='Add Symbol'/></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >


 <!--table width="100%" >
<tr class="header1Bg"> 
    <td height="30" class="header1Bg"><span class="header1">&nbsp;<fmt:message key='Add Symbol'/>
</span></td><td>&nbsp;</td>
</tr>
</table-->

  <table width="100%" border="0" align="left"  cellpadding="2" cellspacing="1">

    <tr> 
    <td width="160"><span class="text"><fmt:message key="webclient.map.cv.addsymbol.name"/></span></td>
    <td><html:text property="name"  name="AddMapSymbol"  styleClass="formStyle" /><font color="red" size="2" weight="300" >*
</font></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addsymbol.objname"/></span></td>
    <td><html:text property="objName"  name="AddMapSymbol"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addsymbol.label"/></span></td>
    <td><html:text property="label" name="AddMapSymbol" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addsymbol.status"/></span></td>
    <td><html:text property="status" name="AddMapSymbol" readonly="true" value="Clear"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>
<tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addsymbol.iconname"/></span></td>
    <td><html:text property="iconName" name="AddMapSymbol" value="pc.png" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addsymbol.objtype"/></span></td>
    <td><html:text property="objType" name="AddMapSymbol" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addsymbol.width"/></span></td>
    <td><html:text property="width" name="AddMapSymbol" value="55" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addsymbol.height"/></span></td>
        <td><html:text property="height" name="AddMapSymbol" value="55" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

<tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addsymbol.x"/></span></td>
    <td><html:text property="x"  name="AddMapSymbol" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addsymbol.y"/></span></td>
    <td><html:text property="y"  name="AddMapSymbol" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addsymbol.menuname"/></span></td>
    <td><html:text property="menuName" name="AddMapSymbol" styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addsymbol.parentname"/></span></td>
    <td><html:text property="parentName" name="AddMapSymbol"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>
    
    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addsymbol.mapname"/></span></td>
    <td><html-el:text property="mapName" name="AddMapSymbol" readonly="true" value ='${param.mapName}' styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>
   <!-- <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addsymbol.webnms"/></span></td>
    <td><html:text property="WebNMS" name="AddMapSymbol"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr> -->

    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addsymbol.anchored"/></span></td>
    <td><html-el:select property="anchored" name="AddMapSymbol"  styleClass="formStyle"> 
                <option >true
                <option selected>false
                </html-el:select>
    </td>
    <td>&nbsp;</td>
    </tr>
    
    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addsymbol.groupname"/></span></td>
    <td><html-el:text property="groupName" name="AddMapSymbol"  styleClass="formStyle" /></td>
    <td>&nbsp;</td>
    </tr>
<!--
    <tr> 
    <td><span class="text"><fmt:message key="webclient.map.cv.addsymbol.savechanges"/></span></td>
    <td><html:checkbox property="needToSave" name="AddMapSymbol" /></td>
    <td>&nbsp;</td>
    </tr> -->

    <tr> <td> &nbsp; </td>
    <td> <input name="symbolButton1" type="submit" class="button"  value=' <fmt:message key="webclient.map.cv.addsymbol.button.add"/> '>
    <input width="75" name="symbolButton2" type="reset" class="button" value='   <fmt:message key="webclient.map.cv.addsymbol.button.reset"/>  '>  </td>
        <td>&nbsp;</td>
  </tr>

</table>
</td>
    <td class="generalCurveRight"></td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
</html:form>
 <html:javascript formName="AddMapSymbol"/> 
</body>
</html>
