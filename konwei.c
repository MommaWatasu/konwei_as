#include<stdio.h>
#include<stdint.h>
int main(void)
{
  uint_fast64_t a;
  uint_fast64_t t;
  uint_fast64_t f;
  uint_fast64_t k;
  uint_fast64_t L = 0;
  uint_fast64_t i;
  uint_fast64_t n = 10;
  uint_fast64_t j = 0;
  uint_fast64_t ans = 1;
  uint_fast64_t ft = 1;
  uint_fast64_t c_ex[n];
  uint_fast64_t ex_p[] = {1,2,3,4,5,6,7,8,9,10};
  uint_fast64_t indices[] = {1,2,3,4,5,6,7,8,9,10};
  uint_fast64_t cycles[] = {10,9,8,7,6,5,4,3,2,1};

  for (i=2;i<=n;i++){
    ans *= i;
  };
  while(ft<ans){
    i = n-1;
    while(1){
      if (i < 0){
        i = n-1;
      };
      cycles[i]--;
      if (cycles[i]==0){
        j = indices[i];
        for (k=i;k<n-1;k++){
          indices[k] = indices[k+1];
        };
        indices[n-1] = j;
        cycles[i] = n-i;
        i--;
      }else{
        j = cycles[i];
        k = indices[i];
        indices[i] = indices[n-j];
        indices[n-j] = k;
        break;
      };
    };
    for (k=0;k<=n;k++){
      ex_p[k] = indices[k];
    };
    f = 0;
    while (1){
      if (ex_p[0]==1){
        break;
      };
      a = ex_p[0];
      for (j=0;j<a/2;j++){
        t = ex_p[j];
        ex_p[j] = ex_p[a-j-1];
        ex_p[a-j-1] = t;
      };
      f++;
    };
    if (f>L){
      L = f;
    };
    ft++;
  };
  printf("%d\n",L);
  return 0;
};
