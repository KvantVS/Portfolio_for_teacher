var numtask = 20;
var error = 0;
var yes = "�����";
var no  = "���� ������";
task = new Array(numtask);
var answer;
function Ini()
{ error = 0;
  for(var i=0; i<numtask; i++) task[i] = false;
}
function Check(ntask)
{
  task[ntask-1] = true;
  if (answer == no) error++;
}
function  Bonus()
{
    var result = "";
   var ntask = 0;
   for(var i=0; i<numtask; i++)
     if (task[i]) ntask++;
     else result += eval(i+1) + ", ";
   if (ntask == numtask)
   {
     if (error <= 1)       bonus = 5;
     else if (error <= 5)  bonus = 4;
     else if (error <= 9)  bonus = 3;
     else                  bonus = 2;
     alert("���� ������: "+bonus+"\n"+
           "����� ������: "+ error);
   }
  else if (ntask < numtask)
     alert("�� ������:\n" + result);
}