
//{{BLOCK(stars)

//======================================================================
//
//	stars, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 58 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1856 + 2048 = 4416
//
//	Time-stamp: 2021-05-03, 03:31:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARS_H
#define GRIT_STARS_H

#define starsTilesLen 1856
extern const unsigned short starsTiles[928];

#define starsMapLen 2048
extern const unsigned short starsMap[1024];

#define starsPalLen 512
extern const unsigned short starsPal[256];

#endif // GRIT_STARS_H

//}}BLOCK(stars)
