//$Id $

function removeMapCV(viewId)
{
  if (viewId == 'ipnet.netmap')
  {
      alert("<fmt:message key='webclient.map.cv.deletesymbol.denied'/>");
  }
  else
  {
      var con = confirm('<fmt:message key="webclient.map.cv.deletesymbol.confirm"/>+ viewId');
      if ( con != true)
      {
          return;
      }
      else
      {
          url = "/map/MapCVAction.do?method=deleteMap&viewId=" +viewId;  
          location.href = url;
      }
  }
}


function deleteCVSymbol(viewId,symbolName)
{
  if (viewId == '' || symbolName== '')
  {
     return;
  }
  else
  {
      var con = confirm('<fmt:message key="R u sure want to delete Symbol"/>+ symbolName');
      if ( con != true)
      {
          return;
      }
      else
      {
          url = "/map/RemoveSymbol.do?viewId=" +viewId +"&symbolName=" +symbolName;  
          location.href = url;
      }
  }
}