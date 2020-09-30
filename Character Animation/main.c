#include "helper.h"
#include "stdlib.h"

// prototypes
void initialize();
void draw();

// background
unsigned short bgColor;

//DRAGON
int dCol, dRow, dSize, dOldRow, dOldCol, dRDel;
unsigned short dColor;

int main() {

	initialize();

	int time = 0;
	int counter = 0;
	int direction = 0;

	while (1) {
		time++;
		if (direction == 1) {
			dRow++;
			counter--;
		} else if (direction == 0) {
			dRow--;
			counter++;
		}
		waitForVBlank();
		draw();
		if (counter == 10) {
			direction = 1;
		} else if (counter == 0) {
			direction = 0;
		}
	}
}

// sets up the display
void initialize() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	// background
	bgColor = CYAN;
	fillScreen(bgColor);	

	//DRAGON
	dSize = 5;
	dCol = (WIDTH / 2) - dSize * 6;
	dRow = HEIGHT - dSize;
	dColor = GREEN;
	drawDragon(dCol, dRow, dSize, dColor);
	drawDragonFire(dCol, dRow, dSize, RED, YELLOW, WHITE);

}

void draw() {

	// erase previous location
	drawDragonFire(dOldCol, dOldRow, dSize, bgColor, bgColor, bgColor);
	drawDragonFire(dCol, dRow, dSize, RED, YELLOW, WHITE);

	// update old variables
	dOldCol = dCol;
	dOldRow = dRow;
}
