#include <iostream>
//Pierwszy i drugi znak ciągu znakowego są znacznikami (początkowym i końcowym) definiującymi podciąg
//tego ciągu. Zadanie polega na zamianie wszystkich znaków przed pierwszym wystąpieniem znacznika
//początkowego i po pierwszym wystąpieniu znacznika końcowego na znak *. Jeśli w ciągu (od czwartego
//znaku) nie występuje znacznik początkowy lub końcowy to nie należy dokonywać zmian. Pierwsze trzy znaki
//ciągu wejściowego należy zamienić na spacje.
//Input string > oh:wind on the hill
//Conversion results> *****on th******

#define BUFF_SIZE 50
char buffor[BUFF_SIZE] = "oh:wind on the hill, oh wind on the hill";

int main(){
    char begin = buffor[0];
    char end = buffor[1];
    int pos_begin =0, pos_end=0;

    for(int i=3; i<BUFF_SIZE; i++){ //pętla szukajaca znacznikow w petli
        
       if(buffor[i] == '\0' || (pos_begin != 0 && pos_end != 0)) //koniec stringa
            break;
       if(pos_begin == 0){ 
        if(buffor[i] == begin){
            pos_begin = i;
            continue;
        };
       };
       if(pos_end == 0){ 
        if(buffor[i] == end){
            pos_end = i;
            continue;
        };
       };
    };

    if(!(pos_begin == 0 || pos_end == 0)){ //petla nie uruchomi sie jesli nie ma jednego ze znacznikow
        for(int i=0; i<BUFF_SIZE; i++){  //petla zmieniajaca znaki na ***    
            if(buffor[i] == '\0') //koniec stringa
                break;
            if(i<pos_begin)
                buffor[i] = '*';
            if(i>pos_end)
                buffor[i] = '*';
        };
    };
    for(int i=0; i<3; i++)
        buffor[i] = ' ';
    
    std::cout << buffor;
    return 0;


}




