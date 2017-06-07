//$Id: DateComponent.js,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $

var popups = [];
//Constructor Function - representing a DATE Component
function DateObject(obj_target, action) {
	// validate input parameters
	if (!obj_target)
		return cal_error("Error calling the calendar: no target control specified");
	if (obj_target.value == null)
		return cal_error("Error calling the calendar: parameter specified is not valid target control");

	if (!action)
		return cal_error("Struts Action implementation is not specified");
		
        if(!action)
        {
                this.action = defaction;
        }
        else
        {
                this.action = action;
        }

        this.setValue = setValue;
        this.getValue = getValue;
	this.target = obj_target;
	this.id = popups.length;
	// member functions

	this.popup    = popup;

	// Initial : register in global collections
	popups[this.id] = this;
}

function setValue(value)
{
        this.target.value = value;
}

function getValue()
{
        return (this.target.value);
}

//Window popup - function
function popup()
{
	var obj_calwindow = window.open(this.action+'?id=' + this.id,
		'Calendar', 'width=220,height=260,status=no,resizable=no,top=190,left=190,dependent=yes,alwaysRaised=yes'
	);
	obj_calwindow.opener = window;
	obj_calwindow.focus();
}

function cal_error (str_message)
{
	alert (str_message);
	return null;
}
