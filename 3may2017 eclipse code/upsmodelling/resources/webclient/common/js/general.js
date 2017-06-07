// $Id $


//Utility Functions

if (document.all)

	var browser_ie=true

else if (document.layers)

	var browser_nn4=true

else if (document.layers || (!document.all && document.getElementById))

	var browser_nn6=true



function getObj(n,d) {

  var p,i,x; 

  if(!d)

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

	

function getOpenerObj(n) {

    return getObj(n,opener.document)

}



function findPosX(obj) {

	var curleft = 0;

	if (document.getElementById || document.all) {

		while (obj.offsetParent) {

			curleft += obj.offsetLeft

			obj = obj.offsetParent;

		}

	} else if (document.layers) {

		curleft += obj.x;

	}



	return curleft;

}



function findPosY(obj) {

	var curtop = 0;



	if (document.getElementById || document.all) {

		while (obj.offsetParent) {

			curtop += obj.offsetTop

			obj = obj.offsetParent;

		}

	} else if (document.layers) {

		curtop += obj.y;

	}



	return curtop;

}



function clearTextSelection() {

	if (browser_ie) document.selection.empty();

    else if (browser_nn4 || browser_nn6) window.getSelection().removeAllRanges();

}

// Setting cookies
function set_cookie ( name, value, exp_y, exp_m, exp_d, path, domain, secure )
{
  var cookie_string = name + "=" + escape ( value );

  if (exp_y) //delete_cookie(name)
  {
    var expires = new Date ( exp_y, exp_m, exp_d );
    cookie_string += "; expires=" + expires.toGMTString();
  }

  if (path) cookie_string += "; path=" + escape ( path );
  if (domain) cookie_string += "; domain=" + escape ( domain );
  if (secure) cookie_string += "; secure";

  document.cookie = cookie_string;
}

// Retrieving cookies
function get_cookie(cookie_name)
{
  var results = document.cookie.match(cookie_name + '=(.*?)(;|$)');
  if (results) return (unescape(results[1]));
  else return null;
}

// Delete cookies 
function delete_cookie( cookie_name )
{
  var cookie_date = new Date ( );  // current date & time
  cookie_date.setTime ( cookie_date.getTime() - 1 );
  document.cookie = cookie_name += "=; expires=" + cookie_date.toGMTString();
}

//End of Utility Functions


function emptyCheck(fldName,fldLabel, fldType) {
    var currObj=getObj(fldName)

        if( fldType && currObj.value == "none" ) {

                alert(fldLabel+" cannot be none")

                return false

        }   

    if (currObj.value.replace(/^\s+/g, '').replace(/\s+$/g, '').length==0) {

                alert(fldLabel+" cannot be empty")

                currObj.focus()

                return false

    }

        else

            return true

}



function patternValidate(fldName,fldLabel,type) {
    var currObj=getObj(fldName)


    if (type.toUpperCase()=="EMAIL") //Email ID validation
		var re=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/
//        var re=new RegExp(/^.+@.+\..+$/)
    
    if (type.toUpperCase()=="DATE") {//DATE validation
        //YMD
//        var reg1 = /^\d{2}(\-|\/|\.)\d{1,2}\1\d{1,2}$/ //2 digit year
        var re = /^\d{4}(\-|\/|\.)\d{1,2}\1\d{1,2}$/ // 4 digit year
       
        //MYD
//        var reg1 = /^\d{1,2}(\-|\/|\.)\d{2}\1\d{1,2}$/
//        var reg2 = /^\d{1,2}(\-|\/|\.)\d{4}\1\d{1,2}$/
       
       //DMY
//        var reg1 = /^\d{1,2}(\-|\/|\.)\d{1,2}\1\d{2}$/
//        var reg2 = /^\d{1,2}(\-|\/|\.)\d{1,2}\1\d{4}$/
    }
    
    if (type.toUpperCase()=="TIME") {//TIME validation
        var re = /^\d{1,2}(\:\d{1,2})*$/
    }
	
    if (!re.test(currObj.value)) {
        alert("Please enter a valid "+fldLabel)
        currObj.focus()
        return false
    }
}

function emailValidate(fldName,fldLabel) {
	if(patternValidate(fldName,fldLabel,"EMAIL")==false)
            return false;
        return true;
}

function comparingDates(date1,fldLabel1,date2,fldLabel2,type) {

    var ret=true	
    switch (type) {
        case 'L'    :    if (date1>=date2) {//DATE1 VALUE LESS THAN DATE2
                            alert(fldLabel1+" should be less than "+fldLabel2)
                            ret=false
                        }
                        break;
        case 'LE'    :    if (date1>date2) {//DATE1 VALUE LESS THAN OR EQUAL TO DATE2
                            alert(fldLabel1+" should be less than or equal to "+fldLabel2)
                            ret=false
                        }
                        break;
        case 'E'    :    if (date1!=date2) {//DATE1 VALUE EQUAL TO DATE
                            alert(fldLabel1+" should be equal to "+fldLabel2)
                            ret=false
                        }
                        break;
        case 'G'    :    if (date1<=date2) {//DATE1 VALUE GREATER THAN DATE2
                            alert(fldLabel1+" should be greater than "+fldLabel2)
                            ret=false
                        }
                        break;    
        case 'GE'    :    if (date1<date2) {//DATE1 VALUE GREATER THAN OR EQUAL TO DATE2
                            alert(fldLabel1+" should be greater than or equal to "+fldLabel2)
                            ret=false
                        }
                        break;
    }
    
    if (ret==false) return false
    else return true
}

function dateTimeValidate(dateFldName,timeFldName,fldLabel,type) {
    if(patternValidate(dateFldName,fldLabel,"DATE")==false)
        return false;
    dateval=getObj(dateFldName).value.replace(/^\s+/g, '').replace(/\s+$/g, '')
    
    if (dateval.indexOf("-")>=0) datesep="-"
    else if (dateval.indexOf(".")>=0) datesep="."
    else if (dateval.indexOf("/")>=0) datesep="/"
    
    dd=dateval.substr(dateval.lastIndexOf(datesep)+1,dateval.length)
    mm=dateval.substring(dateval.indexOf(datesep)+1,dateval.lastIndexOf(datesep))
    yyyy=dateval.substring(0,dateval.indexOf(datesep))
    
    if (dd<1 || dd>31 || mm<1 || mm>12 || yyyy<1 || yyyy<1000) {
        alert("Please enter a valid "+fldLabel)
        getObj(dateFldName).focus()
		if (dd<1 || dd>31) selInvalidText(getObj(dateFldName),dd)
		if (mm<1 || mm>12) selInvalidText(getObj(dateFldName),mm)
		if (yyyy<1 || yyyy<1000) selInvalidText(getObj(dateFldName),yyyy)
        return false
    }
    
    if ((mm==2) && (dd>29)) {//checking of no. of days in february month
        alert("Please enter a valid "+fldLabel)
        getObj(dateFldName).focus()
		selInvalidText(getObj(dateFldName),dd)
        return false
    }
    
    if ((mm==2) && (dd>28) && ((yyyy%4)!=0)) {//leap year checking
        alert("Please enter a valid "+fldLabel)
        getObj(dateFldName).focus()
		selInvalidText(getObj(dateFldName),dd)
        return false
    }

    switch (parseInt(mm)) {
        case 2 :
        case 4 :
        case 6 :
        case 9 :
        case 11 :    if (dd>30) {
                        alert("Please enter a valid "+fldLabel)
                        getObj(dateFldName).focus()
						selInvalidText(getObj(dateFldName),dd)
                        return false
                    }    
    }
    
    if (patternValidate(timeFldName,fldLabel,"TIME")==false)
        return false
        
    var timeval=getObj(timeFldName).value.replace(/^\s+/g, '').replace(/\s+$/g, '')
    var hourval=parseInt(timeval.substring(0,timeval.indexOf(":")))
    var minval=parseInt(timeval.substring(timeval.indexOf(":")+1,timeval.length))
    var currObj=getObj(timeFldName)
    
    if (hourval>23 || minval>59) {
        alert("Please enter a valid "+fldLabel)
        currObj.focus()
		if (hourval>23) selInvalidText(getObj(timeFldName),hourval)
		if (minval>59) selInvalidText(getObj(timeFldName),minval)
        return false
    }
    
    var currdate=new Date()
    var chkdate=new Date()
    chkdate.setYear(yyyy)
    chkdate.setMonth(mm-1)
    chkdate.setDate(dd)
    chkdate.setHours(hourval)
    chkdate.setMinutes(minval)

    
    if (type!="OTH") {
        if (!comparingDates(chkdate,fldLabel,currdate,"current date & time",type)) {
            getObj(dateFldName).focus()
            return false
        } else return true;
    } else return true;
}

function dateTimeComparison(dateFldName1,timeFldName1,fldLabel1,dateFldName2,timeFldName2,fldLabel2,type) {
    var dateval1=getObj(dateFldName1).value.replace(/^\s+/g, '').replace(/\s+$/g, '')
    var dateval2=getObj(dateFldName2).value.replace(/^\s+/g, '').replace(/\s+$/g, '')
    
    if (dateval1.indexOf("-")>=0) date1sep="-"
    else if (dateval1.indexOf(".")>=0) date1sep="."
    else if (dateval1.indexOf("/")>=0) date1sep="/"
    
    var dd1=dateval1.substr(dateval1.lastIndexOf(date1sep)+1,dateval1.length)
    var mm1=dateval1.substring(dateval1.indexOf(date1sep)+1,dateval1.lastIndexOf(date1sep))
    var yyyy1=dateval1.substring(0,dateval1.indexOf(date1sep))
    
    if (dateval2.indexOf("-")>=0) date2sep="-"
    else if (dateval2.indexOf(".")>=0) date2sep="."
    else if (dateval2.indexOf("/")>=0) date2sep="/"

    var dd2=dateval2.substr(dateval2.lastIndexOf(date2sep)+1,dateval2.length)
    var mm2=dateval2.substring(dateval2.indexOf(date2sep)+1,dateval2.lastIndexOf(date2sep))
    var yyyy2=dateval2.substring(0,dateval2.indexOf(date2sep))
    
    var timeval1=getObj(timeFldName1).value.replace(/^\s+/g, '').replace(/\s+$/g, '')
    var timeval2=getObj(timeFldName2).value.replace(/^\s+/g, '').replace(/\s+$/g, '')
    
    var hh1=timeval1.substring(0,timeval1.indexOf(":"))
    var min1=timeval1.substring(timeval1.indexOf(":")+1,timeval1.length)
    
    var hh2=timeval2.substring(0,timeval2.indexOf(":"))
    var min2=timeval2.substring(timeval2.indexOf(":")+1,timeval2.length)
    
    var date1=new Date()
    var date2=new Date()        
    
    date1.setYear(yyyy1)
    date1.setMonth(mm1-1)
    date1.setDate(dd1)
    date1.setHours(hh1)
    date1.setMinutes(min1)
    
    date2.setYear(yyyy2)
    date2.setMonth(mm2-1)
    date2.setDate(dd2)
    date2.setHours(hh2)
    date2.setMinutes(min2)
	
    
    if (type!="OTH") {
        if (!comparingDates(date1,fldLabel1,date2,fldLabel2,type)) {
            getObj(dateFldName1).focus()
            return false
        } else return true;
    } else return true;
}

function dateValidate(fldName,fldLabel,type) {
    if(patternValidate(fldName,fldLabel,"DATE")==false)
        return false;
    dateval=getObj(fldName).value.replace(/^\s+/g, '').replace(/\s+$/g, '')
    
    if (dateval.indexOf("-")>=0) datesep="-"
    else if (dateval.indexOf(".")>=0) datesep="."
    else if (dateval.indexOf("/")>=0) datesep="/"
    
    dd=dateval.substr(dateval.lastIndexOf(datesep)+1,dateval.length)
    mm=dateval.substring(dateval.indexOf(datesep)+1,dateval.lastIndexOf(datesep))
    yyyy=dateval.substring(0,dateval.indexOf(datesep))
    
    if (dd<1 || dd>31 || mm<1 || mm>12 || yyyy<1 || yyyy<1000) {
        alert("Please enter a valid "+fldLabel)
        getObj(fldName).focus()
		if (dd<1 || dd>31) selInvalidText(getObj(fldName),dd)
		if (mm<1 || mm>12) selInvalidText(getObj(fldName),mm)
		if (yyyy<1 || yyyy<1000) selInvalidText(getObj(fldName),yyyy)
        return false
    }
    
    if ((mm==2) && (dd>29)) {//checking of no. of days in february month
        alert("Please enter a valid "+fldLabel)
        getObj(fldName).focus()
		selInvalidText(getObj(fldName),dd)
        return false
    }
    
    if ((mm==2) && (dd>28) && ((yyyy%4)!=0)) {//leap year checking
        alert("Please enter a valid "+fldLabel)
        getObj(fldName).focus()
		selInvalidText(getObj(fldName),dd)
        return false
    }

    switch (parseInt(mm)) {
        case 2 :
        case 4 :
        case 6 :
        case 9 :
        case 11 :    if (dd>30) {
                        alert("Please enter a valid "+fldLabel)
                        getObj(fldName).focus()
						selInvalidText(getObj(fldName),dd)
                        return false
                    }    
    }
    
    var currdate=new Date()
    var chkdate=new Date()
    
    chkdate.setYear(yyyy)
    chkdate.setMonth(mm-1)
    chkdate.setDate(dd)
    
    if (type!="OTH") {
        if (!comparingDates(chkdate,fldLabel,currdate,"current date",type)) {
            getObj(fldName).focus()
            return false
        } else return true;
    } else return true;
}

function dateComparison(fldName1,fldLabel1,fldName2,fldLabel2,type) {
    var dateval1=getObj(fldName1).value.replace(/^\s+/g, '').replace(/\s+$/g, '')
    var dateval2=getObj(fldName2).value.replace(/^\s+/g, '').replace(/\s+$/g, '')
    
    if (dateval1.indexOf("-")>=0) date1sep="-"
    else if (dateval1.indexOf(".")>=0) date1sep="."
    else if (dateval1.indexOf("/")>=0) date1sep="/"
    
    var dd1=dateval1.substr(dateval1.lastIndexOf(date1sep)+1,dateval1.length)
    var mm1=dateval1.substring(dateval1.indexOf(date1sep)+1,dateval1.lastIndexOf(date1sep))
    var yyyy1=dateval1.substring(0,dateval1.indexOf(date1sep))
    
    if (dateval2.indexOf("-")>=0) date2sep="-"
    else if (dateval2.indexOf(".")>=0) date2sep="."
    else if (dateval2.indexOf("/")>=0) date2sep="/"

    var dd2=dateval2.substr(dateval2.lastIndexOf(date2sep)+1,dateval2.length)
    var mm2=dateval2.substring(dateval2.indexOf(date2sep)+1,dateval2.lastIndexOf(date2sep))
    var yyyy2=dateval2.substring(0,dateval2.indexOf(date2sep))
    
    var date1=new Date()
    var date2=new Date()        
    
    date1.setYear(yyyy1)
    date1.setMonth(mm1-1)
    date1.setDate(dd1)        
    
    date2.setYear(yyyy2)
    date2.setMonth(mm2-1)
    date2.setDate(dd2)
    
    if (type!="OTH") {
        if (!comparingDates(date1,fldLabel1,date2,fldLabel2,type)) {
            getObj(fldName1).focus()
            return false
        } else return true;
    } else return true
}

function timeValidate(fldName,fldLabel,type) {
    if (patternValidate(fldName,fldLabel,"TIME")==false)
        return false
        
    var timeval=getObj(fldName).value.replace(/^\s+/g, '').replace(/\s+$/g, '')
    var hourval=parseInt(timeval.substring(0,timeval.indexOf(":")))
    var minval=parseInt(timeval.substring(timeval.indexOf(":")+1,timeval.length))
    var currObj=getObj(fldName)
    
    if (hourval>23 || minval>59) {
        alert("Please enter a valid "+fldLabel)
        currObj.focus()
		if (hourval>23) selInvalidText(getObj(fldName),hourval)
		if (minval>59) selInvalidText(getObj(fldName),minval)
        return false
    }
    
    var currtime=new Date()
    var chktime=new Date()
    
    chktime.setHours(hourval)
    chktime.setMinutes(minval)
    
    if (type!="OTH") {
        if (!comparingDates(chktime,fldLabel,currtime,"current time",type)) {
            getObj(fldName).focus()
            return false
        } else return true;
    } else return true
}

function timeComparison(fldName1,fldLabel1,fldName2,fldLabel2,type) {
    var timeval1=getObj(fldName1).value.replace(/^\s+/g, '').replace(/\s+$/g, '')
    var timeval2=getObj(fldName2).value.replace(/^\s+/g, '').replace(/\s+$/g, '')
    
    var hh1=timeval1.substring(0,timeval1.indexOf(":"))
    var min1=timeval1.substring(timeval1.indexOf(":")+1,timeval1.length)
    
    var hh2=timeval2.substring(0,timeval2.indexOf(":"))
    var min2=timeval2.substring(timeval2.indexOf(":")+1,timeval2.length)

    var time1=new Date()
    var time2=new Date()        
    
    time1.setHours(hh1)
    time1.setMinutes(min1)
    
    time2.setHours(hh2)
    time2.setMinutes(min2)

    if (type!="OTH") {    
        if (!comparingDates(time1,fldLabel1,time2,fldLabel2,type)) {
            getObj(fldName1).focus()
            return false
        } else return true;
    } else return true;
}

function numValidate(fldName,fldLabel,format) {
    var val=getObj(fldName).value.replace(/^\s+/g, '').replace(/\s+$/g, '')
    if (format!="any") {
        var format=format.split(",")
        var restr="/^\\d{1,"+format[0]+"}(\\.\\d{1,"+format[0]+"})$/"
        var re=eval(restr)
    } else {
        //var re=/^\d+(\.\d\d*)*$/
	var re=/^\d+(,(\d)+)*(\.\d{1,2})*$/ 
    }
    
    if (!re.test(val)) {
        alert("Invalid "+fldLabel)
        getObj(fldName).focus()
        return false
    } else return true
}

function intValidate(fldName,fldLabel) {
    var val=getObj(fldName).value.replace(/^\s+/g, '').replace(/\s+$/g, '')
    if (isNaN(val) || val.indexOf(".")!=-1) {
        alert("Invalid "+fldLabel)
        getObj(fldName).focus()
        return false
    } else return true
}

function numConstComp(fldName,fldLabel,type,constval) {
    var val=parseFloat(getObj(fldName).value.replace(/^\s+/g, '').replace(/\s+$/g, ''))
    constval=parseFloat(constval)

    var ret=true
    switch (type) {
        case "L"  : if (val>=constval) {
                        alert(fldLabel+" should be less than "+constval)
                        ret=false
                    }
                    break;
        case "LE" :    if (val>constval) {
                    alert(fldLabel+" should be less than or equal to "+constval)
                    ret=false
                    }
                    break;
        case "E"  :    if (val!=constval) {
                                        alert(fldLabel+" should be equal to "+constval)
                                        ret=false
                                }
                                break;
        case "NE" : if (val==constval) {
                         alert(fldLabel+" should not be equal to "+constval)
                            ret=false
                    }
                    break;
        case "G"  :    if (val<=constval) {
                            alert(fldLabel+" should be greater than "+constval)
                            ret=false
                    }
                    break;
        case "GE" : if (val<constval) {
                            alert(fldLabel+" should be greater than or equal to "+constval)
                            ret=false
                    }
                    break;
    }
    
    if (ret==false) {
        getObj(fldName).focus()
        return false
    } else return true;
}

function selInvalidText(currFld,selText) {
	//seltexting the populated value
	if (browser_ie) {
		if (currFld.createTextRange()) {
			var selRange=currFld.createTextRange()
			selRange.findText(selText)
			selRange.select()
		}
	} else if (browser_nn4 || browser_nn6) {
		currFld.setSelectionRange(currFld.value.indexOf(selText),parseInt(currFld.value.indexOf(selText)+selText.length))
	}
}

function formValidate() {
    for (var i=0; i<fieldname.length; i++) {
        var type=fielddatatype[i].split("~")
        if (type[1]=="M") {
            if (!emptyCheck(fieldname[i],fieldlabel[i]))
                return false
        }
        
        switch (type[0]) {
            case "O"  : break;
            case "V"  : break;
            case "C"  : break;
			case "E"  : 
						if (getObj(fieldname[i]).value.replace(/^\s+/g, '').replace(/\s+$/g, '').length!=0) {
							if (!emailValidate(fieldname[i],fieldlabel[i]))
                            	return false
						}
						break;
            case "DT" :
                    if (getObj(fieldname[i]).value.replace(/^\s+/g, '').replace(/\s+$/g, '').length!=0)
			{
                    if(typeof(type[3])=="undefined") var currdatechk="OTH"
                                        else var currdatechk=type[3]
                    
                    if (!dateTimeValidate(fieldname[i],type[2],fieldlabel[i],currdatechk))
                            return false
                           if (type[4]) {
                            if (!dateTimeComparison(fieldname[i],type[2],fieldlabel[i],type[5],type[6],type[4]))
                                return false

                           }    
			}
                           break;
            case "D"  :    
                    if (getObj(fieldname[i]).value.replace(/^\s+/g, '').replace(/\s+$/g, '').length!=0)
			{
                    if(typeof(type[2])=="undefined") var currdatechk="OTH"
                                        else var currdatechk=type[2]

                    if (!dateValidate(fieldname[i],fieldlabel[i],currdatechk))
                            return false
                    if (type[3]) {
                        if (!dateComparison(fieldname[i],fieldlabel[i],type[4],type[5],type[3]))
                                return false
                          }    
			}
                           break;
            case "T"  :
                    if (getObj(fieldname[i]).value.replace(/^\s+/g, '').replace(/\s+$/g, '').length!=0)
		    {
                    if(typeof(type[2])=="undefined") var currtimechk="OTH"
                                        else var currtimechk=type[2]

                    if (!timeValidate(fieldname[i],fieldlabel[i],currtimechk))
                            return false
                        if (type[3]) {
                            if (!timeComparison(fieldname[i],fieldlabel[i],type[4],type[5],type[3]))
                                return false
                           }
		}
                           break;
            case "I"  :    
                    if (getObj(fieldname[i]).value.replace(/^\s+/g, '').replace(/\s+$/g, '').length!=0)
                   {
                        if (!intValidate(fieldname[i],fieldlabel[i]))
                            return false
                           if (type[2]) {
                            if (!numConstComp(fieldname[i],fieldlabel[i],type[2],type[3]))
                                return false
                           }
                    }
                       break;
            case "N"  :
                    if (getObj(fieldname[i]).value.replace(/^\s+/g, '').replace(/\s+$/g, '').length!=0)
                    {
                        if (typeof(type[2])=="undefined") var numformat="any"
                        else var numformat=type[2]
                    
                        if (!numValidate(fieldname[i],fieldlabel[i],numformat))
                            return false
                           if (type[3]) {
                               if (!numConstComp(fieldname[i],fieldlabel[i],type[3],type[4]))
                                return false
                           }
                    }
                    break;
        }
    }

    return true
}




function clearId(fldName) {

	var currObj=getObj(fldName)	

	currObj.value=""

}

function showCalc(fldName) {
	var currObj=getObj(fldName)
	openPopUp("calcWin",currObj,"/crm/Calc.do?currFld="+fldName,"Calc",170,220,"menubar=no,toolbar=no,location=no,status=no,scrollbars=no,resizable=yes")
}

function showLookUp(fldName,fldId,fldLabel,searchmodule,hostName,serverPort,username) {
	var currObj=getObj(fldName)

	//var fldValue=currObj.value.replace(/^\s+/g, '').replace(/\s+$/g, '')

	//need to pass the name of the system in which the server is running so that even when the search is invoked from another system, the url will remain the same

	openPopUp("lookUpWin",currObj,"/crm/Search.do?searchmodule="+searchmodule+"&fldName="+fldName+"&fldId="+fldId+"&fldLabel="+fldLabel+"&fldValue=&user="+username,"LookUp",500,400,"menubar=no,toolbar=no,location=no,status=no,scrollbars=yes,resizable=yes")
}

function openPopUp(winInst,currObj,baseURL,winName,width,height,features) {
	var left=parseInt(findPosX(currObj))
	var top=parseInt(findPosY(currObj))
	
	if (window.navigator.appName!="Opera") top+=parseInt(currObj.offsetHeight)
	else top+=(parseInt(currObj.offsetHeight)*2)+10

	if (browser_ie)	{
		top+=window.screenTop-document.body.scrollTop
		left-=document.body.scrollLeft
		if (top+height+30>window.screen.height) 
			top=findPosY(currObj)+window.screenTop-height-30 //30 is a constant to avoid positioning issue
		if (left+width>window.screen.width) 
			left=findPosX(currObj)+window.screenLeft-width
	} else if (browser_nn4 || browser_nn6) {
		top+=(scrY-pgeY)
		left+=(scrX-pgeX)
		if (top+height+30>window.screen.height) 
			top=findPosY(currObj)+(scrY-pgeY)-height-30
		if (left+width>window.screen.width) 
			left=findPosX(currObj)+(scrX-pgeX)-width
	}
	
	features="width="+width+",height="+height+",top="+top+",left="+left+";"+features
	eval(winInst+'=window.open("'+baseURL+'","'+winName+'","'+features+'")')
}

var scrX=0,scrY=0,pgeX=0,pgeY=0;

if (browser_nn4 || browser_nn6) {
	document.addEventListener("click",popUpListener,true)
}

function popUpListener(ev) {
	if (browser_nn4 || browser_nn6) {
		scrX=ev.screenX
		scrY=ev.screenY
		pgeX=ev.pageX
		pgeY=ev.pageY
	}
}

for (var i=0;i<document.forms.length;i++)
	document.forms[i].submitted=true


//Navigation Hide and show script

function toggle(obj,obj1) {

var el = document.getElementById(obj);
var ch = document.getElementById(obj1);
if ( el.style.display != 'none' ) {
el.style.display = 'none';
document.getElementById('hideandshow').className='hidenav';
}
else {
el.style.display = '';
document.getElementById('hideandshow').className='shownav';

}
}

//End

function hideElement(elementIDToHide)
{
  var objToHide = document.getElementById(elementIDToHide);
  objToHide.style.display = "none";
}

function getElementWidthHeight(ele)
{
        var elwidth = ele.offsetWidth;
        var elheight = ele.offsetHeight;
        return [elwidth, elheight];
}

function getDivLocation(ele)
{
        var eleLeft = 0;
        var eleTop = 0;
        if(ele.offsetParent){
                eleLeft = ele.offsetLeft;
                eleTop = ele.offsetTop;
                while(ele = ele.offsetParent){
                        eleLeft = eleLeft+ele.offsetLeft;
                        eleTop = eleTop+ele.offsetTop;
                }
        }
        return [eleLeft, eleTop];
}

function simpleSearch()
{
	this.document.ssearchForm.simpleSearchName.value =  trimAll(this.document.ssearchForm.simpleSearchName.value);
	if(this.document.ssearchForm.simpleSearchName.value == '')
        {
                alert("Enter the device name to search")
                        return false;
        }
        document.ssearchForm.submit();
}

//This is the help method. Pass the key referenceid for positioning & width
function showHelpDialog(key,referenceId,positionValue)
{
        document.getElementById('xContent').innerHTML=key;
	setPosToDiv(referenceId,'helpDiv',positionValue);
}


