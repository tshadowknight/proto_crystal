	const_def 2
	const FARAWAY_ISLAND_EXCITED_SAILOR
	
FarawayIslandExterior_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED
	db 0 ; callbacks
	
.DummyScene0:
	end

.DummyScene1:
	end		
	
FarawayIslandExcitedSailor:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_EXCITED_SAILOR
	iffalse .reallyExcited
	writetext askToReturn
	yesorno
	iffalse .notDone
	writetext headBack
	waitbutton
	closetext
	special FadeOutPalettes
	warp VERMILION_PORT, 15, 11	 
	end	
	
.notDone 
	writetext stayLonger	
	waitbutton
	closetext
	end	
	
.reallyExcited
	writetext excitedSailorReallyExicted
	setevent EVENT_TALKED_TO_EXCITED_SAILOR
	waitbutton
	closetext
	end
	
excitedSailorReallyExicted:
	text "Look at this"
	line "place, no one"
	cont "has been here in"
	cont "years!"
	para "You check things"
	line "out up ahead."
	cont "I'll admire this"
	cont "shoreline a little"
	cont "longer."
	done
	
askToReturn:
	text "Are you done"
	line "exploring?"
	done	
	
stayLonger:
	text "Alright, let's"
	line "stay a little "
	cont "longer!"
	done	
	
headBack:
	text "Alright, let's"
	line "head back for"
	cont "now!"
	done	
	
FadedSign:
	jumptext FadedSignText	
	
FadedSignText:
	text "The sign is too"
	line "faded to read…"	
	done
	
FarawayIslandExterior_FakeWarp1:
	special FadeOutPalettes
	warpfacing 1, FARAWAY_ISLAND_INTERIOR, 12, 20 
	end	
	
FarawayIslandExterior_FakeWarp2:
	special FadeOutPalettes
	warpfacing 1, FARAWAY_ISLAND_INTERIOR, 13, 20 
	end		
	
	
FarawayIslandExterior_MapEvents:
	db 0, 0;
	db 0 ; warp events
	db 2 ; coord events
	coord_event  28,  7, $FF, FarawayIslandExterior_FakeWarp1
	coord_event  29,  7, $FF, FarawayIslandExterior_FakeWarp2
	db 1 ; bg events
	bg_event  17, 43, BGEVENT_READ, FadedSign
	db 1 ; objects events
	object_event 16, 43, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, 2, OBJECTTYPE_SCRIPT, 0, FarawayIslandExcitedSailor, -1