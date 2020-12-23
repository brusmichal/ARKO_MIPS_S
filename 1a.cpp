//zadanie
//Wszystkie małe litery w ciągu mają być zamienione na *
//np Ala Ma Kota -> A** M* K***
#include <iostream>
#define BUFF_SIZE 50
char buffor[BUFF_SIZE] = "Ala Ma Kota";
bool is_Small_Letter (char letter);

int main(){


for(int i=0; i<BUFF_SIZE; i++){
    if(buffor[i] == '\0')
        break;
    if(is_Small_Letter(buffor[i]))
        buffor[i] = '*';
    else
        continue;

};

std::cout << buffor;
return 0;

};
bool is_Small_Letter (char letter){
    if('a' <= letter && letter <= 'z' )
        return true;
    else
        return false;
};