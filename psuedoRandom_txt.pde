//A sketch saves 1,000,000 psuedorandom digits to a .txt file
//after RAND's 'A million Random digits and 100,000 normal deviates
//each string of random numbers consists of 5 digits each
//timer keeps track of time passed 

//crys moore 12.2013

PrintWriter output;
PFont f;

int counter=0;

int savedMillis;
int totalSecs = 1000; 
int seconds; 
int minute;
int hour;
int million = 1000000;
int thousand = 1000; //for testing
String timeElapsed; 


void setup()
{
  size(400, 150);
  output = createWriter("digits.txt"); 
  f = createFont ("Times-Roman", 24);
  textFont (f);
  savedMillis = millis();
}


void draw()
{
  background(255);
  fill(0);
  writeNum();
  keepTime();
  text("A Million Psuedorandom Digits", width/2, height/3);
  textAlign(CENTER);
  text(counter, width/2, height/3 *2);
  text(timeElapsed, width/2, height/3*3-10);


  //keep track of how many random numbers are generated
  //if you've created a million log the time and close the .txt file
  counter = counter + 1;
  if (counter >= thousand)
  {
    counter = 0;
    output.println ( "TOTAL TIME:" + " " + timeElapsed);
    output.flush();  // Writes the remaining data to the file
    output.close();  // Finishes the file
    exit();  // Stops the program
  }
}


void writeNum()
{

  //ugly conversions: float -> int (removes decimals) -> string for printing ints on 1 line
  float r1 = random(0, 9);
  int d1 = round(r1);
  float r2 = round(random(0, 9));
  int d2 = round(r2);
  float r3 = round(random(0, 9));
  int d3 = round(r3);
  float r4 = round(random(0, 9));
  int d4 = round(r4);
  float r5 = round(random(0, 9));
  int d5 = round(r5);
  String d1Str = str(d1);
  String d2Str = str(d2);
  String d3Str = str(d3);
  String d4Str = str(d4);
  String d5Str = str(d5);

  String digits = d1Str+ d2Str + d3Str + d4Str + d5Str;
  output.println(digits);
}

void keepTime()
{

  int passedTime = millis() - savedMillis;

  //keep track of seconds passed
  if (passedTime > totalSecs)
  {
    savedMillis = millis();
    seconds = seconds + 1;
  }
  //keep track of minutes passed
  if (seconds >= 60)
  {
    minute = minute +1;
    seconds = 0;
  }

  if (minute >= 60)
  {
    hour = hour + 1;
    minute = 0;
  }
  
  timeElapsed = hour + ":" + minute + ":" + seconds;
}

void keyPressed()
{
  if ( key == 's')
  {
    //println ( hour + " " + "hours" + " " + minute + " " + "minutes" + " "+ seconds + " " + "seconds" + " " + counter + " " + "random numbers generated");
    println(timeElapsed);
  }
}

