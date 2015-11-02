#include <stdio.h>
#include <time.h>

int max_depth = 13;
int depth_overs = 0;

int ackermann(int x, int y, int depth)
{
  if(depth == max_depth){
    depth = 0;
    depth_overs++;
  }

  if (x == 0) {
    return y+1;
  } else if (y == 0) {
    return ackermann(x-1, 1, depth + 1);
  } else {
    return ackermann(x-1, ackermann(x, y-1, depth + 1), depth + 1);
  }
}


int main(){
  float time1 = 0; 
  float time2 = 0;
  time1 = clock();

  int acker = ackermann(3, 6, 0);

  time2 = clock();
  printf("Time elapsed = %f seconds. \n", (time2 -  time1) / (float) CLOCKS_PER_SEC);
  printf("Depth overflowed %d times.\n", depth_overs);
  return acker;
}
