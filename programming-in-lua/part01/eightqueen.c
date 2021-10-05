#include <stdio.h>

#define N 8

int isplaceok(int *a, int n, int c) {
  for (int i = 0; i < n; i++) {
    if ((a[i] == c) || (a[i] + (n - i) == c) || ((a[i]) - (n - i)) == c) {
      return 0;
    }
  }
  return 1;
}

void printqueen(int *a) {
  for (int i = 0; i < N; i++) {
    printf("%d",a[i]);
  }
  printf("%c",'\n');

}

void addqueue(int *a, int n) {
  if (n >= N) {
    printqueen(a);
  } else {
    for (int i = 0; i < N; i++) {
      if (isplaceok(a, n, i)) {
        a[n] = i;
        addqueue(a, n + 1);
      }
    }
  }
}

int main(int argc, char *argv[]) {

  int a[N];

  addqueue(a, 0);

  return 0;
}
