//$Id: LoadPageScript.js,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $

function loadPage()
{
  var i, args=loadPage.arguments;
  for(i=0; i<(args.length-1); i+=2) 
  {
      eval(args[i]+".location='"+args[i+1]+"'");
  }
}

function loadFrame(url, target)
{
    window.open(url, target);
}
