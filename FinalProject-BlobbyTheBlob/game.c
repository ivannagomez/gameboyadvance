#include "myLib.h"
#include "game.h"
#include "collisionmap.h"
#include "sound.h"
#include "dripdrip.h"
#include "jumpSfx.h"


// Variables
BULLET bullets[BULLETCOUNT];
int hOff;
int vOff;
int loserState;
int gravity;
int bCounter;
int score;
OBJ_ATTR shadowOAM[128];
BLOB blob;
CHEAT cheat;
DOGGO doggo[DOGGOCOUNT];

// Sprite animation states for aniState
enum {FRONT, BACK, RIGHT, LEFT, IDLE};

// Initializes the game
void initGame() {

    // Place screen on map
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

// Updates the game each frame
void updateGame() {

	updatePlayer();
    updateCheat();

    // Update all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		updateBullet(&bullets[i]);

    for (int i = 0; i < DOGGOCOUNT; i++) {
        updateDoggo(&doggo[i]);
    }
}

// Draws the game
void drawGame() {

    drawPlayer();
    drawAmount();
    drawCheat();
    drawScore();

    // Draw all the bullets
	for (int i = 0; i < BULLETCOUNT; i++){
		drawBullet(&bullets[i]);
    }
    for (int i = 0; i < DOGGOCOUNT+1; i++) {
        drawDoggo(&doggo[i]);
    }
    
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

//--------------------------PLAYER-CODE-----------------------------------------------

// Initialize player
void initPlayer() {

    blob.width = 16;
    blob.height = 16;
    blob.rdel = 1;
    blob.cdel = 1;

    // Place in the middle of the screen in the world location chosen earlier
    //blob.row = SCREENHEIGHT - 41;
    blob.row = 10;
    blob.col = 60;
    blob.aniCounter = 0;
    blob.curFrame = 0;
    blob.numFrames = 3;
    blob.aniState = FRONT;
    blob.jumpRow = SHIFTUP(blob.row);
    blob.isJumping = 0;
    blob.direction = 1;
    
}

// Handles  actions of the player
void updatePlayer() {

    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (blob.col > 50 && blob.col < MAPWIDTH)
            {

            // Update world position if the above is true
            blob.col = blob.col - blob.cdel;

            if (hOff > 0 && (blob.col - hOff) <= SCREENWIDTH / 2) {
                hOff = hOff - blob.cdel;
            }
        }
        blob.direction = 0;
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (blob.col + blob.width < MAPWIDTH) 
            {
            // Update world position if the above is true
            blob.col = blob.col + blob.cdel;

            if (hOff < MAPWIDTH - SCREENWIDTH) {
                hOff = hOff + blob.cdel;
            }
        }
        blob.direction = 1;
    }
    if(BUTTON_HELD(BUTTON_UP)) {
        if (blob.row > 0)
            {

            // Update world position if the above is true
            blob.row = blob.row - blob.rdel;
            //vOff = vOff - blob.rdel;

        }
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if (blob.row < 160)
            {

            // Update world position if the above is true
            blob.row = blob.row + blob.rdel;

        }
    }

    // Fire bullets
	if (BUTTON_PRESSED(BUTTON_A)) {
		fireBullet();
        playSoundB(dripdrip_data, dripdrip_length, 0);
	}

    // Gravity
    if (SHIFTDOWN(blob.jumpRow + blob.rdel) <= SCREENHEIGHT - 41) {
        blob.jumpRow += blob.rdel; 
    } else {
        blob.rdel = 0;
        blob.isJumping = 0;
    }
    blob.rdel += GRAVITY;

    if(BUTTON_PRESSED(BUTTON_B) && !blob.isJumping) {
        playSoundB(jumpSfx_data, jumpSfx_length, 0);
        blob.rdel -= JUMPPOWER;
        blob.isJumping = 1;   
    }
    blob.row = SHIFTDOWN(blob.jumpRow);

    if((blob.isJumping && !(collisionmapBitmap[OFFSET(blob.col, blob.row - 1, MAPWIDTH)])) ||
    (blob.isJumping && !(collisionmapBitmap[OFFSET(blob.col + blob.width - 1, blob.row - 1, MAPWIDTH)]))) {
        blob.isJumping = 0;
    }

    // set win state
    if (blob.col + blob.width == MAPWIDTH - 1) {
        loserState = -1;
    }

    animatePlayer();
}

// Handle player animation states
void animatePlayer() {

    // Set previous state to current state
    blob.prevAniState = blob.aniState;
    blob.aniState = IDLE;

    // Change the animation frame every 20 frames of gameplay
    if(blob.aniCounter % 20 == 0) {
        blob.curFrame = (blob.curFrame + 1) % blob.numFrames;
    }

    // Control movement and change animation state
    if(BUTTON_HELD(BUTTON_UP))
        blob.aniState = BACK;
    if(BUTTON_HELD(BUTTON_DOWN))
        blob.aniState = FRONT;
    if(BUTTON_HELD(BUTTON_LEFT))
        blob.aniState = LEFT;
    if(BUTTON_HELD(BUTTON_RIGHT))
        blob.aniState = RIGHT;

    
    if (blob.aniState == IDLE) {
        blob.curFrame = 0;
        blob.aniCounter = 0;
        blob.aniState = blob.prevAniState;
    } else {
        blob.aniCounter++;
    }
}

// Draw the player
void drawPlayer() {

    if (blob.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = (ROWMASK & (blob.row - vOff)) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & (blob.col - hOff)) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(blob.aniState * 2, blob.curFrame * 2);
    }
}

//--------------------------BLOB-BULLETS-CODE-----------------------------------------------

// Initialize the pool of bullets
void initBullets() {

	for (int i = 0; i < BULLETCOUNT; i++) {

		bullets[i].height = 4; 
		bullets[i].width = 6;  

		bullets[i].active = 0;
	}
}

// Spawn a bullet
void fireBullet() {

    // Check bullet availability
    if (bCounter > 0) {
        //Check character direction
        if (blob.direction == 1) {
            // Find the first inactive bullet
            for (int i = 0; i < BULLETCOUNT; i++) {
                if (!bullets[i].active) {

                    // Position new bullet
                    bullets[i].col = blob.col - hOff;
                    bullets[i].row = blob.row + blob.height/2 - bullets[i].width/2;

                    // Slant it in the direction of player movement
                    bullets[i].cdel = 1;  

                    // Take the bullet out of the pool
                    bullets[i].active = 1;
                    bCounter -= 1;
                    launchCheat();

                    // Break out of the loop
                    break;
                }
            }
        }
    }
}

// Handle every-frame actions of a bullet
void updateBullet(BULLET* b) {

	// If active, update else otherwise ignore
	if (b->active) {
		if (b->row + b->height-1 >= 0
            && b->col + b->cdel > 0
            && b->col + b->cdel < SCREENWIDTH - 1) {

            b->col += 1;

		} else {
			b->active = 0;
		}
	}
}

// Draw a bullet
void drawBullet(BULLET* b) {

	for (int i = 0; i<BULLETCOUNT; i++) {
	    if(bullets[i].active) {
            shadowOAM[7+i].attr0 = (bullets[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[7+i].attr1 = (bullets[i].col & COLMASK) | ATTR1_TINY;
            shadowOAM[7+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 0);
        } else {
            shadowOAM[7+i].attr0 = ATTR0_HIDE;
        }
	}

}

// Bullet Bar
void drawAmount() {
    shadowOAM[1+30].attr0 = (5 & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[1+30].attr1 = (5 & COLMASK) | ATTR1_TINY;
    shadowOAM[1+30].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 1 + bCounter);

    shadowOAM[1+31].attr0 = (5 & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[1+31].attr1 = (21 & COLMASK) | ATTR1_TINY;
    shadowOAM[1+31].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 1 + bCounter);
    
    shadowOAM[1+32].attr0 = (5 & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[1+32].attr1 = (37 & COLMASK) | ATTR1_TINY;
    shadowOAM[1+32].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 1 + bCounter);
}

//--------------------------CHEAT-CODE------------------------------------------------

void initCheat() {

    cheat.height = 4; 
	cheat.width = 6;  
    cheat.rdel = 1;
    cheat.cdel = 1;

    cheat.active = 0;
    cheat.row = 90;
    cheat.col = MAPWIDTH;
    cheat.aniCounter = 0;
    cheat.curFrame = 0;
    cheat.numFrames = 4;

}

void launchCheat() {
    if (bCounter == 0) {
        cheat.active = 1;
        cheat.col = MAPWIDTH;
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

        //animations
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
        shadowOAM[34].attr0 = (ROWMASK & (cheat.row)) | ATTR0_TALL;
        shadowOAM[34].attr1 = (COLMASK & (cheat.col)) | ATTR1_TINY;
        shadowOAM[34].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(cheat.curFrame, 12);
    } else {
        shadowOAM[34].attr0 = ATTR0_HIDE;
    }

}

//--------------------------DOGGOS-CODE-----------------------------------------------

void initDoggo() {
    for(int i = 0; i < DOGGOCOUNT; i++) {
        doggo[i].height = 16;
        doggo[i].width = 16;
        doggo[i].row = SCREENHEIGHT - 41;
        doggo[i].col = MAPWIDTH;
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

    //on screen doggo
    if(d->active) {
        if(d->col > 1) { 
            d->col--;
        }

        if(d->col == 2) {
            d->active = 0;
            d->col = MAPWIDTH;
        }

        //shot and doggo collision
        for (int i = 0; i < BULLETCOUNT; i++) {
            if(bullets[i].active && collision(d->col - hOff, d->row, d->width, d->height, bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height)) { //if doggo collides with player bullet
                bullets[i].active = 0;
                d->health = 0;
                score++;
            } 
        }
        if(d->health <= 0) { //delete enemy
            
            d->active = 0;
            d->col = MAPWIDTH;
            d->health = 1;
        }

        //if player collides with doggo
        if(collision(d->col, d->row, d->width, d->height, blob.col, blob.row, blob.width, blob.height)) {
            loserState = 1;
        } 

        //animations
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

// Draw the doggos
void drawDoggo(DOGGO *d) {
    for (int i = 0; i<DOGGOCOUNT; i++) {
        if (doggo[i].active) {
            shadowOAM[2+i].attr0 = (ROWMASK & (doggo[i].row - vOff)) | ATTR0_SQUARE;
            shadowOAM[2+i].attr1 = (COLMASK & (doggo[i].col - hOff)) | ATTR1_SMALL;
            shadowOAM[2+i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(doggo[i].curFrame*2, 6);
        } else {
            shadowOAM[2+i].attr0 = ATTR0_HIDE;
        }
    }
}

//--------------------------SCORE-CODE-----------------------------------------------

void drawScore() {
    shadowOAM[37].attr0 = (ROWMASK & (5)) | ATTR0_SQUARE;
    shadowOAM[37].attr1 = (COLMASK & (190)) | ATTR1_SMALL;
    shadowOAM[37].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(((score%100)/10)*2, 14);

    shadowOAM[38].attr0 = (ROWMASK & (5)) | ATTR0_SQUARE;
    shadowOAM[38].attr1 = (COLMASK & (204)) | ATTR1_SMALL;
    shadowOAM[38].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((score%10)*2, 14);
}