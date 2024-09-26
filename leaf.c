#include <stdio.h>

__declspec(dllexport)
void leaf(void)
{
  printf("leaf\n");
}
