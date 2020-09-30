#include "myLib.h"
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

// eye rectangles
int eRow0, eRow1, eCol0, eCol1, eHeight, eWidth;
unsigned short eColor;

// mouth rectangle
int mCol, mRow, mHeight, mWidth, mOldRow, mOldCol, mRDel, mCDel;
unsigned short mColor;

// blue rectangle
int bRow, bCol, bOldRow, bOldCol, bRDel, bCDel, bHeight, bWidth;

int main() {

	initialize();
 
	while (1) {
	// TODO #3.2: update the button variables each frame
	
		oldButtons = buttons;
		buttons = BUTTONS;
		update();
		waitForVBlank();
		draw();
	}
}

// sets up the display and the game "objects"
void initialize() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	// TODO #3.1: intialize your button variables
	buttons = BUTTONS;
	oldButtons = 0;

	// initialize background
	
	bgColor = CYAN;
	eColor = WHITE;
	mColor = BLACK;
	fillScreen(bgColor);
	

	// initialize eye rectangles
	eHeight = 60;
	eWidth = 25;
	eRow0 = (SCREENHEIGHT / 2) - eHeight; // left eye
	eCol0 = eWidth * 2;							
	eRow1 = (SCREENHEIGHT / 2) - eHeight; // right eye
	eCol1 = SCREENWIDTH - eWidth * 3;		

    // initialize mouth rectangle
    mHeight = 15;
	mWidth = 50;
	mRow = SCREENHEIGHT - 40;
	mCol = SCREENWIDTH / 3;
	mRDel = 1;
	mCDel = 1;
	mColor = BLACK;		

	// initialize blue rectangle
	bHeight = 20;
	bWidth = 15;
	bRow = (SCREENHEIGHT / 2) - (bHeight / 2);
	bCol = (SCREENWIDTH / 2) - (bWidth / 2);
	bOldRow = bRow;
	bOldCol = bCol;
	bRDel = 1;
	bCDel = 1;
}

// performs all of the game's calculations
void update() {
	
	// change the eye color if button A is pressed
	// UNCOMMENT #3
	
	if (BUTTON_PRESSED(BUTTON_A)) {
		if (eColor == WHITE)
			eColor = BLACK;
		else
			eColor = WHITE;
	}

	// boundary checks
	if (bCol < 0) { // left
		bOldCol = bCol;
		bCol = 0;
	}
	if (bCol + bWidth > SCREENWIDTH) { // right
		bOldCol = bCol;
		bCol = (SCREENWIDTH - 1) - (bWidth - 1);
	}
	if (bRow < 0) { // top
		bOldRow = bRow;
		bRow = 0;
	}
	if (bRow + bHeight > SCREENHEIGHT) { // bottom
		bOldRow = bRow;
		bRow = (SCREENHEIGHT - 1) - (bHeight - 1);
	}

	// move the blue rectangle with the buttons
	// TODO #4: make the blue rectangle move with the arrow keys
	if (BUTTON_PRESSED(BUTTON_RIGHT) || BUTTON_HELD(BUTTON_RIGHT)) {
		bCol += 1;
	}

	if (BUTTON_PRESSED(BUTTON_LEFT) || BUTTON_HELD(BUTTON_LEFT)) {
		bCol -= 1;
	}
	
	if (BUTTON_PRESSED(BUTTON_UP) || BUTTON_HELD(BUTTON_UP)) {
		bRow -= 1;
	}

	if (BUTTON_PRESSED(BUTTON_DOWN) || BUTTON_HELD(BUTTON_DOWN)) {
		bRow += 1;
	}

	// make mouth rectangle bounce horizontally off the walls
	if (mCol <= 0) { // left
		mCDel *= -1;
	}
	if (mCol + mWidth > SCREENWIDTH) { // right
		mCDel *= -1;
	}

	// update mouth rectangle's position
	mCol += mCDel;
	
	// TODO #5.1: set the col and row of the blue rectangle to it's initial position
	// (i.e. the middle of the screen) if the blue rectangle collides with either of 
	// the two eye rectangles

	if (collision(bCol, bRow, bWidth, bHeight, eCol0, eRow0, eWidth, eHeight)) {
		bRow = (SCREENHEIGHT / 2) - (bHeight / 2);
		bCol = (SCREENWIDTH / 2) - (bWidth / 2);
	}

	if (collision(bCol, bRow, bWidth, bHeight, eCol1, eRow1, eWidth, eHeight)) {
		bRow = (SCREENHEIGHT / 2) - (bHeight / 2);
		bCol = (SCREENWIDTH / 2) - (bWidth / 2);
	}



	// TODO #5.2: set the col and row of the blue rectangle to it's initial position
	// (i.e. the middle of the screen) if the blue rectangle collides with the mouth rectangle.
	// Additionally, if mColor is currently black, change it to red. If it is already red, change 
	// it to black
	if (collision(bCol, bRow, bWidth, bHeight, mCol, mRow, mWidth, mHeight)) {
		bRow = (SCREENHEIGHT / 2) - (bHeight / 2);
		bCol = (SCREENWIDTH / 2) - (bWidth / 2);
		if (eColor == WHITE)
			eColor = BLACK;
		else if (eColor == BLACK)
			eColor = RED;
		else
			eColor = BLACK;
	}
}

// performs all of the writing to the screen
void draw() {

	// draw rectangles to screen
	
	// erase the previous blue rectangle location
	drawRect(bOldCol, bOldRow, bWidth, bHeight, bgColor);

    // erase the mouth rectangle location
	drawRect(mOldCol, mOldRow, mWidth, mHeight, bgColor);

	// draw the new blue rectangle location
	drawRect(bCol, bRow, bWidth, bHeight, BLUE);

	// draw stationary eye rectangles
	drawRect(eCol0, eRow0, eWidth, eHeight, eColor);
	drawRect(eCol1, eRow1, eWidth, eHeight, eColor);

	drawRect(mCol, mRow, mWidth, mHeight, mColor);
	

	// update old variables
	bOldRow = bRow;
	bOldCol = bCol;

	mOldRow = mRow;
	mOldCol = mCol;
}
