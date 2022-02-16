
//{{BLOCK(losebg)

//======================================================================
//
//	losebg, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 344 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 22016 + 2048 = 24576
//
//	Time-stamp: 2021-05-05, 04:09:13
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSEBG_H
#define GRIT_LOSEBG_H

#define losebgTilesLen 22016
extern const unsigned short losebgTiles[11008];

#define losebgMapLen 2048
extern const unsigned short losebgMap[1024];

#define losebgPalLen 512
extern const unsigned short losebgPal[256];

#endif // GRIT_LOSEBG_H

//}}BLOCK(losebg)
