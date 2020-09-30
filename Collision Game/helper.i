# 1 "helper.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "helper.c"
# 1 "helper.h" 1



typedef unsigned short u16;
# 16 "helper.h"
extern volatile unsigned short *videoBuffer;
# 45 "helper.h"
extern unsigned short oldButtons;
extern unsigned short buttons;






void setPixel(int col, int row, unsigned short color);
void drawDragon(int col, int row, int size, unsigned short color, unsigned short edge,
unsigned short tummy, unsigned short eyeEdge, unsigned short eyeColor);
void fillScreen(unsigned short color);
void drawDragonFire(int col, int row, int size, unsigned short outer,
unsigned short middle, unsigned short inner);


void waitForVBlank();


int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "helper.c" 2

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
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
    while ((*(volatile unsigned short *)0x4000006) > 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}


void drawDragon(int col, int row, int size, unsigned short color, unsigned short edge,
unsigned short tummy, unsigned short eyeEdge, unsigned short eyeColor) {
    drawSq(col, row, size, size*3, edge);
    drawSq(col + size*9, row, size, size*3, edge);

    drawSq(col, row-size*15, size*14, size*12, edge);
    drawSq(col+size, row-size*15, size*14, size*10, color);
    drawSq(col+size*4, row-size*2, size, size*4, edge);
    drawSq(col, row-size*5, size*2, size*12, color);

    drawSq(col, row-size*2, size*2, size*3, color);
    drawSq(col + size*9, row-size*2, size*2, size*3, color);
    drawSq(col-size, row-size*2, size*2, size, edge);
    drawSq(col + size*12, row-size*2, size*2, size, edge);
    drawSq(col+size*3, row-size, size, size, edge);
    drawSq(col+size*8, row-size, size, size, edge);

    drawSq(col, row-size*3, size, size, edge);
    drawSq(col + size*11, row-size*3, size, size, edge);
    drawSq(col-size, row-size*5, size*2, size, edge);
    drawSq(col + size*12, row-size*5, size*2, size, edge);


    drawSq(col-size*2, row-size*9, size*4, size*3, edge);
    drawSq(col+size*11, row-size*9, size*4, size*3, edge);
    drawSq(col-size, row-size*10, size, size, edge);
    drawSq(col+size*12, row-size*10, size, size, edge);
    drawSq(col-size*3, row-size*8, size*2, size, edge);
    drawSq(col+size*14, row-size*8, size*2, size, edge);
    drawSq(col-size*2, row-size*8, size*2, size*2, color);
    drawSq(col+size*12, row-size*8, size*2, size*2, color);
    drawSq(col-size, row-size*9, size*2, size*2, color);
    drawSq(col+size*11, row-size*9, size*2, size*2, color);


    drawSq(col+size*2, row-size*6, size*2, size*8, tummy);
    drawSq(col+size*3, row-size*4, size, size*6, tummy);
    drawSq(col+size*4, row-size*3, size, size*4, tummy);


    drawSq(col+size, row-size*9, size, size, edge);
    drawSq(col+size*10, row-size*9, size, size, edge);
    drawSq(col+size*2, row-size*8, size, size, edge);
    drawSq(col+size*9, row-size*8, size, size, edge);
    drawSq(col+size*3, row-size*7, size, size*6, edge);


    drawSq(col+size, row-size*17, size*2, size*10, edge);
    drawSq(col+size*2, row-size*17, size*2, size*8, color);
    drawSq(col+size*2, row-size*18, size, size*8, edge);
    drawSq(col+size*3, row-size*18, size, size*6, color);
    drawSq(col+size*3, row-size*19, size, size*6, edge);


    drawSq(col+size, row-size*13, size*3, size*2, edge);
    drawSq(col+size*9, row-size*13, size*3, size*2, edge);
    drawSq(col+size, row-size*11, size, size, eyeColor);
    drawSq(col+size*10, row-size*11, size, size, eyeColor);
    drawSq(col+size, row-size*13, size, size, eyeEdge);
    drawSq(col+size*10, row-size*13, size, size, eyeEdge);


    drawSq(col-size*4, row-size*13, size*4, size*3, edge);
    drawSq(col-size*2, row-size*10, size, size, color);
    drawSq(col-size*3, row-size*13, size*4, size, color);
    drawSq(col-size*3, row-size*9, size, size, edge);
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

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return (rowA + heightA - 1 > rowB && rowA < rowB + heightB - 1)
    && (colA + widthA - 1 > colB && colA < colB + widthB - 1);

}
