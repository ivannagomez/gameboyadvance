#include "helper.h"

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, WIDTH)] = color;
}

void drawSq(int col, int row, int height, int width, unsigned short color) {
    for(int i=0; i < width; i++){
        for(int j=0; j < height; j++){
            setPixel(col + i, row + j, color);
        }
    }
}

void fillScreen(unsigned short color) {
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

void drawDragon(int col, int row, int size, unsigned short color) {
    drawSq(col, row, size, size*3, BLACK);
    drawSq(col + size*9, row, size, size*3, BLACK);

    drawSq(col, row-size*15, size*14, size*12, BLACK); //body black
    drawSq(col+size, row-size*15, size*14, size*10, color); //body green
    drawSq(col+size*4, row-size*2, size, size*4, BLACK); //low middle long
    drawSq(col, row-size*5, size*2, size*12, color); 

    drawSq(col, row-size*2, size*2, size*3, color);
    drawSq(col + size*9, row-size*2, size*2, size*3, color);
    drawSq(col-size, row-size*2, size*2, size, BLACK);
    drawSq(col + size*12, row-size*2, size*2, size, BLACK);
    drawSq(col+size*3, row-size, size, size, BLACK);
    drawSq(col+size*8, row-size, size, size, BLACK);

    drawSq(col, row-size*3, size, size, BLACK);
    drawSq(col + size*11, row-size*3, size, size, BLACK);
    drawSq(col-size, row-size*5, size*2, size, BLACK);
    drawSq(col + size*12, row-size*5, size*2, size, BLACK);

    //arms
    drawSq(col-size*2, row-size*9, size*4, size*3, BLACK); //top arm
    drawSq(col+size*11, row-size*9, size*4, size*3, BLACK); 
    drawSq(col-size, row-size*10, size, size, BLACK);
    drawSq(col+size*12, row-size*10, size, size, BLACK);
    drawSq(col-size*3, row-size*8, size*2, size, BLACK);
    drawSq(col+size*14, row-size*8, size*2, size, BLACK);
    drawSq(col-size*2, row-size*8, size*2, size*2, color);
    drawSq(col+size*12, row-size*8, size*2, size*2, color);
    drawSq(col-size, row-size*9, size*2, size*2, color);
    drawSq(col+size*11, row-size*9, size*2, size*2, color);

    //tummy
    drawSq(col+size*2, row-size*6, size*2, size*8, YELLOW);
    drawSq(col+size*3, row-size*4, size, size*6, YELLOW);
    drawSq(col+size*4, row-size*3, size, size*4, YELLOW);

    //face - jaw
    drawSq(col+size, row-size*9, size, size, BLACK);
    drawSq(col+size*10, row-size*9, size, size, BLACK);
    drawSq(col+size*2, row-size*8, size, size, BLACK);
    drawSq(col+size*9, row-size*8, size, size, BLACK);
    drawSq(col+size*3, row-size*7, size, size*6, BLACK);

    //forehead
    drawSq(col+size, row-size*17, size*2, size*10, BLACK);
    drawSq(col+size*2, row-size*17, size*2, size*8, color);
    drawSq(col+size*2, row-size*18, size, size*8, BLACK);
    drawSq(col+size*3, row-size*18, size, size*6, color);
    drawSq(col+size*3, row-size*19, size, size*6, BLACK);

    //eyes
    drawSq(col+size, row-size*13, size*3, size*2, BLACK);
    drawSq(col+size*9, row-size*13, size*3, size*2, BLACK);
    drawSq(col+size, row-size*11, size, size, BLUE);
    drawSq(col+size*10, row-size*11, size, size, BLUE);
    drawSq(col+size, row-size*13, size, size, WHITE);
    drawSq(col+size*10, row-size*13, size, size, WHITE);

    //tail
    drawSq(col-size*4, row-size*13, size*4, size*3, BLACK);
    drawSq(col-size*2, row-size*10, size, size, color);
    drawSq(col-size*3, row-size*13, size*4, size, color);
}

void drawDragonFire(int col, int row, int size, unsigned short outer, 
unsigned short middle, unsigned short inner) {
    drawSq(col-size*4, row-size*18, size*5, size*3, outer);
    drawSq(col-size*5, row-size*17, size*3, size*5, outer);
    drawSq(col-size*3, row-size*19, size, size, outer);
    drawSq(col-size*4, row-size*15, size*2, size*3, middle);
    drawSq(col-size*3, row-size*16, size, size, middle);
    drawSq(col-size*3, row-size*15, size*2, size, inner);
}