/* $Id: AddUserFunctions.js,v 1.2 2010/10/29 13:46:53 swaminathap Exp $ */

// Function to initialize the fields based on checkbox' state
function init()
{
    if(eval(document.AddUserForm.newUserName))
    {
        document.AddUserForm.newUserName.focus();
    }
}

//Function to enable/disable newgroup field based on the corresponding checkbox
function newGroupCheck()
{
        if(document.AddUserForm.ifnewgroup.checked)
        {
                document.AddUserForm.newGroup.disabled = false;
                document.AddUserForm.newGroup.focus();
                document.AddUserForm.newGroup.className = "formStyle";
        }
        else
        {
                document.AddUserForm.newGroup.value = "";
                document.AddUserForm.newGroup.disabled = true;
                document.AddUserForm.newGroup.className = "formStyleDisabled";
        }
}

//Function to enable/disable PasswordExpirytime field based on the corresponding checkbox
function PasswordExpCheck()
{
        if(document.AddUserForm.ispasswordexpiry.checked)
        {
                document.AddUserForm.passwordExpiryTime.disabled = false;
                document.AddUserForm.passwordExpiryTime.focus();
                document.AddUserForm.passwordExpiryTime.className = "formStyle";
        }
        else
        {
                document.AddUserForm.passwordExpiryTime.value = "";
                document.AddUserForm.passwordExpiryTime.disabled = true;
                document.AddUserForm.passwordExpiryTime.className = "formStyleDisabled";
        }
}

//Function to enable/disable AccountExpiryTime field based on the corresponding checkbox
function AccountExpCheck()
{
        if(document.AddUserForm.isaccountexpiry.checked)
        {
                document.AddUserForm.accountExpiryTime.disabled = false;
                document.AddUserForm.accountExpiryTime.focus();
                document.AddUserForm.accountExpiryTime.className = "formStyle";
        }
        else
        {
                document.AddUserForm.accountExpiryTime.value = "";
                document.AddUserForm.accountExpiryTime.disabled = true;
                document.AddUserForm.accountExpiryTime.className = "formStyleDisabled";
        }
}

function resetFields()
{
    document.AddUserForm.reset();
    document.AddUserForm.newGroup.disabled = true;
    document.AddUserForm.newGroup.className = "formStyleDisabled";
    document.AddUserForm.passwordExpiryTime.disabled = true;
    document.AddUserForm.passwordExpiryTime.className = "formStyleDisabled";
    document.AddUserForm.accountExpiryTime.disabled = true;
    document.AddUserForm.accountExpiryTime.className = "formStyleDisabled";
}

function userconfiguration()
{
	location.href="/admin/UserAdmin.do";
}

function cancel()
    {
    var checkBox=document.getElementsByName("selectall");
    for(var i=0;i<checkBox.length;i++)
    {
	checkBox[i].checked=false;
    }
    var uNameList = document.getElementsByName("userNameList");
    for(var i=0;i<uNameList.length;i++)
    {
    uNameList[i].value="";
    }
    var grpNameList = document.getElementsByName("GroupList");
    
    for(var i=0;i<grpNameList.length;i++)
    {
    var grpName = grpNameList[i];
    
    for(var j=0;j<grpName.options.length;j++)
    {
    grpName.options[j].selected=false;
    }
    grpNameList[i].disabled=false;
	
    }
    }
    
function selectAll(state,firstGroup) {
	for (var i=1;i<getObj("GroupList").length;i++) {
		if (state==true) {
            var selectedGroupSize = firstGroup.options.length;
            var groupInArray = getObj("GroupList")[i];
            for(var j=0; j<selectedGroupSize; j++)
            {
                if(firstGroup.options[j] != null)
                {
        	        if(firstGroup.options[j].selected == true) {
                        groupInArray.options[j].selected = true;
                    }
                    else {
                        groupInArray.options[j].selected = false;
                    }
                    
                }
            }
            //getObj("GroupList")[i].value=firstGroup.value;
        }
		getObj("GroupList")[i].disabled=state;
	}
}

