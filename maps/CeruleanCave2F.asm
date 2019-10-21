	const_def 2


CeruleanCave2F_MapScripts:
	db 0 ; scene scripts
	db 0 ; callbacks

CeruleanCave2F_PPUp:
	itemball PP_UP

CeruleanCave2F_UltraBall:
	itemball ULTRA_BALL

CeruleanCave2F_FullRestore:
	itemball FULL_RESTORE		
	
CeruleanCave2F_MapEvents:
	db 0, 0;
	db 6 ; warp events
	warp_event 35, 5, CERULEAN_CAVE_1F, 2
	warp_event 29, 11, CERULEAN_CAVE_1F, 3
	warp_event 25, 11, CERULEAN_CAVE_1F, 4
	warp_event 15, 5, CERULEAN_CAVE_1F, 5
	warp_event 7, 15, CERULEAN_CAVE_1F, 6
	warp_event 5, 7, CERULEAN_CAVE_1F, 7
	db 0 ; coord events
	
	db 0 ; bg events
	db 3 ; objects events
	object_event  35,  14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2F_PPUp, EVENT_CERULEAN_CAVE_2F_PP_UP
	object_event  19,  10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2F_UltraBall, EVENT_CERULEAN_CAVE_2F_ULTRA_BALL
	object_event  8,  19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2F_FullRestore, EVENT_CERULEAN_CAVE_2F_FULL_RESTORE

