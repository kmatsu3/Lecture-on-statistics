int MAX = 50;
int RANGE = 200;// RANGE=SIZE/2
int BINSIZE = 2;
int BINS = RANGE/BINSIZE;
int[] x = new int[MAX];
int[] dx = new int[MAX];
int[] h = new int[2*BINS];
int[] ph = new int[2*BINS];
float hight_bar = 2.0;
int hmax=0;
int i;
int bin;
int t = 0;
void setup()
{
 for(i=0;i<=MAX-1;i+=1)
 {
 x[i] = (int)RANGE;
 }
 size(400, 400);
 noStroke();
 // frameRate(30);
 smooth();
}  


void draw() 
 {   
   background(0);
   t += 1;
   
 for(bin=0;bin<=2*BINS-1;bin+=1)  
  {
   h[bin]=0;
 };       
 for(i=0;i<=MAX-1;i++)  
  {
    x[i] = x[i]%(2*RANGE);
   dx[i] += (int)(random(-2, 2));
   if(ph[(int)(((x[i]+dx[i])+2*RANGE)%(2*RANGE)/BINSIZE)]==0)
     {x[i]+=dx[i];};
   fill(i%254,255,0); 
   ellipse(x[i]%(2*RANGE),100,BINSIZE*3,BINSIZE*3);
   bin = (int)(((x[i]+2*RANGE)%(2*RANGE))/BINSIZE);
   h[bin]++;
 };    
 hmax=0;
 for(bin=0;bin<=2*BINS-1;bin++)  
  {
    if(hmax<h[bin])
    {
      hmax=h[bin];
    };
 }; 
 for(bin=0;bin<=2*BINS-1;bin++)  
  {
   rect(
         ((float)bin-0.5)*(float)(BINSIZE),
         (float)RANGE*(2.0-(float)h[bin]/(float)hmax),
         (float)BINSIZE,
         (float)RANGE*(float)(1.0+h[bin]/(float)hmax)  
        );
        ph[bin]=h[bin];
   };        
 };