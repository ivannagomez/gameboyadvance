
//{{BLOCK(instrbg)

//======================================================================
//
//	instrbg, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 392 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 25088 + 2048 = 27648
//
//	Time-stamp: 2021-05-03, 04:18:59
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRBG_H
#define GRIT_INSTRBG_H

#define instrbgTilesLen 25088
extern const unsigned short instrbgTiles[12544];

#define instrbgMapLen 2048
extern const unsigned short instrbgMap[1024];

#define instrbgPalLen 512
extern const unsigned short instrbgPal[256];

#endif // GRIT_INSTRBG_H

//}}BLOCK(instrbg)
