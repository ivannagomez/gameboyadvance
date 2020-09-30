#include "myLib.h"

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    
    for(int i=0; i < width; i++) {    
        setPixel(col + i, row, color); 
    }
    for(int i=0; i < width; i++) {    
        setPixel(col + i, row + height, color); 
    }
    for(int i=0; i < height; i++) {    
        setPixel(col, row + i, color);  
    }
    for(int i=0; i < height; i++) {    
        setPixel(col + width, row + i, color);  
    }
 
    return 0;  // good etiquette

}

void fillScreen(unsigned short color) {
    // TODO #2: implement this function
    // note: you may only use a single loop
    int col = 0;
    int row = 0;
    while (row < 160) {
        if (col < 240) {
            setPixel(col, row, color);
            col++;
        } else if (col == 240) {
            setPixel(col, row, color);
            col = 0;
            row++;
        }
    }
}

void waitForVBlank() {
    while (SCANLINECOUNTER > 160);
    while (SCANLINECOUNTER < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    // TODO #5.0: Implement this function
    return (rowA + heightA - 1 > rowB && rowA < rowB + heightB - 1) 
    && (colA + widthA - 1 > colB && colA < colB + widthB - 1);

}