
run("Set Measurements...", "area mean min length integrated redirect=None decimal=3");
// define line drawing function
//Set parameters
 usergrid=20000;
 usermarker=10;

 //get image parameters
 imagex=getWidth/2;
 imagey=getHeight/2;

 var Cellx=-1
 var Celly=-1
 var Cellz=-1
 var nucx1=-1
 var nucx2=-1
 var nucy1=-1
 var nucy2=-1
 var isectx
 var isecty
 
function getcell(){
//get cell
 Userwait=0;
 leftButton=16;
 while (Userwait==0) {
 getCursorLoc(x,y,z,flags);
 makeOval(x-usermarker/2,y-usermarker/2,usermarker,usermarker);
 if (flags&leftButton!=0) {
 Userwait=1;
 Cellx=x;
 Celly=y;
 Cellz=z;
 }
 wait(10);
 }

 // overlay marker and nucleator lines
 Overlay.remove;
 setColor("yellow");
 Overlay.drawEllipse(Cellx-usermarker/2,Celly-usermarker/2,usermarker,usermarker);
 //generate random angle
 nucang1=random*3.141592/2;
 nucx1=imagex*2;
 nucy1=tan(nucang1)*nucx1;
 nucang2=nucang1+3.141592/4+random*3.141592/2;
 nucx2=imagex*2;
 nucy2=tan(nucang2)*nucx2;
 Overlay.drawLine(Cellx+nucx1,Celly-nucy1,Cellx-nucx1,Celly+nucy1);
 Overlay.drawLine(Cellx+nucx2,Celly-nucy2,Cellx-nucx2,Celly+nucy2);
 Overlay.add
 Overlay.show;
 slope1=nucy1/nucx1;
 slope2=nucy2/nucx2;
 wait(250);
}
 // get intersections of boundary with nucleator
 //define nucleator function
 function nucleator(cellx,celly,cellz,x1,y1) {
 currang=atan(y1/x1)*57.3;
 currslope=y1/x1;
 linex=getWidth;
 liney=getHeight;
 setColor("green");
 Overlay.drawLine(cellx,celly,cellx+x1,celly-y1);
 Overlay.show;
 //indicate current nuclleator ray
 Userwait=0;
 leftButton=16;
 //update current cursor position
 while (Userwait==0) {
 getCursorLoc(x,y,z,flags);
 //check for mouse click
 if (flags&leftButton!=0) {
 Userwait=1;
 tempx=x;
 tempy=y;
 }
 //display marker line dependent on nucleator ray angle
 if (currang<45&&currang>-45||currang>135){
makeLine(x,liney*-2,x,liney*2);
wait(10);
}
else {
makeLine(linex*-2,y,linex*2,y);
wait(10);
 }
}
 //identify intersection of nucleator ray with click position
 if (currang<45&&currang>-45||currang>135){
isectx=tempx;
isecty=(tempx-cellx)*currslope*-1+celly;
}
else {
isecty=tempy;
isectx=(tempy-celly)/currslope*-1+cellx;
}
//mark intersection and clear marked ray
Overlay.drawEllipse(isectx-8/2,isecty-8/2,8,8);
Overlay.add
setColor("red");
Overlay.drawLine(cellx,celly,cellx+x1,celly-y1);
Overlay.show;
//print(getInfo("image.filename")+" : "+cellx+","+celly+","+cellz+","+isectx+","+isecty+"\r\n");
}

//nucleator ray1a
function cellquantround(label){
//run("Grid ", "grid=Lines area="+usergrid+" color=Cyan"); //grid requires the plugin - available in original imagej, not built in to FIJI?
setFont("SansSerif",20);
setColor("White");
Overlay.drawString("Please Select "+label, 20, 20);
wait(250);
getcell();
nucleator(Cellx,Celly,Cellz,nucx1,nucy1);
line1x1=isectx;
line1y1=isecty;
wait(250);
nucleator(Cellx,Celly,Cellz,-1*nucx1,-1*nucy1);
line1x2=isectx;
line1y2=isecty;
wait(250);
nucleator(Cellx,Celly,Cellz,nucx2,nucy2);
line2x1=isectx;
line2y1=isecty;
wait(250);
nucleator(Cellx,Celly,Cellz,-1*nucx2,-1*nucy2);
line2x2=isectx;
line2y2=isecty;
//
Stack.getDimensions(w,h,c,s,f)
makeLine(line1x1,line1y1,line1x2,line1y2);
for (i=1; i<=c; i++) {
	Stack.setChannel(i);
	run("Measure");
	print(getInfo("image.filename")+" : "+label+" : "+Cellx+","+Celly+","+getResult("Length")+","+getResult("Area")+","+getResult("Mean")+","+getResult("IntDen")+","+nResults+","+i);
	}
makeLine(line2x1,line2y1,line2x2,line2y2);
for (i=1; i<=c; i++) {
	Stack.setChannel(i);
	run("Measure");
	print(getInfo("image.filename")+" : "+label+" : "+Cellx+","+Celly+","+getResult("Length")+","+getResult("Area")+","+getResult("Mean")+","+getResult("IntDen")+","+nResults+","+i);
	}
}

// select 4 empty regions
print("imagename : sample : x,y,length,area,mean,intden,measurementNo,channel");
cellquantround("Blank1");
wait(250);
cellquantround("Blank2");
wait(250);
cellquantround("Blank3");
wait(250);
// select any NeuN positive cells identified on the grid
cellquantround("Cell1");
cellquantround("Cell2");
cellquantround("Cell3");
cellquantround("Cell4");
cellquantround("Cell5");
cellquantround("Cell6");
cellquantround("Cell7");
cellquantround("Cell8");
cellquantround("Cell9");
cellquantround("Cell10");
cellquantround("Cell11");
cellquantround("Cell12");
cellquantround("Cell13");
cellquantround("Cell14");
cellquantround("Cell15");
cellquantround("Cell16");
cellquantround("Cell17");
cellquantround("Cell18");
cellquantround("Cell19");
cellquantround("Cell20");
