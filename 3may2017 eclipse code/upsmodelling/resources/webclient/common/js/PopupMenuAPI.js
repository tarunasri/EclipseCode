// $Id: PopupMenuAPI.js,v 1.2 2010/10/29 13:47:01 swaminathap Exp $
   windowToLoad = (isFrames) ? (NS4) ? parent : parent.document.body : window;
if(NS4)
{
    actualWidth = windowToLoad.innerWidth;
    actualHeight = windowToLoad.innerHeight;
    windowToLoad.onresize = reloadPage;
}
isInitialized = false;
resizedWindow = false;

if (!window.menuVersion) {
    clickKill = showVisited = NSfontOver = keepHilite = clickStart = false;
}

if (!window.imgHspace) imgHspace=0;

isWindows = (navigator.appVersion.indexOf("Win") != -1)
if (!isWindows) NSfontOver = showVisited = false;

milliSecsVisible = secondsVisible*1000;
isRight = (window.navFrLoc && navFrLoc == "right");

imageAlign = (isRight) ? ">"  : " ALIGN=RIGHT>";

imageTag = "<img src='" + imgSrc + "' width=" + imgSiz + " height=" + imgSiz +" vspace=2 hspace="+ imgHspace +" border=0"+ imageAlign;

fullImgSize = (imgSiz+(imgHspace*2));

if(IE4) imageTag = "<span style='height:100%;width:"+ (fullImgSize-(isRight?3:0)) +";float:"+ (isRight?"left":"right") +";overflow:hidden'>"+ imageTag +"</span>";


creationComplete = false;
    menuPosition = null;
menuArray=new Array()
    function initialize() {
	if(creationComplete) {
	    for(i=0;i<menuArray.count;i++)
	    {
		currentMenu = eval(menuArray[i]);
		clearTimeout(currentMenu.timerToHide);
		currentMenu.timerToHide=null;
	    }
	    clearTimeout(allTimer);
	}
	counter = 1;
	creationComplete = false;
	creationInProgress = false;
	isOverMenu = false;
	currentMenu = null;
	allTimer = null;
    }

initialize();

function unloadNS(){
    isInitialized = false;
}

function loadNS(e){
    if (e.target.name == mainFrName) {
	initialize();
	startIt();
    }
}

function unloadIE() {
    initialize();
    isInitialized = false;
    setTimeout("checkMenu()",50)
}

function checkMenu() {
    if (menuPosition.document.readyState == "complete") {
	initialize();
	startIt();
    }
    else {
	setTimeout("checkMenu()",50);
    }
}

function startIt(inputArr) {
    isInitialized = true;

    if (isFrames) {
	menuPosition = eval("parent.frames." + mainFrName);
	if (NS4) {
	    windowToLoad.captureEvents(Event.LOAD);
	    windowToLoad.onload = loadNS;
	    menuPosition.onunload = unloadNS;
	}
	if (IE4) {
	    menuPosition.document.body.onunload = unloadIE;

	}
    }
    else {
	menuPosition = window;
    }
    menuPosition.nav = nav = window;
    if (clickKill) {
	if (NS4) menuPosition.document.captureEvents(Event.MOUSEDOWN);
	menuPosition.document.onmousedown = clicked;
    }

    makeMenus(inputArr);	

}

function makeMenus(inputArr)
{
    creationInProgress = true;

    if(IE4) 
	{
		topIndex = 0;
		for (z=0;z<menuPosition.document.all.length;z++){
			prevMenu = menuPosition.document.all(z);
			topIndex = Math.max(prevMenu.style.lastIndex,topIndex)
		}
	}
	else if(DOM)
	{
		it=document.getElementsByTagName("DIV");
		//if(eval(it))
		topIndex=5000;
		topIndex=topIndex-1;
		//topIndex=it.length-1;
	}
    var i
	for(i=0;i<inputArr.length;i++)
	{
		//(DOM) ? makeMenuForDOM(false,inputArr[i]): (NS4) ? makeMenuForNS(false,inputArr[i]) : makeMenuForIE(false,inputArr[i]);
		(NS4) ? makeMenuForNS(false,inputArr[i],i) : makeMenuForIE(false,inputArr[i]);
	    counter++
	}

   // status = (counter-1) + " Hierarchical Menu Trees Created"
    creationComplete = true;
    creationInProgress = false;
}


function makeMenuForNS(isChild,tempArray,i,parentMenu,parentItem) 
{
    if (!isChild) 
    {
	menuArray[menuArray.length]=tempArray[0];
	tempWidth = tempArray[1] ? tempArray[1] : menuWidth;
	menu = makeElement(tempArray[0],tempWidth,null,null);
    }
    else 
    {
	menu = makeElement(tempArray[0],null,parentMenu,null);
	tempArray=terminate(tempArray)
    }
    menu.array = tempArray;
    menu.buildMenu = buildMenu;
    menu.buildMenu(isChild,parentMenu);

    while (menu.itemCount < menu.maxItems) {
	menu.itemCount++;
	prevItem = (menu.itemCount > 1) ? menu.item : null;
	if(!isChild)
	{
	    itemName = "item"+i+"_"+menu.itemCount;
		menu.item = makeElement(itemName,null,null,menu);
		
	    //itemName = tempArray[((menu.itemCount-1)*3)+10];
	}
	else
	{
		menu.item = makeElement(itemName+"_"+menu.itemCount,null,null,menu);
		
	    //itemName=tempArray[((menu.itemCount-1)*3)]
	}

	// this is not required as we not going to pass
	// the display names.
	//itemName=mask(itemName)

	//menu.item = makeElement(itemName,null,null,menu);

	menu.item.prevItem = prevItem;
	menu.item.setupItem = setupItem;
	menu.item.setupItem(menu.itemCount,menu.array,menu,isChild);
	if (menu.item.hasMore) {
	    makeMenuForNS(true,menu.item.hasMore,i,menu,menu.item);
	    menu = menu.parentMenu;
	}
    }

    menu.lastItem = menu.item;
    menu.menuSetup(isChild,parentMenu,parentItem);
}

function checkWhetherTree(men){
    isTree = false;
    for(i=11;i<men.array.length;i+=3){
	if(men.array[i]) {
	    isTree = true;
	    break;
	}
    }

    return isTree;
}

function buildMenu(isChild,parentMenu) 
{
    if (!isChild) 
    {
	this.name = this.array[0] ;
	this.menuWidth = this.array[1] ? this.array[1] : menuWidth;
	this.menuLeft = this.array[2];
	this.menuTop = this.array[3];
	this.menuFontColor = this.array[4] ? this.array[4] : fntCol;
	this.menuFontOver = this.array[5] ? this.array[5] : overFnt;
	this.menuBGColor = this.array[6] ? this.array[6] : backCol;
	this.menuBGOver = this.array[7] ? this.array[7] : overCol;
	this.menuBorderColor = this.array[8] ? this.array[8] : borCol;
	this.menuSeparatorColor = this.array[9] ? this.array[9] : separatorCol;
	this.treeParent = this;
	this.startChild = this;

	this.isTree = checkWhetherTree(this);
    }
    else {
	this.name=this.array[0];
	this.menuWidth = parentMenu.menuWidth;
	this.menuLeft = parentMenu.menuLeft;
	this.menuTop = parentMenu.menuTop;
	this.menuFontColor = parentMenu.menuFontColor;
	this.menuFontOver = parentMenu.menuFontOver;
	this.menuBGColor = parentMenu.menuBGColor;
	this.menuBGOver = parentMenu.menuBGOver;
	this.menuBorderColor = parentMenu.menuBorderColor;
	this.menuSeparatorColor = parentMenu.menuSeparatorColor;
	this.treeParent = parentMenu.treeParent;
	this.isTree = parentMenu.isTree;
    }

    this.maxItems = (isChild) ? (this.array.length)/3 : (this.array.length-10)/3; 
    this.hasParent = isChild;
    this.menuSetup = menuSetup;
    this.itemCount = 0;
}

function makeMenuForIE(isChild,tempArray,parentMenu) {
    menu = makeElement(tempArray[0]);
    if(isChild)
    {
	tempArray=terminate(tempArray)
    }
    else
	menuArray[menuArray.length]=tempArray[0];

    menu.array = eval(tempArray);

	menu.isChild=isChild;
    menu.buildMenu = buildMenu;
    menu.buildMenu(isChild,parentMenu);

    menu.itemString = "";

    while (menu.itemCount < menu.maxItems) {
	menu.itemCount++;
	if(!menu.isChild)
	    itemName = tempArray[((menu.itemCount-1)*3)+10];
	else
	    itemName=tempArray[((menu.itemCount-1)*3)]
		itemName=mask(itemName)


		arrayPointer = (menu.isChild) ? (menu.itemCount-1)*3 :((menu.itemCount-1)*3)+10;
	displayText = menu.array[arrayPointer];
	hasMore = menu.array[arrayPointer + 2];
	htmlString = (hasMore) ? imageTag + displayText : displayText;
	if(IE4)
	{
	menu.itemString += "<span id=" + itemName + " style=\"width:" + (menu.menuWidth-(borWid*2)) + ";text-align:center\">" + htmlString + "</span><br>";
	}
	else if(DOM)
	{
	menu.itemString += "<div id=" + itemName + " style=\"width:" + (menu.menuWidth-(borWid*2)) + ";text-align:center\">" + htmlString + "</div>";
	}

	if (hasMore) {
	    makeMenuForIE(true,hasMore,menu);
	    menu = menu.parentMenu;
	}	
    }

    //menu.innerHTML = menu.itemString;
    menu.innerHTML = menu.itemString;
	if(IE4)
	{
    itemCollection = menu.children.tags("SPAN");
	}
	else if(DOM)
	{
		itemCollection=menu.getElementsByTagName("DIV");
	}
	for (i=0; i<itemCollection.length; i++) {
		if (IE4)
		{
			it = itemCollection(i);
		}
		else if(DOM)
		{
			it = itemCollection[i];
		}
		it.setupItem = setupItem;
		it.setupItem(i+1,menu.array,menu,isChild);
	}
	if(IE4)
	{
    menu.lastItem = itemCollection(itemCollection.length-1);
	}
	else if(DOM)
	{
    menu.lastItem = itemCollection[itemCollection.length-1];
	}
    menu.menuSetup(menu.isChild,parentMenu,parentMenu);
}

function makeElement(element,width,parent,cont) 
{
	var menuObj;
	if (NS4) {
		if (!width) {
			//    width = width;
			//}
			//else {
			width = (cont) ? cont.menuWidth : parent.menuWidth;
		if (cont) width = width-(borWid*2)-(itemPad*2);
	}
	if (!cont) 
	{
		cont = menuPosition;
	}
	eval(element + "= new Layer(width,cont)");
	menuObj=eval(element);
	}
	else if(IE4) {
		tempStr = "<div id=" + element + " style='position:absolute'></div>";
		menuPosition.document.body.insertAdjacentHTML("BeforeEnd",tempStr);
		if (isFrames) eval(element + "= menuPosition." + element);
		menuObj=eval(element);
	}
	else if(DOM)
	{
		menuObj=document.createElement("DIV");
		with(menuObj)
		{
			id=element;
			with(style)
			{
				position="absolute";
				visibility="hidden";
				left="-500px";
				top="0px";
				width="0px";
				/*			left="500px";
							top="100px";
							width="150px"; */
				backgroundColor="#dfe9f2";
				zIndex=--topIndex;
			}
		}
		//menuObj.innerHTML=element;
		//		tempStr = "<div id=" + element + " style='position:absolute'></div>";
		//	menuPosition.document.body.insertAdjacentHTML("BeforeEnd",tempStr);
		//	if (isFrames) eval(element + "= menuPosition." + element);
		/*myMenuObj=new Object();
		  myMenuObj.trk=menuObj;
		  menuObj=myMenuObj;*/
		document.body.appendChild(menuObj);
	}
	return menuObj;
}
//changed above

function setupItem(selecteditem,whichArray,obj,checkForChild) 
{
    this.onmouseover = moveoveritem;
    this.onmouseout = moveoutofitem;
	if(DOM)
	{
		this.container=obj;
	}
	else
	{
    this.container = (NS4) ? this.parentLayer : this.offsetParent;
	}

	if(1)
    arrayPointer = (checkForChild) ? (selecteditem-1)*3 : ((selecteditem-1)*3)+10;
	else
    arrayPointer = (this.isChild) ? (selecteditem-1)*3 : ((selecteditem-1)*3)+10;

    this.displayText = whichArray[arrayPointer];
	this.linkText = whichArray[arrayPointer + 1];
    this.hasMore = whichArray[arrayPointer + 2];
	if (IE4 && this.hasMore) {
		this.child = eval(this.hasMore[0]);
		if(eval(this.child))
		{
		this.child.parentMenu = this.container;
		this.child.parentItem = this;
		}
	}
	else if (DOM && this.hasMore )
	{
		this.child = document.getElementById(this.hasMore[0]);
		this.child.parentMenu = this.container;
		this.child.parentItem = this;
	}

    if (this.linkText) {
	if (NS4) {
	    this.captureEvents(Event.MOUSEUP)
		this.onmouseup = Linkit;
	}
	else {
	    this.onclick = Linkit;
	    this.style.cursor = "hand";
	}
    }
	else
	{
		//alert("NO LINK<->"+this.id+"<->"+this.isChild+"<->"+arrayPointer+"<->"+whichArray[arrayPointer]+"<->"+whichArray[arrayPointer+1]+"<->"+whichArray[arrayPointer+2]);
	}

	if (NS4) {
		htmlString = this.displayText;
		if (fntBold) htmlString = htmlString.bold();
		if (fntItal) htmlString = htmlString.italics();

		htmlString = "<center><font face='" + fntFam + "' point-size=" + fntSiz + ">" + htmlString+ "</font></center>";

		this.mouseoverfont = htmlString.fontcolor(this.container.menuFontOver);
		this.htmlString = htmlString.fontcolor(this.container.menuFontColor);

		if(this.hasMore) {
			this.document.write(imageTag);
			this.document.close();
		}

		this.visibility = "inherit";
		this.bgColor = this.container.menuBGColor;

		if (selecteditem == 1) {
			this.top = borWid + itemPad;
		}
		else {
			this.top = this.prevItem.top + this.prevItem.clip.height + separator;
		}
		this.left = borWid + itemPad;
		this.clip.top = this.clip.left = -itemPad;
		this.clip.right = this.container.menuWidth-(borWid*2)-itemPad;

		Maxitxtwidth = this.container.menuWidth-(borWid*2)-(itemPad*2);
		if (this.container.isTree) Maxitxtwidth-=(fullImgSize); 

		this.txtLyr = new Layer(Maxitxtwidth,this);

		if (isRight && this.container.isTree) this.txtLyr.left = fullImgSize;

		this.txtLyr.document.write(this.htmlString);
		this.txtLyr.document.close();
		this.txtLyr.visibility = "inherit";

		this.clip.bottom = this.txtLyr.document.height+itemPad;

		this.unusedlayer = new Layer(100,this);
		this.unusedlayer.left = this.unusedlayer.top = -itemPad;
		this.unusedlayer.clip.width = this.clip.width;
		this.unusedlayer.clip.height = this.clip.height;
		this.unusedlayer.visibility = "inherit";
	}
	else  if(DOM){
		with (this.style) {
			padding = itemPad;

			if (this.container.isTree && !this.hasMore) {
				if (isRight) paddingLeft = itemPad+fullImgSize;
				else paddingRight = itemPad+fullImgSize;
			}
			color = this.container.menuFontColor;
			fontSize = fntSiz + "pt";
			fontWeight = (fntBold) ? "bold" : "normal";
			fontStyle =	(fntItal) ? "italic" : "normal";
			fontFamily = fntFam;

			//borderBottomWidth = separator + "px";
			borderBottomWidth = separator ;
			borderBottomColor = this.container.menuSeparatorColor;
			borderBottomStyle = "solid";
			backgroundColor = this.container.menuBGColor;
		}
	}
	else {
		with (this.style) {
			padding = itemPad;

			if (this.container.isTree && !this.hasMore) {
				if (isRight) paddingLeft = itemPad+fullImgSize;
				else paddingRight = itemPad+fullImgSize;
			}
			color = this.container.menuFontColor;
			fontSize = fntSiz + "pt";
			fontWeight = (fntBold) ? "bold" : "normal";
			fontStyle =	(fntItal) ? "italic" : "normal";
			fontFamily = fntFam;

			borderBottomWidth = separator + "px";
			borderBottomColor = this.container.menuSeparatorColor;
			borderBottomStyle = "solid";
			backgroundColor = this.container.menuBGColor;
		}
	}
}	

function menuSetup(hasParent,openCont,openItem) {
	this.onmouseover = menuOver;
	this.onmouseout = menuOut;

	this.showIt = showIt;
	this.showWithinWindow = showWithinWindow;
	this.hideTree = hideTree
		this.hideParents = hideParents;
	this.hideChildren = hideChildren;
	this.hideTop = hideTop;
	this.hasChildVisible = false;
	this.isOn = false;
	this.timerToHide = null;

	this.childOverlap = (perCentOver != null) ? ((perCentOver/100) * this.menuWidth) : childOverlap;
	this.currentItem = null;
	this.coverself = coverself;

	if (hasParent) {
		this.hasParent = true;
		this.parentMenu = openCont;
		if (NS4) {
			this.parentItem = openItem;
			this.parentItem.child = this;
		}
	}
	else {
		this.hasParent = false;
	}

	if (NS4) {
		this.bgColor = this.menuBorderColor;
		this.fullHeight = this.lastItem.top + this.lastItem.clip.bottom + borWid;
		this.clip.right = this.menuWidth;
		this.clip.bottom = this.fullHeight;
	}
	else if(IE4){
		with (this.style) {
			width = this.menuWidth;
			borderWidth = borWid;
			borderColor = this.menuBorderColor;
			borderStyle = borSty;
			lastIndex = topIndex;
		}

		this.lastItem.style.border="";
		this.fullHeight = this.scrollHeight;
		this.showIt(false);
		this.beginonselect = selectioncancel;
		this.moveTo = moveTo;
		this.moveTo(0,0);
	}
	else if(DOM){
		with (this.style) {
			width = this.menuWidth;
			//borderWidth = borWid+"px";
			borderWidth = borWid;
			borderColor = this.menuBorderColor;
			borderStyle = borSty;
			overflow = "hidden";
			cursor = "default";
			zIndex = --topIndex;
		}

		this.lastItem.style.border="";
		this.fullHeight = this.scrollHeight;
		this.showIt(false);
		this.beginonselect = selectioncancel;
		this.moveTo = moveTo;
		this.moveTo(0,0);
	}



}

function popUp(menuName,e,x,y){
    if (NS4 && resizedWindow) startIt();
    if (!isInitialized) return;
	if(!IE4 && DOM)
	{
    linkEl = e.target;
	}
	else
	{
    linkEl = (NS4) ? e.target : event.srcElement;
	}
    if (clickStart) linkEl.onclick = popMenu;
    if (!creationInProgress && !creationComplete) startIt();
    linkEl.menuName = menuName;	
    if (!clickStart) popMenu(e,x,y);
}

function popMenu(e,x,y){

    if (!isInitialized || !creationComplete) return true;

    eType = (NS) ? e.type : event.type;
    if (clickStart && eType != "click") return true;
    hideAll();

    linkEl = (NS) ? e.target : event.srcElement;

	if(!IE4 && DOM)
	{
    currentMenu = document.getElementById(linkEl.menuName);
	}
	else
	{
    currentMenu = eval(linkEl.menuName);
	}
    currentMenu.hasParent = false;
    currentMenu.treeParent.startChild = currentMenu;

    if (IE4) menuPositionBod = menuPosition.document.body;
    if (!isFrames) {
	xPos = (currentMenu.menuLeft) ? currentMenu.menuLeft : (NS) ? e.pageX : (event.clientX + menuPositionBod.scrollLeft);
	yPos = (currentMenu.menuTop) ? currentMenu.menuTop : (NS) ? e.pageY : (event.clientY + menuPositionBod.scrollTop);
    }
	else {
		switch (navFrLoc) {
			case "left":
				xPos = (currentMenu.menuLeft) ? currentMenu.menuLeft : (NS) ? menuPosition.pageXOffset : menuPositionBod.scrollLeft;
			yPos = (currentMenu.menuTop) ? currentMenu.menuTop : (NS) ? (e.pageY-pageYOffset)+menuPosition.pageYOffset : event.clientY + menuPositionBod.scrollTop;
			break;
			case "top":
				xPos = (currentMenu.menuLeft) ? currentMenu.menuLeft : (NS) ? (e.pageX-pageXOffset)+menuPosition.pageXOffset : event.clientX + menuPositionBod.scrollLeft;
			yPos = (currentMenu.menuTop) ? currentMenu.menuTop : (NS) ? menuPosition.pageYOffset : menuPositionBod.scrollTop;
			break;
			case "bottom":
				xPos = (currentMenu.menuLeft) ? currentMenu.menuLeft : (NS) ? (e.pageX-pageXOffset)+menuPosition.pageXOffset : event.clientX + menuPositionBod.scrollLeft;
			yPos = (currentMenu.menuTop) ? currentMenu.menuTop : (NS) ? menuPosition.pageYOffset+menuPosition.innerHeight : menuPositionBod.scrollTop + menuPositionBod.clientHeight;
			break;
			case "right":
				xPos = (currentMenu.menuLeft) ? currentMenu.menuLeft : (NS) ? menuPosition.pageXOffset+menuPosition.innerWidth : menuPositionBod.scrollLeft+menuPositionBod.clientWidth;
			yPos = (currentMenu.menuTop) ? currentMenu.menuTop : (NS) ? (e.pageY-pageYOffset)+menuPosition.pageYOffset : event.clientY + menuPositionBod.scrollTop;
			break;
		}
	}
if(eval(x))
	xPos=x;
if(eval(y))
	yPos=y;
    currentMenu.moveTo(xPos,yPos);
    currentMenu.showWithinWindow()
	currentMenu.isOn = true;
    currentMenu.showIt(true);
    return false;
}

function menuOver(e) {
    this.isOn = true;
    isOverMenu = true;
    currentMenu = this;
    if (this.timerToHide) clearTimeout(this.timerToHide);
}

function menuOut() {
    if (IE4) {
	theEvent = menuPosition.event;
	if (theEvent.srcElement.contains(theEvent.toElement)) return;
    }
    this.isOn = false;
    isOverMenu = false;

    menuPosition.status = "";
    if (!clickKill) allTimer = setTimeout("currentMenu.hideTree()",10);  
}

function moveoveritem(){
    if (keepHilite) {
	if (this.container.currentItem && this.container.currentItem != this) {
	    if (NS4) {
		this.container.currentItem.bgColor = this.container.menuBGColor;
		if (NSfontOver) {
		    with (this.container.currentItem.txtLyr.document) {
			write(this.container.currentItem.htmlString)
			    close();
		    }
		}
	    }
	    else {
		with (this.container.currentItem.style) {
		    backgroundColor = this.container.menuBGColor;
		    color = this.container.menuFontColor;
		}
	    }
	}
    }

    if (IE4) {
	theEvent = menuPosition.event;
	if (theEvent.srcElement.tagName == "IMG") return;
	this.style.backgroundColor = this.container.menuBGOver;
	this.style.color = this.container.menuFontOver;
    }
	else if(DOM)
	{
	this.style.backgroundColor = this.container.menuBGOver;
	this.style.color = this.container.menuFontOver;
	}
    else {
	this.bgColor = this.container.menuBGOver;
	if (NSfontOver) {
	    this.txtLyr.document.write(this.mouseoverfont);
	    this.txtLyr.document.close();
	}
    }

    menuPosition.status = this.linkText;

    this.container.currentItem = this;

    if (this.container.hasChildVisible) {
	if(eval(this.container.hideChildren))
	this.container.hideChildren(this);
    }

	if (this.hasMore) {
		horOffset = (isRight) ? (this.container.childOverlap - this.container.menuWidth) : (this.container.menuWidth - this.container.childOverlap);

		if (NS4) {
			this.childX = this.container.left + horOffset;

			this.childY = (this.pageY+this.clip.top) + childOffset;
		}
		else if(IE4)
		{
			this.childX = this.container.style.pixelLeft+ horOffset;
			this.childY =  this.offsetTop +this.container.style.pixelTop+ childOffset ;

		}
		else if(DOM)
		{
			this.childX = parseInt(this.container.style.left)+ horOffset;
			this.childY = this.offsetTop + childOffset;
			//The next 2 lines are added for the working of popup in 			//Netscape 6.1.
			if(this.offsetTop<parseInt(this.container.style.top))
			    this.childY = this.offsetTop + parseInt(this.container.style.top)+ childOffset;

			//this.childX = this.container.style.pixelLeft + horOffset;
			//this.childY = this.offsetTop + this.container.style.pixelTop + childOffset;
			//alert(this.offsetTop+"<->"+parseInt(this.container.style.top));
		}
		if(this.child)
		{
			this.child.moveTo(this.childX,this.childY);
			this.child.showWithinWindow();
			this.container.hasChildVisible = true;
			this.container.visibleChild = this.child;
			this.child.showIt(true);
		}
	}
}

function moveoutofitem() {
    if (IE4) {
	theEvent = menuPosition.event;
	if (theEvent.srcElement.contains(theEvent.toElement)
		|| (theEvent.fromElement.tagName=="IMG" && theEvent.toElement.contains(theEvent.fromElement)))
	    return;
	if (!keepHilite) {
	    this.style.backgroundColor = this.container.menuBGColor;
	    this.style.color = this.container.menuFontColor;
	}
    }
else  if (DOM) {
	if (!keepHilite) {
	    this.style.backgroundColor = this.container.menuBGColor;
	    this.style.color = this.container.menuFontColor;
	}
    }
    else {
	if (!keepHilite) {
	    this.bgColor = this.container.menuBGColor;
	    if (NSfontOver) {
		with (this.txtLyr.document) {
		    write(this.htmlString);
		    close();
		}
	    }

	}
	if (!isOverMenu && !clickKill) {
	    allTimer = setTimeout("currentMenu.hideTree()",10); 
	}
    }
}

function moveTo(xPos,yPos) {
	if(!IE4 && DOM)
	{
    //this.style.left = xPos+"px";
    //this.style.top = yPos+"px";
    this.style.left = xPos;
    this.style.top = yPos;
	}
	else
	{
    this.style.pixelLeft = xPos;
    this.style.pixelTop = yPos;
	}
}

function showIt(on) {

			if (NS4) {
				this.visibility = (on) ? "show" : "hide";
				if (keepHilite && this.currentItem) {
					this.currentItem.bgColor = this.menuBGColor;
					if (NSfontOver) {
						with (this.currentItem.txtLyr.document) {
							write(this.currentItem.htmlString);
							close();
						}
					}
				}
			}
			
			else if(IE4)
			{
				this.style.visibility = (on) ? "visible" : "hidden";
				if (keepHilite && this.currentItem) {
					with (this.currentItem.style) {
						backgroundColor = this.menuBGColor;
						color = this.menuFontColor;
					}
				}
			}
			else if(DOM)
			{
				this.style.visibility = (on) ? "visible" : "hidden";
				if (keepHilite && this.currentItem) {
					with (this.currentItem.style) {
						backgroundColor = this.menuBGColor;
						color = this.menuFontColor;
					}
				}
			}
	this.currentItem = null;
}

function showWithinWindow() 
{
    scrBars = 20;
    horiscroll = (isFrames && navFrLoc=="bottom") ? (borWid*2) : scrBars;
    vertiscroll = (isFrames && navFrLoc=="right") ? (borWid*2) : scrBars;
    if (NS4) {
	rightwindow = (menuPosition.pageXOffset + menuPosition.innerWidth) - vertiscroll;
	rightplacement = this.left + this.menuWidth;

	if (rightplacement > rightwindow) {
	    if (this.hasParent) {
		parentLeft = this.parentMenu.left;
		newLeft = ((parentLeft-this.menuWidth) + this.childOverlap);
		this.left = newLeft;
	    }
	    else {
		variation = rightplacement - rightwindow;
		this.left -= variation;
	    }
	}

	windowbottom = (menuPosition.pageYOffset + menuPosition.innerHeight) - horiscroll ;
	bottomposition = this.top + this.fullHeight;

	if (bottomposition > windowbottom) {
	    variation = bottomposition - windowbottom;
	    this.top -= variation;
	}

	windowleft = menuPosition.pageXOffset;
	leftposition = this.left;

	if (leftposition < windowleft) {
	    if (this.hasParent) {
		parentLeft = this.parentMenu.left;
		newLeft = ((parentLeft+this.menuWidth) - this.childOverlap);
		this.left = newLeft;
	    }
	    else {
		this.left = 5;
	    }
	}
    }
    else {
	rightwindow = (menuPosition.document.body.scrollLeft + menuPosition.document.body.clientWidth) - vertiscroll;
	rightplacement = this.style.pixelLeft + this.menuWidth;

	if (rightplacement > rightwindow) {
	    if (this.hasParent) {
		parentLeft = this.parentMenu.style.pixelLeft;
		newLeft = ((parentLeft - this.menuWidth) + this.childOverlap);
		this.style.pixelLeft = newLeft;
	    }
	    else {
		variation = rightplacement - rightwindow;
		this.style.pixelLeft -= variation;
	    }
	}

	windowbottom = (menuPosition.document.body.scrollTop + menuPosition.document.body.clientHeight) - horiscroll;
	bottomposition = this.style.pixelTop + this.fullHeight;

	if (bottomposition > windowbottom) {
	    variation = bottomposition - windowbottom;
	    this.style.pixelTop -= variation;
	}

	windowleft = menuPosition.document.body.scrollLeft;
	leftposition = this.style.pixelLeft;

	if (leftposition < windowleft) {
	    if (this.hasParent) {
		parentLeft = this.parentMenu.style.pixelLeft;
		newLeft = ((parentLeft+this.menuWidth) - this.childOverlap);
		this.style.pixelLeft = newLeft;
	    }
	    else {
		this.style.pixelLeft = 5;
	    }
	}
    }
}
//changed below

function Linkit() 
{
    if (this.linkText.indexOf("javascript:")!=-1) eval(this.linkText)
    else menuPosition.location.href = this.linkText;
}

function popDown(menuName)
{
    if (!isInitialized || !creationComplete) return;
	if(!IE4 && DOM)
	{
		currElement=document.getElementById(menuName);
	}
	else
	{
    currElement = eval(menuName);
	}
    currElement.isOn = false;
    if (!clickKill) currElement.hideTop();
}

function hideAll() 
{
    for(i=0;i<menuArray.length;i++)
	{
		if(!IE4 && DOM)
		{
			/*
			itemCCC=document.getElementsByTagName("DIV");
			for (i=0; i<itemCCC.length; i++) 
			{
				//alert("IDd<->"+itemCCC[i].id);
			}
				element=itemCCC[0];
				*/
			element=document.getElementById(menuArray[i]);
		}
		else
		{
			element=eval(menuArray[i]);
		}
		//temp = eval(menuArray[i]+".startChild");
			temp = element.startChild;
				temp.isOn = false;
				if (temp.hasChildVisible) temp.hideChildren();
				temp.showIt(false);
	}
}

function hideTree() 
{ 
    allTimer = null;
    if (isOverMenu) return;
    if (this.hasChildVisible) {
	this.hideChildren();
    }
    this.hideParents();
}

function hideTop() 
{
    topMenu = this;
    (clickKill) ? topMenu.coverself() : (this.timerToHide = setTimeout("if(topMenu.coverself)topMenu.coverself()",milliSecsVisible));
}

function coverself() 
{
    this.timerToHide = null;
    if (!this.isOn && !isOverMenu) { 
	this.showIt(false);
    }
}

function hideParents() 
{
    tempMenu = this;
    while (tempMenu.hasParent) {
	tempMenu.showIt(false);
	tempMenu.parentMenu.isOn = false;		
	tempMenu = tempMenu.parentMenu;
    }
	if(eval(tempMenu.hideTop))
    tempMenu.hideTop();
}

function hideChildren(item) 
{
    tempMenu = this.visibleChild;
    while (tempMenu.hasChildVisible) {
	tempMenu.visibleChild.showIt(false);
	tempMenu.hasChildVisible = false;
	tempMenu = tempMenu.visibleChild;
    }

    if (!this.isOn || !item.hasMore || this.visibleChild != this.child) {
	this.visibleChild.showIt(false);
	this.hasChildVisible = false;
    }
}

function selectioncancel(){return false}

function reloadPage()
{
    if (windowToLoad.innerWidth==actualWidth && windowToLoad.innerHeight==actualHeight) return;
    initialize();
    resizedWindow=true;
    menuPosition.location.reload();
}

function clicked() 
{
    if (!isOverMenu && currentMenu!=null && !currentMenu.isOn) {
	currElement = currentMenu;
	currElement.hideTree();
    }
}

window.onerror = handleErr;

function handleErr()
{
    arAccessErrors = ["permission","access"];
    //mess = arguments[0].toLowerCase();
	//N6
    mess = (new String(arguments[0])).toLowerCase();
    found = false;
    for (i=0;i<arAccessErrors.length;i++) {
	errStr = arAccessErrors[i];
	if (mess.indexOf(errStr)!=-1) found = true;
    }
    return found;
}

function terminate(inarr)
{
    var tarr=new Array()
	var i=0;
    for(p=1;p<inarr.length;p++,i++)
    {
	tarr[i]=inarr[p];
    }
    return tarr
}
function mask(inname)
{
	var outname=inname;

    var specchar = new Array(" ","`","~","!","@","#","$","%","^","&","*","(",")","-","+","=","|","\"","{","}","[","]",":",";","\\","'","<",">",".","?","/",",");
	for( i=0;i<specchar.length;i++)
	{
		while(outname.indexOf(specchar[i])>0)
		{
			outname=outname.replace(new RegExp(specchar[i]),"_")
			//	var t=/\//g;
			//outname=outname.replace(t,"_");

		}
	}
    return outname
}
function makeMenuForDOM(isChild,tempArray,parentMenu,parentItem) 
{
    if (!isChild) 
    {
	menuArray[menuArray.length]=tempArray[0];
	tempWidth = tempArray[1] ? tempArray[1] : menuWidth;
	menu = makeElement(tempArray[0],tempWidth,null,null);
    }
    else 
    {
	menu = makeElement(tempArray[0],null,parentMenu,null);
	tempArray=terminate(tempArray)
    }
    menu.array = tempArray;
    menu.buildMenu = buildMenu;
    menu.buildMenu(isChild,parentMenu);

    while (menu.itemCount < menu.maxItems) {
	menu.itemCount++;
	prevItem = (menu.itemCount > 1) ? menu.item : null;
	if(!isChild)
	    itemName = tempArray[((menu.itemCount-1)*3)+10];
	else
	    itemName=tempArray[((menu.itemCount-1)*3)]
		itemName=mask(itemName)

		menu.item = makeElement(itemName,null,null,menu);

	menu.item.prevItem = prevItem;
	menu.item.setupItem = setupItem;
	menu.item.setupItem(menu.itemCount,menu.array,menu);
	if (menu.item.hasMore) {
	    makeMenuForDOM(true,menu.item.hasMore,menu,menu.item);
	    menu = menu.parentMenu;
	}
    }

    menu.lastItem = menu.item;
    menu.menuSetup(isChild,parentMenu,parentItem);
}
