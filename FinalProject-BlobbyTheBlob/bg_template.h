
//{{BLOCK(bg_template)

//======================================================================
//
//	bg_template, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 139 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 4448 + 2048 = 7008
//
//	Time-stamp: 2021-04-26, 09:16:23
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG_TEMPLATE_H
#define GRIT_BG_TEMPLATE_H

#define bg_templateTilesLen 4448
extern const unsigned short bg_templateTiles[2224];

#define bg_templateMapLen 2048
extern const unsigned short bg_templateMap[1024];

#define bg_templatePalLen 512
extern const unsigned short bg_templatePal[256];

#endif // GRIT_BG_TEMPLATE_H

//}}BLOCK(bg_template)
