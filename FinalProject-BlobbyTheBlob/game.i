# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct
{
    u16 tileimg[8192];
} charblock;


typedef struct
{
    u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();




typedef struct
{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 159 "myLib.h"
void hideSprites();






typedef struct
{
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 202 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 212 "myLib.h"
typedef volatile struct
{
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 253 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 289 "myLib.h"
typedef void (*ihp)(void);
# 309 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
int getRandNum(int upperbound);
# 2 "game.c" 2
# 1 "game.h" 1

typedef struct {
    int row;
    int col;
    int height;
    int width;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int rdel;
 int cdel;
 int hide;
    int isJumping;
    int jumpRow;
    int direction;
} BLOB;


typedef struct {
 int row;
 int col;
 int rdel;
 int cdel;
 int height;
 int width;
 int active;

} BULLET;


typedef struct {
 int row;
 int col;
 int rdel;
 int cdel;
 int height;
 int width;
    int aniCounter;
    int aniState;
    int curFrame;
    int numFrames;
 int active;
} CHEAT;


typedef struct {
    int row;
    int col;
    int height;
    int width;
    int aniCounter;
    int aniState;

    int curFrame;
    int numFrames;
    int health;
    int active;
 int hide;
} DOGGO;
# 70 "game.h"
extern BULLET bullets[5];
extern int hOff;
extern int vOff;
extern int loserState;
extern int gravity;
extern int bCounter;
extern int score;
extern OBJ_ATTR shadowOAM[128];
extern BLOB blob;


void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();

void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);

void initDoggo();
void updateDoggo(DOGGO *);
void drawDoggo();
# 3 "game.c" 2
# 1 "collisionmap.h" 1
# 20 "collisionmap.h"
extern const unsigned short collisionmapBitmap[78720];
# 4 "game.c" 2
# 1 "sound.h" 1
void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 49 "sound.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 5 "game.c" 2
# 1 "dripdrip.h" 1


extern const unsigned int dripdrip_sampleRate;
extern const unsigned int dripdrip_length;
extern const signed char dripdrip_data[];
# 6 "game.c" 2
# 1 "jumpSfx.h" 1


extern const unsigned int jumpSfx_sampleRate;
extern const unsigned int jumpSfx_length;
extern const signed char jumpSfx_data[];
# 7 "game.c" 2



BULLET bullets[5];
int hOff;
int vOff;
int loserState;
int gravity;
int bCounter;
int score;
OBJ_ATTR shadowOAM[128];
BLOB blob;
CHEAT cheat;
DOGGO doggo[5];


enum {FRONT, BACK, RIGHT, LEFT, IDLE};


void initGame() {


    vOff = 0;
    hOff = 9;
    loserState = 0;
    bCounter = 5;
    score = 0;

    initPlayer();
    initBullets();
    initDoggo();
    initCheat();

}


void updateGame() {

 updatePlayer();
    updateCheat();


 for (int i = 0; i < 5; i++)
  updateBullet(&bullets[i]);

    for (int i = 0; i < 5; i++) {
        updateDoggo(&doggo[i]);
    }
}


void drawGame() {

    drawPlayer();
    drawAmount();
    drawCheat();
    drawScore();


 for (int i = 0; i < 5; i++){
  drawBullet(&bullets[i]);
    }
    for (int i = 0; i < 5 +1; i++) {
        drawDoggo(&doggo[i]);
    }

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 128 * 4);

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}




void initPlayer() {

    blob.width = 16;
    blob.height = 16;
    blob.rdel = 1;
    blob.cdel = 1;



    blob.row = 10;
    blob.col = 60;
    blob.aniCounter = 0;
    blob.curFrame = 0;
    blob.numFrames = 3;
    blob.aniState = FRONT;
    blob.jumpRow = ((blob.row) << 8);
    blob.isJumping = 0;
    blob.direction = 1;

}


void updatePlayer() {

    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        if (blob.col > 50 && blob.col < 498)
            {


            blob.col = blob.col - blob.cdel;

            if (hOff > 0 && (blob.col - hOff) <= 240 / 2) {
                hOff = hOff - blob.cdel;
            }
        }
        blob.direction = 0;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
        if (blob.col + blob.width < 498)
            {

            blob.col = blob.col + blob.cdel;

            if (hOff < 498 - 240) {
                hOff = hOff + blob.cdel;
            }
        }
        blob.direction = 1;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6)))) {
        if (blob.row > 0)
            {


            blob.row = blob.row - blob.rdel;


        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7)))) {
        if (blob.row < 160)
            {


            blob.row = blob.row + blob.rdel;

        }
    }


 if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0))))) {
  fireBullet();
        playSoundB(dripdrip_data, dripdrip_length, 0);
 }


    if (((blob.jumpRow + blob.rdel) >> 8) <= 160 - 41) {
        blob.jumpRow += blob.rdel;
    } else {
        blob.rdel = 0;
        blob.isJumping = 0;
    }
    blob.rdel += 111;

    if((!(~(oldButtons) & ((1 << 1))) && (~buttons & ((1 << 1)))) && !blob.isJumping) {
        playSoundB(jumpSfx_data, jumpSfx_length, 0);
        blob.rdel -= 1600;
        blob.isJumping = 1;
    }
    blob.row = ((blob.jumpRow) >> 8);

    if((blob.isJumping && !(collisionmapBitmap[((blob.row - 1) * (498) + (blob.col))])) ||
    (blob.isJumping && !(collisionmapBitmap[((blob.row - 1) * (498) + (blob.col + blob.width - 1))]))) {
        blob.isJumping = 0;
    }


    if (blob.col + blob.width == 498 - 1) {
        loserState = -1;
    }

    animatePlayer();
}


void animatePlayer() {


    blob.prevAniState = blob.aniState;
    blob.aniState = IDLE;


    if(blob.aniCounter % 20 == 0) {
        blob.curFrame = (blob.curFrame + 1) % blob.numFrames;
    }


    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6))))
        blob.aniState = BACK;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7))))
        blob.aniState = FRONT;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5))))
        blob.aniState = LEFT;
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4))))
        blob.aniState = RIGHT;


    if (blob.aniState == IDLE) {
        blob.curFrame = 0;
        blob.aniCounter = 0;
        blob.aniState = blob.prevAniState;
    } else {
        blob.aniCounter++;
    }
}


void drawPlayer() {

    if (blob.hide) {
        shadowOAM[0].attr0 |= (2 << 8);
    } else {
        shadowOAM[0].attr0 = (0xFF & (blob.row - vOff)) | (0 << 14);
        shadowOAM[0].attr1 = (0x1FF & (blob.col - hOff)) | (1 << 14);
        shadowOAM[0].attr2 = ((0) << 12) | ((blob.curFrame * 2)*32 + (blob.aniState * 2));
    }
}




void initBullets() {

 for (int i = 0; i < 5; i++) {

  bullets[i].height = 4;
  bullets[i].width = 6;

  bullets[i].active = 0;
 }
}


void fireBullet() {


    if (bCounter > 0) {

        if (blob.direction == 1) {

            for (int i = 0; i < 5; i++) {
                if (!bullets[i].active) {


                    bullets[i].col = blob.col - hOff;
                    bullets[i].row = blob.row + blob.height/2 - bullets[i].width/2;


                    bullets[i].cdel = 1;


                    bullets[i].active = 1;
                    bCounter -= 1;
                    launchCheat();


                    break;
                }
            }
        }
    }
}


void updateBullet(BULLET* b) {


 if (b->active) {
  if (b->row + b->height-1 >= 0
            && b->col + b->cdel > 0
            && b->col + b->cdel < 240 - 1) {

            b->col += 1;

  } else {
   b->active = 0;
  }
 }
}


void drawBullet(BULLET* b) {

 for (int i = 0; i<5; i++) {
     if(bullets[i].active) {
            shadowOAM[7+i].attr0 = (bullets[i].row & 0xFF) | (0 << 13) | (0 << 14);
            shadowOAM[7+i].attr1 = (bullets[i].col & 0x1FF) | (0 << 14);
            shadowOAM[7+i].attr2 = ((0) << 12) | ((0)*32 + (8));
        } else {
            shadowOAM[7+i].attr0 = (2 << 8);
        }
 }

}


void drawAmount() {
    shadowOAM[1+30].attr0 = (5 & 0xFF) | (0 << 13) | (1 << 14);
    shadowOAM[1+30].attr1 = (5 & 0x1FF) | (0 << 14);
    shadowOAM[1+30].attr2 = ((0) << 12) | ((1 + bCounter)*32 + (8));

    shadowOAM[1+31].attr0 = (5 & 0xFF) | (0 << 13) | (1 << 14);
    shadowOAM[1+31].attr1 = (21 & 0x1FF) | (0 << 14);
    shadowOAM[1+31].attr2 = ((0) << 12) | ((1 + bCounter)*32 + (10));

    shadowOAM[1+32].attr0 = (5 & 0xFF) | (0 << 13) | (1 << 14);
    shadowOAM[1+32].attr1 = (37 & 0x1FF) | (0 << 14);
    shadowOAM[1+32].attr2 = ((0) << 12) | ((1 + bCounter)*32 + (12));
}



void initCheat() {

    cheat.height = 4;
 cheat.width = 6;
    cheat.rdel = 1;
    cheat.cdel = 1;

    cheat.active = 0;
    cheat.row = 90;
    cheat.col = 498;
    cheat.aniCounter = 0;
    cheat.curFrame = 0;
    cheat.numFrames = 4;

}

void launchCheat() {
    if (bCounter == 0) {
        cheat.active = 1;
        cheat.col = 498;
    }
}

void updateCheat() {
    if (cheat.active == 1) {
        if (cheat.col > 0) {
            cheat.col -= 1;
        } else {
            cheat.active = 0;
        }

        if(collision(cheat.col + hOff, cheat.row, cheat.width, cheat.height, blob.col, blob.row, blob.width, blob.height)) {
            bCounter = 5;
            cheat.active = 0;
        }


        cheat.aniCounter++;
        if(cheat.aniCounter % 10 == 0) {
            if (cheat.curFrame < cheat.numFrames - 1) {
                cheat.curFrame++;
            } else {
                cheat.curFrame = 0;
            }
        }
    }
}

void drawCheat() {
    if (cheat.active == 1) {
        shadowOAM[34].attr0 = (0xFF & (cheat.row)) | (2 << 14);
        shadowOAM[34].attr1 = (0x1FF & (cheat.col)) | (0 << 14);
        shadowOAM[34].attr2 = ((0) << 12) | ((12)*32 + (cheat.curFrame));
    } else {
        shadowOAM[34].attr0 = (2 << 8);
    }

}



void initDoggo() {
    for(int i = 0; i < 5; i++) {
        doggo[i].height = 16;
        doggo[i].width = 16;
        doggo[i].row = 160 - 41;
        doggo[i].col = 498;
        doggo[i].curFrame = 0;
        doggo[i].numFrames = 4;
        doggo[i].aniState = 0;
        doggo[i].aniCounter = 0;
        doggo[i].health = 1;
        doggo[i].active = 0;
    }


}

void updateDoggo(DOGGO *d) {
    int rando = getRandNum(250);

    if (rando == 1) {
        d->active = 1;
    }


    if(d->active) {
        if(d->col > 1) {
            d->col--;
        }

        if(d->col == 2) {
            d->active = 0;
            d->col = 498;
        }


        for (int i = 0; i < 5; i++) {
            if(bullets[i].active && collision(d->col - hOff, d->row, d->width, d->height, bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height)) {
                bullets[i].active = 0;
                d->health = 0;
                score++;
            }
        }
        if(d->health <= 0) {

            d->active = 0;
            d->col = 498;
            d->health = 1;
        }


        if(collision(d->col, d->row, d->width, d->height, blob.col, blob.row, blob.width, blob.height)) {
            loserState = 1;
        }


        d->aniCounter++;
        if(d->aniCounter % 20 == 0) {
            if (d->curFrame < d->numFrames - 1) {
                d->curFrame++;
            } else {
                d->curFrame = 0;
            }
        }

    }

}


void drawDoggo(DOGGO *d) {
    for (int i = 0; i<5; i++) {
        if (doggo[i].active) {
            shadowOAM[2+i].attr0 = (0xFF & (doggo[i].row - vOff)) | (0 << 14);
            shadowOAM[2+i].attr1 = (0x1FF & (doggo[i].col - hOff)) | (1 << 14);
            shadowOAM[2+i].attr2 = ((0) << 12) | ((6)*32 + (doggo[i].curFrame*2));
        } else {
            shadowOAM[2+i].attr0 = (2 << 8);
        }
    }
}



void drawScore() {
    shadowOAM[37].attr0 = (0xFF & (5)) | (0 << 14);
    shadowOAM[37].attr1 = (0x1FF & (190)) | (1 << 14);
    shadowOAM[37].attr2 = ((0) << 12) | ((14)*32 + (((score%100)/10)*2));

    shadowOAM[38].attr0 = (0xFF & (5)) | (0 << 14);
    shadowOAM[38].attr1 = (0x1FF & (204)) | (1 << 14);
    shadowOAM[38].attr2 = ((0) << 12) | ((14)*32 + ((score%10)*2));
}
