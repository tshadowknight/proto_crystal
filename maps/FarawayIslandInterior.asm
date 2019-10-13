	const_def 2
	const FARAWAY_ISLAND_INTERIOR_MEW 

FarawayIslandInterior_MapScripts:
	db 0 ; scene scripts
	db 0 ; callbacks
	
FarawayIslandInterior_FakeWarp1:
	special FadeOutPalettes
	warpfacing 0, FARAWAY_ISLAND_EXTERIOR, 28, 8 
	end	
	
FarawayIslandInterior_FakeWarp2:
	special FadeOutPalettes
	warpfacing 0, FARAWAY_ISLAND_EXTERIOR, 29, 8 
	end		

Mew:
	faceplayer
	opentext
	writetext MewText
	cry MEW
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEW
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon MEW, 60
	startbattle
	disappear FARAWAY_ISLAND_INTERIOR_MEW
	reloadmapafterbattle
	end		

MewText:
	text "Mew!"
	done	
	
FarawayIslandInterior_MapEvents:
	db 0, 0;
	db 0 ; warp events
	db 2 ; coord events
	coord_event  12,  21, $FF, FarawayIslandInterior_FakeWarp1
	coord_event  13,  21, $FF, FarawayIslandInterior_FakeWarp2
	db 0 ; bg events
	db 1 ; objects events
	object_event  13,  12, SPRITE_MEW_TAIL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Mew, EVENT_FOUGHT_MEW
