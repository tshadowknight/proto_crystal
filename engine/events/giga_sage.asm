_GigaSage: ; fb6ed
; Introduce himself
	ld de, EVENT_GIGA_SAGE_INTRO_GIVEN
	ld b, CHECK_FLAG
	farcall EventFlagAction
	jr nz, .introGiven
	ld de, EVENT_GIGA_SAGE_INTRO_GIVEN
	ld b, SET_FLAG
	farcall EventFlagAction
	ld hl, GigaSageIntroText
	call PrintText	
.introGiven	
	ld hl, GigaSageContinueText
	call PrintText	
	call YesNoBox
	jp c, .cancel
; Select a Pokemon from your party
	ld hl, GigaSageWhichMonText
	call PrintText
	farcall SelectMonFromParty
	jr c, .cancel
; He can't train an egg...
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	ld hl, GigaSageIsGoodText
	call PrintText
	call YesNoBox
	jr c, .cancel
	ld hl, GigaSageLetsBeginText
	call PrintText
	jr .gigaTrain

.gigaTrainingSuccessful	
	ld hl, GigaSageFinishedText	
	jr .done
.cancel
	ld hl, GigaSageCancelText
	jr .done

.egg
	ld hl, GigaSageEggText

.done
	call PrintText
	ret
	
.gigaTrain:
	farcall EditMonDVs
	ld a, [wcf65]
	and a 
	jr z, .cancel
.maxStatExp
	ld a, MON_STAT_EXP
	call GetPartyParamLocation
	ld a, $FF
	ld b, 10
.loop	
	ld [hli], a
	dec b 
	jr nz, .loop
	jr .gigaTrainingSuccessful	

GigaSageIntroText: ; 0xfb80f
	text "Well met,"
	line "young trainer!"
	
	para "I have honed my"
	line "skills here on "
	
	para "Mt. Silver and"
	line "have perfected the"
	
	para "most sacred of"
	line "training methods."
	
	para "GIGA TRAINING!"
	
	para "For the low, low"
	line "price of ¥200,000"
	
	para "you too can make"
	line "one of your"
	
	para "#MON the "
	line "best they can be!"
	prompt
	db "@"
; 0xfb814

GigaSageContinueText: ; 0xfb80f	
	text "Trainer!"
	line "Are you ready to"
	
	cont "start training?"
	done
	db "@"

GigaSageWhichMonText: ; 0xfb814	
	text "Which #MON"
	line "needs training?"	
	prompt	
	db "@"
; 0xfb819

GigaSageIsGoodText: ; 0xfb819
	text "Is this the"
	line "#MON?"	
	done
	db "@"
; 0xfb81e

GigaSageLetsBeginText: ; 0xfb819
	text "Then let us begin!"	
	prompt
	db "@"
	
GigaSageFinishedText: ; 0xfb819
	text "There, the full"	
	line "potential of your"
	
	para "#MON has been"
	line "unlocked!"
	
	para "..."
	line "And we thank you"
	
	para "for your generous"
	line "contribution."	
	done
	db "@"	

GigaSageWhichNameText: ; 0xfb81e
	; All right. What name should we give it, then?
	text_jump UnknownText_0x1c0142
	db "@"
; 0xfb823

GigaSageEvenBetterText: ; 0xfb823
	; That's a better name than before! Well done!
	text_jump UnknownText_0x1c0171
	db "@"
; 0xfb828

GigaSageCancelText: ; 0xfb828
	text "Trainer! I"
	line "shall be waiting!"
	done
	db "@"
; 0xfb82d

GigaSageTradedText: ; 0xfb82d
	; Hm… @ ? What a great name! It's perfect.
	; Treat @ with loving care.
	text_jump UnknownText_0x1c01be
	db "@"
; 0xfb832

GigaSageEggText: ; 0xfb832
	; Whoa… That's just an EGG.	
	text "An EGG cannot"
	line "receive training!"
	done
	db "@"
; 0xfb837

GigaSageSameAsBeforeText: ; 0xfb837
	; It might look the different as before,
	; but this new name is much better! Well done!
	text_jump UnknownText_0x1c0222
	db "@"
; 0xfb83c

GigaSageDoneText: ; 0xfb83c
	; All right. This #MON is now named @ .
	text_jump UnknownText_0x1c0272
	db "@"
; 0xfb841
