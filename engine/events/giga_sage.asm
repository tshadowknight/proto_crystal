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
	ld hl, .requiredFunds
	ld de, wStringBuffer2
	ld bc, 3
	call CopyBytes
	ld de, wMoney
	ld bc, wStringBuffer2
	farcall CompareMoney
	jr nc, .enoughMoney
	ld hl, NotEnoughMoney 
	jp .done
.enoughMoney:	
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
	ld hl, GigaSageTrainingCommences
	call PrintText
	farcall FadeBlackQuickly
	farcall ReloadSpritesNoPalettes
	ld c, 20
	call DelayFrames
	ld de, SFX_SWORDS_DANCE
	call PlaySFX
	ld c, 60
	call DelayFrames	
	ld de, SFX_SHINE
	call PlaySFX
	ld c, 60
	call DelayFrames
	ld de, SFX_TRANSACTION
	call PlaySFX
	ld c, 60
	call DelayFrames	
	farcall FadeInQuickly	
	ld hl, .requiredFunds
	ld de, wStringBuffer2
	ld bc, 3
	call CopyBytes
	ld bc, wStringBuffer2
	ld de, wMoney
	farcall TakeMoney
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
	
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurSpecies], a
	call GetBaseData
	
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartyLevel], a
	
	ld a, MON_MAXHP
	call GetPartyParamLocation
	push hl	
	ld a, MON_STAT_EXP - 1
	call GetPartyParamLocation
	pop de
	ld b, TRUE
	predef CalcMonStats
	
	ld a, MON_HP
	call GetPartyParamLocation
	ld d, h 
	ld e, l
	
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld a, [hli]
	ld [de], a 
	inc de 
	ld a, [hl]
	ld [de], a		
	
	jp .gigaTrainingSuccessful

.requiredFunds
	db $03, $0D, $40 ; 200000

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
	text "There, the"	
	line "potential of your"
	
	para "#MON has been"
	line "unlocked!"
	
	para "..."
	line "And we thank you"
	
	para "for your generous"
	line "contribution."	
	done
	db "@"	

GigaSageCancelText: ; 0xfb828
	text "Trainer! I"
	line "shall be waiting!"
	done
	db "@"
; 0xfb82d

GigaSageEggText: ; 0xfb832
	; Whoa… That's just an EGG.	
	text "An EGG cannot"
	line "receive training!"
	done
	db "@"
	
NotEnoughMoney:
	; Whoa… That's just an EGG.	
	text "Trainer! Return"
	line "when you have"
	
	cont "sufficient funds!"
	done
	db "@"
	
GigaSageTrainingCommences:
	; Whoa… That's just an EGG.	
	text "The GIGA TRAINING"
	line "starts now!"
	
	prompt
	db "@"	
; 0xfb837
