/* $Id: AdminOperations.js,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $*/

function showProgress()
{
	obj = getObj("inprogress_msg");
	obj.style.visibility="visible";
}


function getObj(n,d) {
	var p,i,x;  if(!d)
		d=document;
	if((p=n.indexOf("?"))>0&&parent.frames.length) {
		d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);
	}

	if(!(x=d[n])&&d.all)
		x=d.all[n];

	for(i=0;!x&&i<d.forms.length;i++)
		x=d.forms[i][n];

	for(i=0;!x&&d.layers&&i<d.layers.length;i++)
		x=getObj(n,d.layers[i].document);

	if(!x && d.getElementById)
		x=d.getElementById(n);

	return x;
}
