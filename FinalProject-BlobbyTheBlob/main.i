# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"




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
# 6 "main.c" 2
# 1 "startbg.h" 1
# 22 "startbg.h"
extern const unsigned short startbgTiles[864];


extern const unsigned short startbgMap[1024];


extern const unsigned short startbgPal[256];
# 7 "main.c" 2
# 1 "pausebg.h" 1
# 22 "pausebg.h"
extern const unsigned short pausebgTiles[10368];


extern const unsigned short pausebgMap[2048];


extern const unsigned short pausebgPal[256];
# 8 "main.c" 2
# 1 "gamebg.h" 1
# 22 "gamebg.h"
extern const unsigned short gamebgTiles[26048];


extern const unsigned short gamebgMap[2048];


extern const unsigned short gamebgPal[256];
# 9 "main.c" 2
# 1 "losebg.h" 1
# 22 "losebg.h"
extern const unsigned short losebgTiles[11008];


extern const unsigned short losebgMap[1024];


extern const unsigned short losebgPal[256];
# 10 "main.c" 2
# 1 "winbg.h" 1
# 22 "winbg.h"
extern const unsigned short winbgTiles[272];


extern const unsigned short winbgMap[1024];


extern const unsigned short winbgPal[256];
# 11 "main.c" 2
# 1 "instrbg.h" 1
# 22 "instrbg.h"
extern const unsigned short instrbgTiles[12544];


extern const unsigned short instrbgMap[1024];


extern const unsigned short instrbgPal[256];
# 12 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 13 "main.c" 2
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
# 14 "main.c" 2
# 1 "space.h" 1
# 22 "space.h"
extern const unsigned short spaceTiles[9744];


extern const unsigned short spaceMap[3072];


extern const unsigned short spacePal[256];
# 15 "main.c" 2
# 1 "stars.h" 1
# 22 "stars.h"
extern const unsigned short starsTiles[928];


extern const unsigned short starsMap[1024];


extern const unsigned short starsPal[256];
# 16 "main.c" 2
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
# 17 "main.c" 2
# 1 "gameSong.h" 1


extern const unsigned int gameSong_sampleRate;
extern const unsigned int gameSong_length;
extern const signed char gameSong_data[];
# 18 "main.c" 2




void initialize();


void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void updateGame();
void drawGame();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void initPlayer();
void updatePlayer();


int hOff = 0;
int vOff = 0;
int arr[35];
int flyMode = 1;
int flyCounter = 0;
int flyAniCounter = 0;
int winHOff = 100;


enum
{
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;


unsigned short buttons;
unsigned short oldButtons;


OBJ_ATTR shadowOAM[128];


int seed;
SOUND soundA;

int main()
{
    initialize();

    while (1)
    {

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch (state)
        {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case INSTRUCTIONS:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}


void initialize()
{
    (*(volatile unsigned short *)0x4000000) = 0 | (1 << 8) | (1 << 9) | (1 << 10)| (1 << 12);


    stopSound();
    playSoundA(gameSong_data, gameSong_length, 1);
    buttons = (*(volatile unsigned short *)0x04000130);
    oldButtons = 0;

    setupSounds();
 setupInterrupts();

    goToStart();
}


void goToStart() {

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 128 * 4);

    (*(volatile unsigned short *)0x04000012) = 0;
    winHOff = 100;

    (*(volatile unsigned short *)0x4000000) = 0 | (1 << 9) | (1 << 8) | (1 << 10) | (1 << 12);
    DMANow(3, spacePal, ((unsigned short *)0x5000000), 256);

    (*(volatile unsigned short *)0x400000C) = (0 << 7) | (1 << 14) | ((2) << 2) | ((31) << 8);
    DMANow(3, spaceTiles, &((charblock *)0x6000000)[2], 19488 / 2);
    DMANow(3, spaceMap, &((screenblock *)0x6000000)[31], 6144 / 2 );

    (*(volatile unsigned short *)0x400000A) = (0 << 7) | (0 << 14) | ((1) << 2) | ((30) << 8);
    DMANow(3, starsTiles, &((charblock *)0x6000000)[1], 1856 / 2);
    DMANow(3, starsMap, &((screenblock *)0x6000000)[30], 2048 / 2 );

    (*(volatile unsigned short *)0x4000008) = (0 << 7) | (0 << 14) | ((0) << 2) | ((28) << 8);
    DMANow(3, startbgTiles, &((charblock *)0x6000000)[0], 1728 / 2);
    DMANow(3, startbgMap, &((screenblock *)0x6000000)[28], 2048 / 2 );

    flipPage();

    state = START;

}



void start() {

    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        hOff--;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
        hOff++;
    }
    waitForVBlank();

    (*(volatile unsigned short *)0x04000014) = hOff;
    (*(volatile unsigned short *)0x04000018) = hOff / 2;


    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        goToGame();
        initGame();
    }
    if ((!(~(oldButtons) & ((1 << 2))) && (~buttons & ((1 << 2))))) {
        goToInstructions();
    }
}


void goToGame() {



    (*(volatile unsigned short *)0x4000008) = (1 << 7) | (1 << 14) | ((0) << 2) | ((28) << 8);


    DMANow(3, gamebgPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, gamebgTiles, &((charblock *)0x6000000)[0], 52096 / 2);
    DMANow(3, gamebgMap, &((screenblock *)0x6000000)[28], 4096 / 2);

    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000010) = hOff;


    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512 / 2);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 128 * 4);

    state = GAME;
}


void game() {

    updateGame();
    drawGame();

    if(loserState == 1) {
        goToLose();
    }
    if(loserState == -1) {
        goToWin();
    }

    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        goToPause();
    }
    if ((!(~(oldButtons) & ((1 << 2))) && (~buttons & ((1 << 2))))) {
        goToLose();
    }
}


void goToPause() {


    (*(volatile unsigned short *)0x4000000) = (1 << 8) | (1 << 12);
    (*(volatile unsigned short *)0x4000008) = (1 << 7) | ((0) << 2) | ((28) << 8) | (0 << 14);
    DMANow(3, pausebgPal, ((unsigned short *)0x5000000), 512);
    DMANow(3, pausebgTiles, &((charblock *)0x6000000)[0], 20736 / 2);
    DMANow(3, pausebgMap, &((screenblock *)0x6000000)[28], 4096 / 2);

    (*(volatile unsigned short *)0x04000010) = 0;
    flipPage();

    state = PAUSE;
}


void pause() {
    if ((!(~(oldButtons) & ((1 << 2))) && (~buttons & ((1 << 2))))) {
        goToStart();
    }
    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        goToGame();
    }
}


void goToInstructions() {

    (*(volatile unsigned short *)0x4000000) = (1 << 8);

    (*(volatile unsigned short *)0x4000008) = (1 << 7) | ((0) << 2) | ((27) << 8) | (0 << 14);
    DMANow(3, instrbgPal, ((unsigned short *)0x5000000), 512);
    DMANow(3, instrbgTiles, &((charblock *)0x6000000)[0], 25088/ 2);
    DMANow(3, instrbgMap, &((screenblock *)0x6000000)[27], 2048/2);

    flipPage();

    state = INSTRUCTIONS;
}


void instructions() {

    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        goToStart();
    }
    if ((!(~(oldButtons) & ((1 << 2))) && (~buttons & ((1 << 2))))) {
        goToStart();
    }


}


void goToWin() {

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 128 * 4);

    (*(volatile unsigned short *)0x4000000) = 0 | (1 << 9) | (1 << 8) | (1 << 10) | (1 << 12);
    DMANow(3, spacePal, ((unsigned short *)0x5000000), 256);

    (*(volatile unsigned short *)0x400000C) = (0 << 7) | (1 << 14) | ((2) << 2) | ((31) << 8);
    DMANow(3, spaceTiles, &((charblock *)0x6000000)[2], 19488 / 2);
    DMANow(3, spaceMap, &((screenblock *)0x6000000)[31], 6144 / 2 );

    (*(volatile unsigned short *)0x400000A) = (0 << 7) | (0 << 14) | ((1) << 2) | ((30) << 8);
    DMANow(3, starsTiles, &((charblock *)0x6000000)[1], 1856 / 2);
    DMANow(3, starsMap, &((screenblock *)0x6000000)[30], 2048 / 2 );

    (*(volatile unsigned short *)0x4000008) = (0 << 7) | (0 << 14) | ((0) << 2) | ((28) << 8);
    DMANow(3, winbgTiles, &((charblock *)0x6000000)[0], 544 / 2);
    DMANow(3, winbgMap, &((screenblock *)0x6000000)[28], 2048 / 2 );

    flipPage();

    state = WIN;
}


void win() {

    waitForVBlank();
    flyAniCounter++;

    if (flyCounter == 20) {
        flyMode = -1;
    }
    if (flyCounter == -20) {
        flyMode = 1;
    }

    if(flyAniCounter % 3 == 0) {
        flyCounter += flyMode;
        vOff += flyMode;

        if (winHOff > 0) {
            winHOff--;
        }
    }

    hOff++;
    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000010) = winHOff;
    (*(volatile unsigned short *)0x04000014) = hOff;
    (*(volatile unsigned short *)0x04000018) = hOff / 2;

    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        goToStart();
    }
}


void goToLose() {
    (*(volatile unsigned short *)0x4000000) = (1 << 8);
    (*(volatile unsigned short *)0x4000008) = ((0) << 2) | ((28) << 8) | (0 << 14) | (1 << 7);
    DMANow(3, losebgPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, losebgTiles, &((charblock *)0x6000000)[0], 22016);
    DMANow(3, losebgMap, &((screenblock *)0x6000000)[28], 2048);

    hideSprites();

    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;

    flipPage();

    state = LOSE;
}


void lose() {
    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        goToStart();
    }
}
