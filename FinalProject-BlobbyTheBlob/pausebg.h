
//{{BLOCK(pausebg)

//======================================================================
//
//	pausebg, 512x256@8, 
//	+ palette 256 entries, not compressed
//	+ 324 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 20736 + 4096 = 25344
//
//	Time-stamp: 2021-05-03, 04:16:49
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEBG_H
#define GRIT_PAUSEBG_H

#define pausebgTilesLen 20736
extern const unsigned short pausebgTiles[10368];

#define pausebgMapLen 4096
extern const unsigned short pausebgMap[2048];

#define pausebgPalLen 512
extern const unsigned short pausebgPal[256];

#endif // GRIT_PAUSEBG_H

//}}BLOCK(pausebg)
