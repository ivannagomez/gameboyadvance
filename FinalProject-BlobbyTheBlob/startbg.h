
//{{BLOCK(startbg)

//======================================================================
//
//	startbg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 54 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1728 + 2048 = 4288
//
//	Time-stamp: 2021-05-04, 20:32:27
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTBG_H
#define GRIT_STARTBG_H

#define startbgTilesLen 1728
extern const unsigned short startbgTiles[864];

#define startbgMapLen 2048
extern const unsigned short startbgMap[1024];

#define startbgPalLen 512
extern const unsigned short startbgPal[256];

#endif // GRIT_STARTBG_H

//}}BLOCK(startbg)
