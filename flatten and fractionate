 offsetx=0.13;//a number from 0 to 1
 offsety=0.88;//a number from 0 to 1
setForegroundColor(255, 255, 255);
run("Draw", "stack"); 
run("Z Project...", "projection=[Max Intensity]");

//Optical Disector Grid.ijm
//simple imageJ implimentation of an optical disector grid for stereological counting
//code written by Christopher S Ward - 2013 for use in ImageJ/FIJI (Wayne Rasband)
//the code is distributed free of use, acknowledgements/citations appreciated if you use/modify the code
//grid is created that subdivides an image into set number of pieces (sampefract)
//counting boxes are then placed within these pieces and are themselves a subfraction of the region (boxfract)
//cell counts can then be scaled up by a factor of (samplefract*boxfract)

//**this should be compatable with "Cell Counter" plug-in**

// user defined parameters

 samplefract=10;
 boxfract=10
// get image parameters
 imagex=getWidth;
 imagey=getHeight;
 imagearea=imagex*imagey;
 areafrac=imagearea/samplefract;
 usergrid=sqrt(areafrac);
 userbox=sqrt(usergrid*usergrid/boxfract);
 startx=usergrid*offsetx;
 starty=usergrid*offsety;

 print(imagex,imagey,imagearea,usergrid*usergrid,userbox*userbox);
//overlay grid
 Overlay.remove;

for (i=-1; i<samplefract+2; i++)
{
	curx=startx+i*usergrid;
	for (j=-1; j<samplefract+2; j++)
	{
		cury=starty+j*usergrid;
 setColor("red");
 Overlay.drawLine(curx,cury+userbox,curx+userbox,cury+userbox);
 Overlay.drawLine(curx,cury-userbox,curx,cury+userbox);
 Overlay.drawLine(curx+userbox,cury+userbox,curx+userbox,cury+2*userbox);
 Overlay.add;
 setColor("green");
 Overlay.drawLine(curx,cury,curx+userbox,cury);
 Overlay.drawLine(curx+userbox,cury+userbox,curx+userbox,cury);
 Overlay.add;
}
}
Overlay.show;
