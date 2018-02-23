private double fractionLength = .8;
private int smallestBranch = 10;
private double branchAngle = .2;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0); 
  strokeWeight(.1);
  stroke(255,54,71);
	line(320,480,320,380);   
	drawBranches(320,380,250,3*Math.PI/2);  
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength*fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1)+x);
  int endY1 = (int)(branchLength*Math.sin(angle1)+y);
  int endX2 = (int)(branchLength*Math.cos(angle2)+x);
  int endY2 = (int)(branchLength*Math.sin(angle2)+y);
  int endX3 = (int)x;
  int endY3 = (int)y;
  int endX4 = (int)(branchLength*Math.cos(angle)+x);
  int endY4 = (int)(branchLength*Math.sin(angle)+y);
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  line(x,y,endX3,endY3);
  line(x,y,endX4,endY4);
  if (branchLength > smallestBranch)
  {
    angle1+=PI/5;
    angle2-=PI/5;
    drawBranches(endX1,endY1,branchLength-20,angle1);
    drawBranches(endX2,endY2,branchLength-20,angle2);
    drawBranches(endX3,endY3,branchLength-20,angle);
    drawBranches(endX4,endY4,branchLength-20,angle);
  }
} 