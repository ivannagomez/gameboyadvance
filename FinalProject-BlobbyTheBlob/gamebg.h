
//{{BLOCK(gamebg)

//======================================================================
//
//	gamebg, 512x256@8, 
//	+ palette 256 entries, not compressed
//	+ 814 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 52096 + 4096 = 56704
//
//	Time-stamp: 2021-05-03, 01:30:14
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG_H
#define GRIT_GAMEBG_H

#define gamebgTilesLen 52096
extern const unsigned short gamebgTiles[26048];

#define gamebgMapLen 4096
extern const unsigned short gamebgMap[2048];

#define gamebgPalLen 512
extern const unsigned short gamebgPal[256];

#endif // GRIT_GAMEBG_H

//}}BLOCK(gamebg)
