/* $Id: validation.js,v 1.2 2010/10/29 13:47:01 swaminathap Exp $ */

function trimAll(str)
{
        /*************************************************************
        Input Parameter :str
        Purpose         : remove all white spaces in front and back of string
        Return          : str without white spaces
        ***************************************************************/

        //check for all spaces
        var objRegExp =/^(\s*)$/;
        if (objRegExp.test(str))
        {
                str = str.replace(objRegExp,'');
                if (str.length == 0)
                return str;
        }

        // check for leading and trailling spaces
        objRegExp = /^(\s*)([\W\w]*)(\b\s*$)/;
        if(objRegExp.test(str))
        {
                str = str.replace(objRegExp, '$2');
        }
        return str;
}

function isPositiveInteger(str)
{
        /*************************************************************
        Input Parameter :str
        Purpose         : to check whether given str is a positive integer
        Return          : true / false
        ***************************************************************/

	number = trimAll(str);
	if (isNaN(number))
	{
		return false;
	}
	else
	{
		if (number < 0)
		{
			return false;
		}
	}
	return true;
}

function isEmpty(str)
{
     var temp = trimAll(str);
     if(temp.length > 0 )
	return false;
     return true;
}

function isEmailId(str)
{
   var objRegExp  = /^[a-z0-9]([a-z0-9_\-\.]*)@([a-z0-9_\-\.]*)(\.[a-z]{2,3}(\.[a-z]{2}){0,2})$/i;
   return objRegExp.test(str); 
}

function isIpAddress(str)
{
	/***************************************************************
	input   : str
	purpose : To check the ip Address
	output  : returns true or false
	*****************************************************************/
	
	
	// we removed the usage of regular expression
	// as some of the browsers ( NN in Sun OS )
	// crashes when doing this validation.
	// now we use simple check for doing the same.

	var ipAddress = str.split(".");
	if(ipAddress.length != 4)
	{
		return false;
	}
	for(i=0;i<ipAddress.length;i++)
	{
		if(isPositiveInteger(ipAddress[i]))
		{
			var temp = parseInt(ipAddress[i],10);
			if(temp > 255)
			{
				return false;
			}
		}
		else
		{
			return false;
		}

	}
	return true;
}

function isSpecialSymbol(text)
{
	var specialChar = /[a-zA-Z0-9 .-]/g;
	text=text.replace(specialChar,"");
	if(text.length == '0')
	{
		return false;
	}
	else
	{
		return true;
	}
}


function validateBooleanValue(value)
{
	var checkVal=trimAll(value);
	if(checkVal== 'true' || checkVal=='false' || checkVal == 1 || checkVal== 0)
	{
		return true;
	}
	return false;
}

