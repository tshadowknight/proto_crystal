	const_def 2


CeruleanCave1F_MapScripts:
	db 0 ; scene scripts
	db 0 ; callbacks

CeruleanCave1F_FullRestore:
	itemball FULL_RESTORE

CeruleanCave1F_MaxElixer:
	itemball MAX_ELIXER

CeruleanCave1F_Nugget:
	itemball NUGGET	
	
CeruleanCave1F_MapEvents:
	db 0, 0;
	db 8 ; warp events
	warp_event 31, 21, CERULEAN_CITY, 7
	warp_event 33, 5, CERULEAN_CAVE_2F, 1
	warp_event 29, 11, CERULEAN_CAVE_2F, 2
	warp_event 23, 13, CERULEAN_CAVE_2F, 3
	warp_event 11, 5, CERULEAN_CAVE_2F, 4
	warp_event 9, 15, CERULEAN_CAVE_2F, 5
	warp_event 5, 7, CERULEAN_CAVE_2F, 6
	warp_event 5, 11, CERULEAN_CAVE_1BF, 1
	
	db 0 ; coord events
	db 0 ; bg events
	db 3 ; objects events
	object_event  13,  17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1F_FullRestore, EVENT_CERULEAN_CAVE_1F_FULL_RESTORE
	object_event  25,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1F_MaxElixer, EVENT_CERULEAN_CAVE_1F_MAX_ELIXER
	object_event  9,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1F_Nugget, EVENT_CERULEAN_CAVE_1F_NUGGET

	
