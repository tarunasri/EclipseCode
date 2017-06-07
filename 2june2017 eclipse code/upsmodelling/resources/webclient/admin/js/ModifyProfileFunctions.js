/* $Id: ModifyProfileFunctions.js,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ */

function verifyTokens()
{
    var existingSize = document.ModifyProfileForm.existingGroups.options.length;
    var availableSize = document.ModifyProfileForm.availableGroups.options.length;

    var existingitems = "";
    var availableitems = "";
    if(existingSize != 0)
    {
        for(var i=0; i<existingSize; i++)
        {
	        if(i==0)
	        {
		        existingitems = document.ModifyProfileForm.existingGroups.options[i].value;
	        }
	        else
	        {
		        existingitems = existingitems + " " + document.ModifyProfileForm.existingGroups.options[i].value;
	        }
        }
        
        document.ModifyProfileForm.existingItems.value = existingitems;
     
    }
    if(availableSize != 0)
    {
        for(var i=0; i<availableSize; i++)
        {
	        if(i==0)
	        {
		        availableitems = document.ModifyProfileForm.availableGroups.options[i].value;
	        }
	        else
	        {
		        availableitems = availableitems + " " + document.ModifyProfileForm.availableGroups.options[i].value;
	        }
        }
        
        document.ModifyProfileForm.availableItems.value = availableitems;
        
    }
    return true;
}

function add()
{
    var currentSize = document.ModifyProfileForm.availableGroups.options.length;
    var selectSize =  document.ModifyProfileForm.existingGroups.options.length
    var selectionModel = new Array();

    for(var i=0; i<currentSize; i++)
    {
        selectionModel[i] = 0;
        if(document.ModifyProfileForm.availableGroups.options[i] != null)
        {
        	if(document.ModifyProfileForm.availableGroups.options[i].selected == true)
        	{
                        selectionModel[i] = 1;
                }
        }
    }

    for(i=(selectionModel.length-1);i>-1;i--)
    {
        if(selectionModel[i]==1)
        {
             		var xv = document.ModifyProfileForm.availableGroups.options[i].value;
            		var xn = document.ModifyProfileForm.availableGroups.options[i].text;
            		document.ModifyProfileForm.availableGroups.options[i] = null;
            		var add = new Option(xn, xv);
            		document.ModifyProfileForm.existingGroups.options[selectSize] = add;
            		selectSize = ++selectSize;
        }
    }
  
}
// PasswordExpCheck() method needs to be deprecated as checkbox has been removed
//Function to enable/disable PasswordExpirytime field based on the corresponding checkbox
function PasswordExpCheck()
{
        if(document.ModifyProfileForm.ispasswordexpiry.checked)
        {
                document.ModifyProfileForm.passwordExpiryTime.disabled = false;
                document.ModifyProfileForm.passwordExpiryTime.focus();
                document.ModifyProfileForm.passwordExpiryTime.className = "formStyle";
        }
        else
        {
                document.ModifyProfileForm.passwordExpiryTime.disabled = true;
                document.ModifyProfileForm.passwordExpiryTime.className = "formStyleDisabled";
        }
}

// PassChangeCheck() method needs to be deprecated as checkbox has been removed
//Function to enable/disable password change
function PassChangeCheck()
{
        if(document.ModifyProfileForm.ispasschange.checked)
        {
                document.ModifyProfileForm.currentpassword.disabled = false;
                document.ModifyProfileForm.newPassword.disabled = false;
                document.ModifyProfileForm.retypepassword.disabled = false;


                document.ModifyProfileForm.currentpassword.className = "formStyle";
                document.ModifyProfileForm.newPassword.className = "formStyle";
                document.ModifyProfileForm.retypepassword.className = "formStyle";

                document.ModifyProfileForm.currentpassword.value = "";
                document.ModifyProfileForm.newPassword.value = "";
                document.ModifyProfileForm.retypepassword.value = "";

                document.ModifyProfileForm.currentpassword.focus();
        }
        else
        {
                document.ModifyProfileForm.currentpassword.value = "";
                document.ModifyProfileForm.newPassword.value = "";
                document.ModifyProfileForm.retypepassword.value = "";

                document.ModifyProfileForm.currentpassword.disabled = true;
                document.ModifyProfileForm.newPassword.disabled = true;
                document.ModifyProfileForm.retypepassword.disabled = true;

                document.ModifyProfileForm.currentpassword.className = "formStyleDisabled";
                document.ModifyProfileForm.newPassword.className = "formStyleDisabled";
                document.ModifyProfileForm.retypepassword.className = "formStyleDisabled";
        }
}

// AccountExpCheck() method needs to be deprecated as checkbox has been removed
//Function to enable/disable AccountExpiryTime field based on the corresponding checkbox
function AccountExpCheck()
{
        if(document.ModifyProfileForm.isaccountexpiry.checked)
        {
                document.ModifyProfileForm.accountExpiryTime.disabled = false;
                document.ModifyProfileForm.accountExpiryTime.focus();
                document.ModifyProfileForm.accountExpiryTime.className = "formStyle";
        }
        else
        {
                document.ModifyProfileForm.accountExpiryTime.disabled = true;
                document.ModifyProfileForm.accountExpiryTime.className = "formStyleDisabled";
        }
}


// resetFields() method needs to be deprecated as seperate edit page has been added.
function resetFields()
{
    document.ModifyProfileForm.reset();
    
    document.ModifyProfileForm.currentpassword.disabled = true;
    document.ModifyProfileForm.newPassword.disabled = true;
    document.ModifyProfileForm.retypepassword.disabled = true;
    
    document.ModifyProfileForm.currentpassword.className = "formStyleDisabled";
    document.ModifyProfileForm.newPassword.className = "formStyleDisabled";
    document.ModifyProfileForm.retypepassword.className = "formStyleDisabled";

   document.ModifyProfileForm.passwordExpiryTime.disabled = true;
   document.ModifyProfileForm.passwordExpiryTime.className = "formStyleDisabled";
   
   document.ModifyProfileForm.accountExpiryTime.disabled = true;
   document.ModifyProfileForm.accountExpiryTime.className = "formStyleDisabled";

}
