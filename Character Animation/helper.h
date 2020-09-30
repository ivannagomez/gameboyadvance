#ifndef MY_LIB_H
#define MY_LIB_H

typedef unsigned short u16;
#define OFFSET(col,row,rowlen) ((row)*(rowlen)+(col))

#define REG_DISPCTL (*(volatile unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

#define HEIGHT 160
#define WIDTH 240

extern volatile unsigned short *videoBuffer;

// color
#define COLOR(r,g,b) ((r) | (g)<<5 | (b)<<10)
#define BLACK 0
#define WHITE COLOR(31,31,31)
#define RED COLOR(31,0,0)
#define GREEN COLOR(0,31,0)
#define BLUE COLOR(0,0,31)
#define CYAN COLOR(0,31,31)
#define MAGENTA COLOR(31,0,31)
#define YELLOW COLOR(31,31,0)

// mode 3 drawing functions
void setPixel(int col, int row, unsigned short color);
void drawDragon(int col, int row, int size, unsigned short color);
void fillScreen(unsigned short color);
void drawDragonFire(int col, int row, int size, unsigned short outer, 
unsigned short middle, unsigned short inner);

// VSYNC
void waitForVBlank();


#endif