#include "helper.h"
#include "stdlib.h"

// prototypes
void initialize();
void update();
void draw();

// buttons
unsigned short buttons;
unsigned short oldButtons;

// background
unsigned short bgColor;

//DRAGON
int dCol, dRow, dSize, dOldRow, dOldCol, dRDel;
unsigned short dColor, dEdge, dTummy, dEyeEdge, dEyeColor;

//GAME RECTANGLES
int gaCol, gaRow, gaSize, gaOldRow, gaOldCol, gaRDel, gaSize, gaSpacing, winCounter;
unsigned short gameColor1, gameColor2, gameColor3, gameColor4, gameColor5, gameColor6, gameColor7, gameColor8;

int main() {

	initialize();

	int time = 0;
	int counter = 0;
	int direction = 0;

	while (1) {
		time++;

		//GAME RECTANGLES
		if (direction == 1) {
			gaRow--;
			counter--;
		} else if (direction == 0) {
			gaRow++;
			counter++;
		}

		oldButtons = buttons;
		buttons = BUTTONS;
		update();
		waitForVBlank();
		draw();

		if (counter == (HEIGHT - 10)) {
			direction = 1;
		} else if (counter == 0) {
			direction = 0;
		}
	}
}

// sets up the display
void initialize() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	//buttons
	buttons = BUTTONS;
	oldButtons = 0;

	// background
	bgColor = CYAN;
	fillScreen(bgColor);	

	//DRAGON
	//Dragon Height = dSize x 20
	//Dragon Width = dSize x 12
	dSize = 1;
	dCol = 10;
	dRow = (HEIGHT / 2) + 10;
	dColor = GREEN;
	dEdge = BLACK;
	dTummy = YELLOW;
	dEyeEdge = WHITE;
	dEyeColor = BLUE;
	//drawDragon(dCol, dRow, dSize, dColor);
	drawDragon(dCol, dRow, dSize, dColor, dEdge, dTummy, dEyeEdge, dEyeColor);

	drawDragonFire(dCol, dRow, dSize, RED, YELLOW, WHITE);

	//DRAW FALLING RECTANGLES
	gaSize = 5;
	gaSpacing = 20;
	gaCol = 50;
	gaRow = 0;
	gameColor1 = GREEN;
	gameColor2 = RED;
	gameColor3 = GREEN;
	gameColor4 = GREEN;
	gameColor5 = RED;
	gameColor6 = GREEN;
	gameColor7 = RED;
	gameColor8 = GREEN;
	drawSq(gaCol, gaRow, gaSize*2, gaSize, gameColor1);
	drawSq(gaCol + gaSpacing, gaRow, gaSize*2, gaSize, gameColor2);
	drawSq(gaCol + gaSpacing*2, gaRow, gaSize*2, gaSize, gameColor3);
	drawSq(gaCol + gaSpacing*3, gaRow, gaSize*2, gaSize, gameColor4);
	drawSq(gaCol + gaSpacing*4, gaRow, gaSize*2, gaSize, gameColor5);
	drawSq(gaCol + gaSpacing*5, gaRow, gaSize*2, gaSize, gameColor6);
	drawSq(gaCol + gaSpacing*6, gaRow, gaSize*2, gaSize, gameColor7);
	drawSq(gaCol + gaSpacing*7, gaRow, gaSize*2, gaSize, gameColor8);

	winCounter = 0;

}

void update() {

	// mode dragon with buttons
	if (BUTTON_PRESSED(BUTTON_RIGHT) || BUTTON_HELD(BUTTON_RIGHT)) {
		dCol += 1;
	}

	if (BUTTON_PRESSED(BUTTON_LEFT) || BUTTON_HELD(BUTTON_LEFT)) {
		dCol -= 1;
	}


	// boundary checks
	if (dCol < 10) { // left
		dOldCol = dCol;
		dCol = 10;
	}
	if (dCol + 15 > WIDTH) { // right
		dOldCol = dCol;
		dCol = (WIDTH - 16);
	}

	// collission checks
	if (collision(dCol, dRow, 12, 20, gaCol, gaRow+15, 10, 5)) {
		if (gameColor1 == GREEN && (winCounter <= 5)) {
			gameColor1 = bgColor;
			winCounter++;
		}
	}

	if (collision(dCol, dRow, 12, 20, gaCol + gaSpacing, gaRow+15, 10, 5)) {
		if (winCounter <= 5) {
			dCol = 10;
			dRow = (HEIGHT / 2) + 10;
			gameColor1 = GREEN;
			gameColor3 = GREEN;
			gameColor4 = GREEN;
			gameColor6 = GREEN;
			gameColor8 = GREEN;
			winCounter = 0;
		}
	}

	if (collision(dCol, dRow, 12, 20, gaCol + gaSpacing*2, gaRow+15, 10, 5)) {
		if (gameColor3 == GREEN && (winCounter <= 5)) {
			gameColor3 = bgColor;
			winCounter++;
		}
	}

	if (collision(dCol, dRow, 12, 20, gaCol + gaSpacing*3, gaRow+15, 10, 5)) {
		if (gameColor4 == GREEN && (winCounter <= 5)) {
			gameColor4 = bgColor;
			winCounter++;
		}
	}

	if (collision(dCol, dRow, 12, 20, gaCol + gaSpacing*4, gaRow+15, 10, 5)) {
		if (winCounter <= 5) {
			dCol = 10;
			dRow = (HEIGHT / 2) + 10;
			gameColor1 = GREEN;
			gameColor3 = GREEN;
			gameColor4 = GREEN;
			gameColor6 = GREEN;
			gameColor8 = GREEN;
			winCounter = 0;
		}
	}

	if (collision(dCol, dRow, 12, 20, gaCol + gaSpacing*5, gaRow+15, 10, 5)) {
		if (gameColor6 == GREEN && (winCounter <= 5)) {
			gameColor6 = bgColor;
			winCounter++;
		}
	}

	if (collision(dCol, dRow, 12, 20, gaCol + gaSpacing*6, gaRow+15, 10, 5)) {
		if (winCounter <= 5) {
			dCol = 10;
			dRow = (HEIGHT / 2) + 10;
			gameColor1 = GREEN;
			gameColor3 = GREEN;
			gameColor4 = GREEN;
			gameColor6 = GREEN;
			gameColor8 = GREEN;
			winCounter = 0;
		}
	}

	if (collision(dCol, dRow, 12, 20, gaCol + gaSpacing*7, gaRow+15, 10, 5)) {
		if (gameColor8 == GREEN && (winCounter <= 5)) {
			gameColor8 = bgColor;
			winCounter++;
		}
	}

	//WIN STATE
	if ((gameColor1 == CYAN) && (gameColor3 == CYAN) && (gameColor4 == CYAN) 
	&& (gameColor6 == CYAN) && (gameColor8 == CYAN) && (winCounter == 5)) {
		bgColor = GREEN;
		fillScreen(bgColor);
		winCounter++;
		gameColor1 = GREEN;
		gameColor2 = GREEN;
		gameColor3 = GREEN;
		gameColor4 = GREEN;
		gameColor5 = GREEN;
		gameColor6 = GREEN;
		gameColor7 = GREEN;
		gameColor8 = GREEN;
	}


}

void draw() {

	// erase previous location
	drawDragon(dOldCol, dOldRow, dSize, bgColor, bgColor, bgColor, bgColor, bgColor);
	drawDragon(dCol, dRow, dSize, dColor, dEdge, dTummy, dEyeEdge, dEyeColor);

	drawDragonFire(dOldCol, dOldRow, dSize, bgColor, bgColor, bgColor);
	drawDragonFire(dCol, dRow, dSize, RED, YELLOW, WHITE);

	// update old variables
	dOldCol = dCol;
	dOldRow = dRow;

	// erase previous location
	drawSq(gaOldCol, gaOldRow, gaSize*2, gaSize, bgColor);
	drawSq(gaCol, gaRow, gaSize*2, gaSize, gameColor1);

	drawSq(gaOldCol + gaSpacing, gaOldRow, gaSize*2, gaSize, bgColor);
	drawSq(gaCol + gaSpacing, gaRow, gaSize*2, gaSize, gameColor2);

	drawSq(gaOldCol + gaSpacing*2, gaOldRow, gaSize*2, gaSize, bgColor);
	drawSq(gaCol + gaSpacing*2, gaRow, gaSize*2, gaSize, gameColor3);

	drawSq(gaOldCol + gaSpacing*3, gaOldRow, gaSize*2, gaSize, bgColor);
	drawSq(gaCol + gaSpacing*3, gaRow, gaSize*2, gaSize, gameColor4);

	drawSq(gaOldCol + gaSpacing*4, gaOldRow, gaSize*2, gaSize, bgColor);
	drawSq(gaCol + gaSpacing*4, gaRow, gaSize*2, gaSize, gameColor5);

	drawSq(gaOldCol + gaSpacing*5, gaOldRow, gaSize*2, gaSize, bgColor);
	drawSq(gaCol + gaSpacing*5, gaRow, gaSize*2, gaSize, gameColor6);

	drawSq(gaOldCol + gaSpacing*6, gaOldRow, gaSize*2, gaSize, bgColor);
	drawSq(gaCol + gaSpacing*6, gaRow, gaSize*2, gaSize, gameColor7);

	drawSq(gaOldCol + gaSpacing*7, gaOldRow, gaSize*2, gaSize, bgColor);
	drawSq(gaCol + gaSpacing*7, gaRow, gaSize*2, gaSize, gameColor8);

	// update old variables
	gaOldCol = gaCol;
	gaOldRow = gaRow;

}
