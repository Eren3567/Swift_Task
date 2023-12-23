//
//  main.cpp
//  Hesap
//
//  Created by Eren Çetintaş on 9.12.2023.
//

#include <iostream>
#include <string>
#include <vector>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
using namespace std;




class  Banka{
    
protected:
    
    string Müsteri,Hesap;
    int Bakiye;
public:
    
    string getmüsteri(){
        
        return Müsteri;
    }
    string gethesap(){
        
        return Hesap;
    }
    
    int getbakiye(){
        
        return Bakiye;
    }
    
   
    void setmüsteri(string deger){
        
        this->Müsteri=deger;
    }
    
    void sethesap(string deger){
        
        this->Hesap=deger;
    }
    void setbakiye(int deger){
        
        this->Bakiye=deger;
    }
  
    
    Banka(string Müsteri,string Hesap,int Bakiye){
       
        this->Müsteri= Müsteri;
        this->Hesap= Hesap;
        this->Bakiye= Bakiye;
        
    }
    
    
    void kim(){
        std::cout << "isminiz nedir" << std::endl;
        std::cin >> Müsteri;
    }
    
void hesapla(){
    
    
    int Tutar;
   cout  <<  Müsteri <<" Bey Çekmek istediğiniz tutarı girin"<< std::endl;
    
std::cin >> Tutar;

        if( Bakiye>0)
        {   Bakiye-=Tutar;
            
            std::cout << "Günccel Tutarınız: "<<Bakiye<<"dır" << std::endl;
            
        }
        
 
    }
   
};

// Dictionary için bir struct yapısı tanımlayalım.
typedef struct {
    char key[50];
    int value;
} DictItem;

// Dictionary olarak kullanacağımız dizi ve bir sayaç tanımlayalım.
DictItem dictionary[100];
int dictSize = 0;

// Create işlemi için bir fonksiyon tanımlayalım.
void create(char key[], int value) {
    strcpy(dictionary[dictSize].key, key);
    dictionary[dictSize].value = value;
    dictSize++;
}
// Read işlemi için bir fonksiyon tanımlayalım.
void read(char key[]) {
    for (int i = 0; i < dictSize; i++) {
        if (strcmp(dictionary[i].key, key) == 0) {
            printf("%s: %d\n", key, dictionary[i].value);
            return;
        }
    }
    printf("%s not found.\n", key);
}
// Update işlemi için bir fonksiyon tanımlayalım.
void update(char key[], int newValue) {
    for (int i = 0; i < dictSize; i++) {
        if (strcmp(dictionary[i].key, key) == 0) {
            dictionary[i].value = newValue;
            return;
        }
    }
    printf("%s not found for update.\n", key);
}
void deleteFunction(char key[]) {
    for (int i = 0; i < dictSize; i++) {
        if (strcmp(dictionary[i].key, key) == 0) {
            for (int j = i; j < dictSize - 1; j++) {
                dictionary[j] = dictionary[j + 1];
            }
            dictSize--;
            return;
        }
    }
    printf("%s not found for deletion.\n", key);
}
// Dictionary'i yazdırmak için bir fonksiyon tanımlayalım.
void printDictionary() {
    printf("Database:\n");
    for (int i = 0; i < dictSize; i++) {
        printf("  %s: %d\n", dictionary[i].key, dictionary[i].value);
    }
}
// Dictionary'i bir dosyaya yazmak için bir fonksiyon tanımlayalım.
void saveDictionaryToFile() {
    FILE *file = fopen("/Users/erencetintas/Desktop/database.txt", "w"); // Masaüstü yolu işletim sistemine göre değişebilir.
    if (file == NULL) {
        printf("Error opening file!\n");
        exit(1);
    }

    for (int i = 0; i < dictSize; i++) {
        fprintf(file, "%s: %d\n", dictionary[i].key, dictionary[i].value);
    }

    fclose(file);
    printf("Database saved to desktop/database.txt\n");
}


int main(){
    
    int choice, value;
    char key[50];
    
    FILE *file = fopen("/Users/erencetintas/Desktop/database.txt", "r");
if (file == NULL) {
    file = fopen("/Users/erencetintas/Desktop/database.txt", "w");
    if (file == NULL) {
        perror("Error creating file");
        exit(1);
    }
}
fclose(file); // Yalnızca varlığını kontrol etmek için açtık, artık kapatabiliriz.
do {
printf("\nSelect an operation (1: Create, 2: Read, 3: Update, 4: Delete, 0: Exit): ");
scanf("%d", &choice);
getchar(); // Enter tuşunu yakalamak için.

switch(choice) {
    case 1:
        printf("Enter key and new value to update (e.g., Apple 2): ");
        scanf("%49s %d", key, &value); // Buffer overflow önlemek için limit.
        create(key, value);
        break;
    case 2:
        printf("Enter key to read (e.g., Apple): ");
        scanf("%49s", key); // Buffer overflow önlemek için limit.
        read(key);
        break;
        
    case 3:
        printf("Enter key and new value to update (e.g., Apple 3): ");
        scanf("%49s %d", key, &value); // Buffer overflow önlemek için limit.
        update(key, value);
        break;
    case 4:
        printf("Enter key to delete (e.g., Apple): ");
        scanf("%49s", key); // Buffer overflow önlemek için limit.
        deleteFunction(key);
        break;
    case 0:
        saveDictionaryToFile();
        printf("Exiting...\n");
        break;
    default:
        printf("Invalid choice!\n");
}
printDictionary();
} while (choice != 0);


Banka müsteri1 = Banka("Ahmet","Hesap1",300);
Banka müsteri2 = Banka("Engın","Hesap1",300);
Banka müsteri3 = Banka("Ben","Hesap1",300);
müsteri1.kim();
müsteri1.hesapla();
müsteri2.kim();
müsteri2.hesapla();
müsteri3.kim();
müsteri3.hesapla();



    return 0;
}



