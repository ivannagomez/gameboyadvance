// FINAL SUBMISSION

//#include <stdlib.h>
//#include <stdio.h>
#include "myLib.h"
#include "startbg.h"
#include "pausebg.h"
#include "gamebg.h"
#include "losebg.h"
#include "winbg.h"
#include "instrbg.h"
#include "spritesheet.h"
#include "game.h"
#include "space.h"
#include "stars.h"
#include "sound.h"
#include "gameSong.h"



// Prototypes
void initialize();

// State Prototypes
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

// Vertical and Horizontal Offsets
int hOff = 0;
int vOff = 0;
int arr[35];
int flyMode = 1;
int flyCounter = 0;
int flyAniCounter = 0;
int winHOff = 100;

// States
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

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

// Random Seed
int seed;
SOUND soundA;

int main()
{
    initialize();

    while (1)
    {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
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

// Sets up GBA
void initialize()
{
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE| SPRITE_ENABLE;
    //REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL;

    stopSound();
    playSoundA(gameSong_data, gameSong_length, 1);
    buttons = BUTTONS;
    oldButtons = 0;

    setupSounds();
	setupInterrupts();

    goToStart();
}

// Sets up the start state
void goToStart() {

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0VOFF = 0;
    winHOff = 100;

    REG_DISPCTL = MODE0 | BG1_ENABLE | BG0_ENABLE | BG2_ENABLE | SPRITE_ENABLE;
    DMANow(3, spacePal, PALETTE, 256);

    REG_BG2CNT = BG_4BPP | BG_SIZE_WIDE | BG_CHARBLOCK(2) | BG_SCREENBLOCK(31);
    DMANow(3, spaceTiles, &CHARBLOCK[2], spaceTilesLen / 2);
    DMANow(3, spaceMap, &SCREENBLOCK[31], spaceMapLen / 2 );

    REG_BG1CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);
    DMANow(3, starsTiles, &CHARBLOCK[1], starsTilesLen / 2);
    DMANow(3, starsMap, &SCREENBLOCK[30], starsMapLen / 2 );

    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, startbgTiles, &CHARBLOCK[0], startbgTilesLen / 2);
    DMANow(3, startbgMap, &SCREENBLOCK[28], startbgMapLen / 2 );

    flipPage();

    state = START;
    
}


// Runs every frame of the start state
void start() {

    if(BUTTON_HELD(BUTTON_LEFT)) {
        hOff--;
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        hOff++;
    }
    waitForVBlank();

    REG_BG1HOFF = hOff;
    REG_BG2HOFF = hOff / 2;


    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        initGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    }
}

// Sets up the game state
void goToGame() {

    //waitForVBlank();

    REG_BG0CNT = BG_8BPP | BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    //set background
    DMANow(3, gamebgPal, PALETTE, 256);
    DMANow(3, gamebgTiles, &CHARBLOCK[0], gamebgTilesLen / 2);
    DMANow(3, gamebgMap, &SCREENBLOCK[28], gamebgMapLen / 2);

    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

    //set sprites
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = GAME;
}

// Runs every frame of the game state
void game() {

    updateGame();
    drawGame();

    if(loserState == 1) {
        goToLose();
    }
    if(loserState == -1) {
        goToWin();
    }

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToLose();
    }
}

// Sets up the pause state
void goToPause() {
    //waitForVBlank();

    REG_DISPCTL = BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL;
    DMANow(3, pausebgPal, PALETTE, pausebgPalLen);
    DMANow(3, pausebgTiles, &CHARBLOCK[0], pausebgTilesLen / 2);
    DMANow(3, pausebgMap, &SCREENBLOCK[28], pausebgMapLen / 2);

    REG_BG0HOFF = 0;
    flipPage();

    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}

// Sets up the instr state
void goToInstructions() {
    
    REG_DISPCTL = BG0_ENABLE;

    REG_BG0CNT = BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL;
    DMANow(3, instrbgPal, PALETTE, instrbgPalLen);
    DMANow(3, instrbgTiles, &CHARBLOCK[0], instrbgTilesLen/ 2);
    DMANow(3, instrbgMap, &SCREENBLOCK[27], instrbgMapLen/2);

    flipPage();

    state = INSTRUCTIONS;
}

// Runs every frame of the pause state
void instructions() {

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
    

}

// Sets up the win state
void goToWin() {

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_DISPCTL = MODE0 | BG1_ENABLE | BG0_ENABLE | BG2_ENABLE | SPRITE_ENABLE;
    DMANow(3, spacePal, PALETTE, 256);

    REG_BG2CNT = BG_4BPP | BG_SIZE_WIDE | BG_CHARBLOCK(2) | BG_SCREENBLOCK(31);
    DMANow(3, spaceTiles, &CHARBLOCK[2], spaceTilesLen / 2);
    DMANow(3, spaceMap, &SCREENBLOCK[31], spaceMapLen / 2 );

    REG_BG1CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);
    DMANow(3, starsTiles, &CHARBLOCK[1], starsTilesLen / 2);
    DMANow(3, starsMap, &SCREENBLOCK[30], starsMapLen / 2 );

    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, winbgTiles, &CHARBLOCK[0], winbgTilesLen / 2);
    DMANow(3, winbgMap, &SCREENBLOCK[28], winbgMapLen / 2 );

    flipPage();

    state = WIN;
}

// Runs every frame of the win state
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
    REG_BG0VOFF = vOff;
    REG_BG0HOFF = winHOff;
    REG_BG1HOFF = hOff;
    REG_BG2HOFF = hOff / 2;

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {
    REG_DISPCTL = BG0_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL | BG_8BPP;
    DMANow(3, losebgPal, PALETTE, 256);
    DMANow(3, losebgTiles, &CHARBLOCK[0], losebgTilesLen);
    DMANow(3, losebgMap, &SCREENBLOCK[28], losebgMapLen);

    hideSprites();

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    flipPage();

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}