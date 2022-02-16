
//{{BLOCK(space)

//======================================================================
//
//	space, 768x256@4, 
//	+ palette 256 entries, not compressed
//	+ 609 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 96x32 
//	Total size: 512 + 19488 + 6144 = 26144
//
//	Time-stamp: 2021-05-05, 04:14:59
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SPACE_H
#define GRIT_SPACE_H

#define spaceTilesLen 19488
extern const unsigned short spaceTiles[9744];

#define spaceMapLen 6144
extern const unsigned short spaceMap[3072];

#define spacePalLen 512
extern const unsigned short spacePal[256];

#endif // GRIT_SPACE_H

//}}BLOCK(space)
