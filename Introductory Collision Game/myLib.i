# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 39 "myLib.h"
void setPixel(int col, int row, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 65 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 78 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "myLib.c" 2

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
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

    return 0;

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
    while ((*(volatile unsigned short *)0x4000006) > 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {

    return (rowA + heightA - 1 > rowB && rowA < rowB + heightB - 1)
    && (colA + widthA - 1 > colB && colA < colB + widthB - 1);

}
