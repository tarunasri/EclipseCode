<%-- $Id: ResultPage.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el" %>
<html>
<script language="JavaScript" type="text/JavaScript">

    function windowFunction()
    {
        top.window.opener.document.forms[1].toPerform.value="loadNotifications";
        var url = top.window.opener.document.forms[1].action + "?selectedNotification="+'<c:out value="${selectedNotification}"/>'+"#configureNotif";
        top.window.opener.document.forms[1].action = url;
        verifyTokens();
        top.window.opener.document.forms[1].submit();
        window.close();
    }

    function verifyTokens()
    {
        var selectedViewSize = top.window.opener.document.forms[1].SelectedActions.options.length;
        var selecteditems = "";
    
        if(top.window.opener.document.forms[1].SelectedActions.options.length != 0)
        {
            for(var i=0; i<selectedViewSize; i++)
            {
        	    if(i==0)
	            {
		            selecteditems = top.window.opener.document.forms[1].SelectedActions.options[i].text;
    	        }
	            else
	            {
		            selecteditems = selecteditems+":"+top.window.opener.document.forms[1].SelectedActions.options[i].text;
    	        }
            }
            top.window.opener.document.forms[1].selitems.value = selecteditems;
            return true;
        }
    }

</script>
<body>
<%--
    <html:form action="/Result"> 
      <html-el:hidden property="actionType" value="${actionType}"/>
    </html:form>
--%>
</body>
<script>
    windowFunction();
</script>
</html>
