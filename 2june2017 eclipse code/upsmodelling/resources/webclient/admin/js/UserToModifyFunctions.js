/* $Id: UserToModifyFunctions.js,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ */

//Function to validate user name
function ValidateUserName()
{
        if(document.UserToModifyForm.userName.value == "")
        {
                alert("User name field cannot be blank");
                return false;
        }
        var username = document.UserToModifyForm.userName.value;
        for(var i=0;i<username.length;i++)
        {
                var charcode = username.charCodeAt(i);
                if(charcode <33 || charcode>126)
                {
                        alert("Invalid character(s) present in username");
                        return false;
                }
        }
        return true;

}

//Function to validate the form before submit
function Validate()
{
        if(!ValidateUserName())
        {
                return false;
        }
        return true;
}

function init()
{
    if(eval(document.UserToModifyForm.userName))
    {
        document.UserToModifyForm.userName.focus();
    }
}