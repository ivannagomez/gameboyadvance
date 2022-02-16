// Blob Struct
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

//Bullet Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	int active;
    //int counter;
} BULLET;

//Cheat Struct
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

//Bullet Struct
typedef struct {
    int row; 
    int col;
    int height;
    int width;
    int aniCounter;
    int aniState;
    //int prevAniState;
    int curFrame;
    int numFrames;
    int health;
    int active;
	int hide;
} DOGGO;

// Constants
#define MAPHEIGHT 160
#define MAPWIDTH 498
#define BULLETCOUNT 5
#define DOGGOCOUNT 5

// Variables
extern BULLET bullets[BULLETCOUNT];
extern int hOff;
extern int vOff;
extern int loserState;
extern int gravity;
extern int bCounter;
extern int score;
extern OBJ_ATTR shadowOAM[128];
extern BLOB blob;

// Prototypes
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