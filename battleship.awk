#! /usr/bin/awk -f
BEGIN{
  FS="-"
  bullets=10
  for(i=1;i<81;i++){
    target[i]=" "
  }
  for(i=1;i<=25;i++){
    opp[i]=" "
  }
  print "1 startgame \n 2 help \n 3 quit \n Enter Your choice : "
  getline choice
  if(choice==1){
    print "game started"
    print "Enter Dificulty from 1 to 8"
    getline level
    bullets=10-level+1
    print "Hey captain iam Lt.Colonel Sam The radar shows the enemy ships are 3 km apart,but due to multiple strikes the radar is not working properly"
    print "Our mission is to put their ships to the bottom of the sea"
    print "It will take around 3 successfull strikes to put the ship down"
    print "They are constantly firing on us but our ship can withstand for a long time"
    #print "The spy reported there are 4 boats of size 3,2,2,1 spread across following area"
    printarea();
    arrangebotships();
    print "Captain,We have only "bullets" Missiles left.. The life of the crew depends on you.  the crew is waiting for your command lets burn it down, Where do we have to strike"
    # print "how to allign Mother ship"

  }
  else if(choice==2){
    print "\n\n---------------------help-------------------------\n\n"
  print "Officer, \n From today onwards you are a captain of a ship....\n It is you duty to save the crew from all the attacks that can happen in the deep ocean"
  print "It is pretty tough to manage a ship alone so we are also appointing a Lt. Colonel for your assistance"
  print "The blue print of the certain area can is represented as"
  printarea();
  print "to select a particular area in the grid you have to say by \"B-2\" Any mistakes in this will result in a loss of Missile..."
  print "So be carefull cadet ......and BEST OF LUCK!!!!!!!!!!!"
}else if(choice==3){
print "bye"
  }
  else{
    print "invalid entry"
}
}

{
  bullets--
  left=getascii($1)
  right=$2
  ind=(int(left)-1)*5+int(right)
  if(opp[ind]!=" "){
    print "Hurray captain its a Hit!!!!!!!!"
    target[ind]="X"
    opp[ind]=" "
  }else{
  print "Ohhhh That was a miss captain"
  target[ind]="O"

}
oppalive=0
for(i=1;i<=25;i++){
  if(opp[i]!=" "){
    oppalive=1;
  }
}
printarea();
if(oppalive==1&&bullets>0){
  print "Captain we have "bullets" Missiles left waiting for your next command";
}else if(oppalive==0){
print "Hurray we won the war....";
exit
}else{
print "Captain, No more Missiles left Everyone is going to die"
for(k=0;k<10;k++)
  print "-----------------------------------------------------------"
  exit
}
}

function arrangebotships(){
  srand();
  ship1=int(rand()*17)+1
  if(ship1%5<4&&ship1%5!=0){
    opp[ship1]="M"
    opp[ship1+1]="M"
    opp[ship1+2]="M"
  }else if(ship1<16){
  opp[ship1]="M"
  opp[ship1+5]="M"
  opp[ship1+10]="M"
}else{
print "Yeah Enemys Fled away....!!!!!"
 }
}
function getascii(var){
  if(var=="A"){
    return 1
  }else if(var=="B"){
  return 2
}else if(var=="C"){
return 3
  }else if(var=="D"){
  return 4
}else if(var=="E"){
return 5
  }
}


#printing attack area
function printarea(){

  print "  1 2 3 4 5 "
  print "____________"
  printf "A"
  for(i=1;i<6;i++){
    printf "|"
    printf target[i]
  }
  print "|"
  print "____________"

  printf "B"
  for(i=6;i<11;i++){
    printf "|"
    printf target[i]
  }
  print "|"
  print "____________"

  printf "C"
  for(i=11;i<16;i++){
    printf "|"
    printf target[i]
  }
  print "|"
  print "____________"

  printf "D"
  for(i=16;i<21;i++){
    printf "|"
    printf target[i]
  }
  print "|"
  print "____________"

  printf "E"
  for(i=21;i<26;i++){
    printf "|"
    printf target[i]
  }
  print "|"
}
