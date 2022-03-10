var MsNavigator = Boolean(navigator.appName == "Microsoft Internet Explorer");


function  ShowTextInBrouser(numform)
{
   var newWin = window.open();
   newWin.document.write(document.forms[numform-1].elements[0].value);
}
