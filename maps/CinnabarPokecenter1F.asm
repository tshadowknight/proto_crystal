	const_def 2 ; object constants
	const CINNABARPOKECENTER1F_NURSE
	const CINNABARPOKECENTER1F_COOLTRAINER_F
	const CINNABARPOKECENTER1F_FISHER

CinnabarPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CinnabarPokecenter1FNurseScript:
	jumpstd pokecenternurse

CinnabarPokecenter1FCooltrainerFScript:
	jumptextfaceplayer CinnabarPokecenter1FCooltrainerFText

CinnabarPokecenter1FFisherScript:
	jumptextfaceplayer CinnabarPokecenter1FFisherText

CinnabarPokecenter1FCooltrainerFText:
	text "CINNABAR GYM's"
	line "BLAINE apparently"

	para "lives alone in the"
	line "SEAFOAM ISLANDS"
	cont "cave…"
	done

CinnabarPokecenter1FFisherText:
	text "It's been a year"
	line "since the volcano"
	cont "erupted."
	done
	

RevivalGuy:
	clearevent EVENT_OUT_OF_FOSSIL_SPACE
	faceplayer
	opentext
	checkevent EVENT_GOT_REVIVAL_GUY_INTRO
	iftrue .introGiven
	writetext RevivalGuyIntro		
	waitbutton
	setevent EVENT_GOT_REVIVAL_GUY_INTRO
.introGiven:	
	checkevent EVENT_TOOK_KABUTO
	iftrue .kabutoReceived
	scall .giveKabuto
	checkevent EVENT_OUT_OF_FOSSIL_SPACE
	iftrue .omanyteReceived
.kabutoReceived:	
	checkevent EVENT_TOOK_OMANYTE
	iftrue .omanyteReceived
	scall .giveOmanyte	
.omanyteReceived:
	checkevent EVENT_TOOK_KABUTO
	iffalse .comebackLater
	checkevent EVENT_TOOK_OMANYTE
	iffalse .comebackLater
	writetext RevivalGuyOutro		
	waitbutton	
	closetext
	end
	
.comebackLater:
	writetext RevivalGuyComeBackLater
	waitbutton
	closetext
	end
	
.giveKabuto:
	writetext RevivalGuyAskKabuto
	yesorno 
	iffalse .declinedKabuto	
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .revivalGuyNoRoom
	setevent EVENT_TOOK_KABUTO
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke KABUTO, 40
.declinedKabuto	
	return	
	
.giveOmanyte:
	writetext RevivalGuyAskOmanyte
	yesorno 
	iffalse .declinedOmanyte	
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .revivalGuyNoRoom
	setevent EVENT_TOOK_OMANYTE
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke OMANYTE, 40
.declinedOmanyte
	return		
	
.revivalGuyNoRoom:
	setevent EVENT_OUT_OF_FOSSIL_SPACE	
	writetext RevivalGuyNoRoom	
	waitbutton
	end
	
RevivalGuyAskKabuto:
	text "Take KABUTO?"
	done	

RevivalGuyAskOmanyte:	
	text "Take OMANYTE?"
	done	
	
RevivalGuyIntro	
	text "I used to be"
	line "important doctor,"
	cont "but then island"
	cont "went kaboom!"
	para "At least I save"
	line "fossil from"
	cont "destruction."
	para "You seem like"
	line "reliable trainer."
	cont "Would you raise"
	cont "these fossil?"
	cont "You can take both."
	done
	
RevivalGuyOutro	
	text "I no longer have"
	line "any fossil."
	cont "Maybe I should go"
	cont "to home region…"
	done	
	
RevivalGuyComeBackLater:
	text "I still have"
	line "fossil for you."
	cont "Come back to get"
	cont "any time."
	done
	
RevivalGuyNoRoom:
	text "You do not have"
	line "room for fossil."
	done		

CinnabarPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CINNABAR_ISLAND, 1
	warp_event  4,  7, CINNABAR_ISLAND, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenter1FCooltrainerFScript, -1
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenter1FFisherScript, -1
	object_event 7, 5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RevivalGuy, -1
