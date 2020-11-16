	const_def 2


CeruleanCave1BF_MapScripts:
	db 0 ; scene scripts
	db 0 ; callbacks
	

Mewtwo:
	faceplayer
	opentext
	writetext MewtwoText
	cry MEWTWO
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEWTWO
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon MEWTWO, 90
	startbattle
	disappear FARAWAY_ISLAND_INTERIOR_MEW
	reloadmapafterbattle
	end		

MewtwoText:
	text "Mew!"
	done	
	

CeruleanCave1BF_UltraBall:
	itemball ULTRA_BALL

CeruleanCave1BF_MaxRevive:
	itemball MAX_REVIVE		

	
CeruleanCave1BF_MapEvents:
	db 0, 0;
	db 1 ; warp events
	warp_event 7, 9, CERULEAN_CAVE_1F, 8
	db 0 ; coord events
	db 0 ; bg events
	db 3 ; objects events
	object_event  33,  17, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Mewtwo, EVENT_FOUGHT_MEWTWO
	object_event  22,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1BF_UltraBall, EVENT_CERULEAN_CAVE_1BF_ULTRA_BALL
	object_event  20,  13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1BF_MaxRevive, EVENT_CERULEAN_CAVE_1BF_MAX_REVIVE


