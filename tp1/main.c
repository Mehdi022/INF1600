#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>


int getUserNumber() {
   int data;
   printf("\n Veuillez saisir un nombre : ");
   scanf("%d", &data);
   return data;
}

int getLenght(int data){
   int len = 1;
   while (data != 0) {
      data = data >> 1;
      len += 1;
   }
   return len;
}

int main(int argc, char** argv) {
   // initialiser les variables
   int data, dataTemp, len, lenTemp = 1;
   int res = 0;

   printf("\n Ce programme est la traduction à la lettre du code assembleur en C en prenant compte que l'assembleur est en complement de 2"
         "\n le code fait cela aussi en complement de 2 \n");
   data = getUserNumber();
   // deepcopy de data et dataTemp
   dataTemp = data;

   // get_length de assembleur: On cherche la longueur de la représentation binaire de data.
   len = getLenght(dataTemp);
   printf("\n lenght : %d \n", len);

   // deepcopy de len et lenTemp
   lenTemp = len;

   // Shift_L de assembleur: On fait en boucle un décalage de data_tmp vers la gauche et on diminue 1 a len jusqu'à len = 0
   while(len-1!=0){
      len--;
      dataTemp=dataTemp << 1;
   }

   // Shift_r de assembleur: On fait en boucle un décalage de data_tmp vers la droite et on diminue 1 a lenTemp jusqu'à lenTemp = 0
   while(lenTemp-1 != 0) {
      lenTemp--;
      dataTemp=dataTemp >> 1;
   }

   // verifie si dataTemp -1 == 0 si oui on fait la partie alt de l'assembleur sinon on fait la partie fin
   if(dataTemp -1 == 0){
      res = 1;
   }

   printf("\n Valeurs des variables aux adresses mémoires \n");
   printf(" data = %d.\n", data);
   printf(" dataTemp = %d.\n", dataTemp);
   printf(" len = %d.\n", len);
   printf(" lenTemp = %d.\n", lenTemp);
   printf(" res = %d.\n", res);

   return 0;
}

