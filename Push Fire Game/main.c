#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Prototypes
void initialize();

// State Prototypes
// TODO 1.2: Add your state and state transition function prototypes here
void goToStart();
void startState();
void goToGame();
void gameState();
void goToPause();
void pauseState();
void goToWin();
void winState();
void goToLose();
void loseState();


// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;


// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        // TODO 1.0: Make the state machine here
        switch(state) {
            case START:
            startState();
            break;
            case GAME:
            gameState();
            break;
            case PAUSE:
            pauseState();
            break;
            case WIN:
            winState();
            break;
            case LOSE:
            loseState();
            break;
            default:
            break;
        }
               
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    // TODO 1.3: Call your goToStart function here

    goToStart();
}

// TODO 1.1: Make your state and state transition functions
void goToStart() {
    state = START;
    fillScreen(MAGENTA);
    seed = 0;

}

void startState() {
    seed++;
    waitForVBlank();
    
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        goToGame();
		initGame();
	}
}

void goToGame() {
    fillScreen(BLACK);
    //
    state = GAME;
}

void gameState() {
    updateGame();

    waitForVBlank();
    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
	} else if (BUTTON_PRESSED(BUTTON_B)) {
        goToLose();
    } else if (ballsRemaining == 0) {
        goToWin;
    }
}

void goToPause() {
    fillScreen(BLUE);
    
    state = PAUSE;
}

void pauseState() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
	} else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToWin() {
    fillScreen(GREEN);
    state = WIN;
}

void winState() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
	}
}

void goToLose() {
    fillScreen(RED);
    state = LOSE;
}

void loseState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
	}
}