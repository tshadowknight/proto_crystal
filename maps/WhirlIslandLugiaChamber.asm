	const_def 2 ; object constants
	const WHIRLISLANDLUGIACHAMBER_ZAPDOS
	const WHIRLISLANDLUGIACHAMBER_MOLTRES
	const WHIRLISLANDLUGIACHAMBER_ARTICUNO

WhirlIslandLugiaChamber_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED
	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .checkVisible

.DummyScene0:
	end

.DummyScene1:
	end	
		
.checkVisible:
	scall .Zapdos
	scall .Moltres
	scall .Articuno
	return	

.Zapdos:
	checkevent EVENT_FOUGHT_ZAPDOS
	iftrue .NoAppearZapdos
	checkitem SILVER_WING
	iftrue .AppearZapdos
	scall .NoAppearZapdos
	return 

.AppearZapdos:
	appear WHIRLISLANDLUGIACHAMBER_ZAPDOS
	return

.NoAppearZapdos:
	disappear WHIRLISLANDLUGIACHAMBER_ZAPDOS
	return	

.Moltres:
	checkevent EVENT_FOUGHT_MOLTRES
	iftrue .NoAppearMoltres
	checkitem SILVER_WING
	iftrue .AppearMoltres
	scall .NoAppearMoltres
	return 

.AppearMoltres:
	appear WHIRLISLANDLUGIACHAMBER_MOLTRES
	return

.NoAppearMoltres:
	disappear WHIRLISLANDLUGIACHAMBER_MOLTRES
	return
	
.Articuno:
	checkevent EVENT_FOUGHT_ARTICUNO
	iftrue .NoAppearArticuno
	checkitem SILVER_WING
	iftrue .AppearArticuno
	scall .NoAppearArticuno
	return 

.AppearArticuno:
	appear WHIRLISLANDLUGIACHAMBER_ARTICUNO
	return

.NoAppearArticuno:
	disappear WHIRLISLANDLUGIACHAMBER_ARTICUNO
	return	

Zapdos:
	faceplayer
	opentext
	writetext BirbText
	cry ZAPDOS
	pause 15
	closetext
	setevent EVENT_FOUGHT_ZAPDOS
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon ZAPDOS, 60
	 
	startbattle
	disappear WHIRLISLANDLUGIACHAMBER_ZAPDOS
	reloadmapafterbattle
	end		
	
Moltres:
	faceplayer
	opentext
	writetext BirbText
	cry MOLTRES
	pause 15
	closetext
	setevent EVENT_FOUGHT_MOLTRES
	;setevent EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_MOLTRES
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon MOLTRES, 60
	startbattle
	disappear WHIRLISLANDLUGIACHAMBER_MOLTRES
	reloadmapafterbattle
	end	
	
Articuno:
	faceplayer
	opentext
	writetext BirbText
	cry ARTICUNO
	pause 15
	closetext
	setevent EVENT_FOUGHT_ARTICUNO
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon ARTICUNO, 60
	startbattle
	disappear WHIRLISLANDLUGIACHAMBER_ARTICUNO
	reloadmapafterbattle
	end		

BirbText:
	text "Gyaoo!"
	done
	
CheckSilverWing:
	
	checkitem SILVER_WING
	iftrue .holdingSilverWing
	end 
	
.holdingSilverWing	
	checkevent EVENT_SILVER_SCALE_PLAYER_ALERTED
	iffalse .aStrangePresence
	end
		
.aStrangePresence
	setevent EVENT_SILVER_SCALE_PLAYER_ALERTED
	showemote EMOTE_SHOCK, PLAYER, 15
	cry ARTICUNO
	wait 2
	cry ZAPDOS
	wait 2
	cry MOLTRES
	wait 2
	opentext
	writetext .aStrangePresenceText
	waitbutton
	closetext
	end
	
.aStrangePresenceText
	text "A strange presence"
	line "appears to be"

	para "fixated on the"
	line "SILVER WING in"
	
	para "your BAG."
	done	

WhirlIslandLugiaChamber_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  15, 21, WHIRL_ISLAND_B2F, 3

	db 4 ; coord events
	coord_event  15,  13, $FF, CheckSilverWing
	coord_event  15,  13, $FF, CheckSilverWing
	coord_event  16,  13, $FF, CheckSilverWing
	coord_event  17,  13, $FF, CheckSilverWing

	db 0 ; bg events

	db 3 ; object events
	;
	object_event  15,  8, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, Zapdos, EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_ZAPDOS
	object_event  9,  4, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Moltres, EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_MOLTRES
	object_event  22,  4, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Articuno, EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_ARTICUNO
	;
	
