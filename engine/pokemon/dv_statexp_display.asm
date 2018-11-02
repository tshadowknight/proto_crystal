PrintStatLabels:	
    ld de, .label_HP ; hp
    call PlaceString
    
    ld bc, SCREEN_WIDTH
	add hl, bc
    ld de, .label_ATK ; atk
    call PlaceString
    
    ld bc, SCREEN_WIDTH
	add hl, bc
    ld de, .label_DEF ; def
    call PlaceString
    
    ld bc, SCREEN_WIDTH
	add hl, bc
    ld de, .label_SPE ; spe
    call PlaceString
    
    ld bc, SCREEN_WIDTH
	add hl, bc
    ld de, .label_SPC ; spc
    call PlaceString	
	ret	

.label_HP
    db "HP    /15@"
.label_ATK
    db "ATK   /15@"
.label_DEF
    db "DEF   /15@"
.label_SPE
    db "SPE   /15@"
.label_SPC
    db "SPC   /15@"
; by Aurelio Mannara - BitBuilt 2017
; ShockSlayer helped ( °v°)
TN_PrintDVs:
	;store DV source
	ld a, d
	ld [wBuffer3], a 
	ld a, e
	ld [wBuffer4], a
	;store base display coordinates	
	ld a, h
	ld [wBuffer5], a 
	ld a, l
	ld [wBuffer6], a
    ; print labels	    
	ld a, b 
	and a 
	jr z, .printingLabelsDone	
	inc hl
    ld de, .label_DV ; DV
    call PlaceString
	call .getBaseCoordinates
	ld bc, SCREEN_WIDTH
	add hl, bc
	call PrintStatLabels

.printingLabelsDone    
    ; print 16 bit value of DVs
    call .getDVSource
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    push bc
	
    call .getDVSource
    xor a
    ld [de], a
    inc de
    pop bc
    ld a, b
    push bc
    and $f0
    swap a
    ld [de], a
	; print atk
	lb bc, 4, 2 
	call .getOffsetCoordinates 
    lb bc, PRINTNUM_LEADINGZEROS | 2, 2
    call .getDVSource
    call PrintNum

    call .getDVSource
    xor a
    ld [de], a
    inc de
    pop bc
    ld a, b
    push bc
    and $f
    ld [de],a
	; print def
    lb bc, 4, 3
	call .getOffsetCoordinates
    lb bc, PRINTNUM_LEADINGZEROS | 2, 2
    call .getDVSource
    call PrintNum

    call .getDVSource
    xor a
    ld [de], a
    inc de
    pop bc
    ld a, c
    push bc
    and $f0
    swap a
    ld [de], a
	; print speed
    lb bc, 4, 4
	call .getOffsetCoordinates
    lb bc, PRINTNUM_LEADINGZEROS | 2, 2
    call .getDVSource
    call PrintNum

    call .getDVSource
    xor a
    ld [de], a
    inc de
    pop bc
    ld a, c
    push bc
    and $f
    ld [de], a
	; print special
    lb bc, 4, 5
	call .getOffsetCoordinates
    lb bc, PRINTNUM_LEADINGZEROS | 2, 2
    call .getDVSource
    call PrintNum

    call .getDVSource
    xor a
    ld [de], a
    inc de
    pop bc
    bit 4, b
    jr z, .noAttackHP
    set 3, a
.noAttackHP
    bit 0, b
    jr z, .noDefenseHP
    set 2, a
.noDefenseHP
    bit 4, c
    jr z, .noSpeedHP
    set 1, a 
.noSpeedHP
    bit 0, c
    jr z, .noSpecialHP
    set 0, a
.noSpecialHP
    push bc
    ld [de], a
	; print hp
    lb bc, 4, 1
	call .getOffsetCoordinates
    lb bc, PRINTNUM_LEADINGZEROS | 2, 2
    call .getDVSource
    call PrintNum

    call .getDVSource
    pop bc
    ld a, b
    ld [de], a
    inc de
    ld a, c
    ld [de], a
	ret

.label_DV
    db "DVs:@" 
	
.getDVSource
	push af
	ld a, [wBuffer3]
	ld d, a
	ld a, [wBuffer4]
	ld e, a	
	pop af
	ret
	
.getBaseCoordinates
	push af
	ld a, [wBuffer5]
	ld h, a
	ld a, [wBuffer6]
	ld l, a	
	pop af
	ret	
	
.getOffsetCoordinates
	call .getBaseCoordinates
	ld a, b 
.xLoop
	inc hl
	dec a 	
	jr nz, .xLoop
	ld a, c 
	ld bc, SCREEN_WIDTH
.yLoop
	add hl, bc
	dec a 	
	jr nz, .yLoop	
	ret		
	
printStatExp:
	hlcoord 0, 12
    ld de, .label_statExp
    call PlaceString	
	hlcoord 0, 13
	call PrintStatLabels
	
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	hlcoord 4, 13 ; hp disp coords
    ld de, wTempMonHPExp
	call .printStatExpVal
    
	hlcoord 4, 14 ; atk disp coords
    ld de, wTempMonAtkExp
    call .printStatExpVal
	
	hlcoord 4, 15 ; def disp coords
    ld de, wTempMonDefExp
    call .printStatExpVal
	
	hlcoord 4, 16 ; spc disp coords
    ld de, wTempMonSpcExp
    call .printStatExpVal
	
	hlcoord 4, 17 ; spd disp coords
    ld de, wTempMonSpdExp
    call .printStatExpVal
	ret	
	
.printStatExpVal:
	ld a, [de] 
	cp $FF
	jr nz, .printAsNum
	inc de
	ld a, [de]
	dec de
	cp $FF 
	jr nz, .printAsNum	
.printAsMax
	ld de, .label_MAX
	push bc ; keep the print num settings in bc
    call PlaceString	
	pop bc
	jr .done
.printAsNum
    call PrintNum	
.done		
	ret	
	
.label_statExp
	db "sEXP:@"	
	
.label_MAX
	db "-MAX-@"	
	
EditMonDVs:
	call DisableSpriteUpdates
	call ClearSprites
	call ClearBGPalettes
	call WriteDvEditMenuTilemap
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	call DVEditMenu
	ld [wcf65], a
	and a 
	jr z, .playerCancel
	ld a, MON_DVS
	call GetPartyParamLocation	
	ld a, [wBuffer1]
	ld [hli], a 
	ld a, [wBuffer2]
	ld [hl], a
.playerCancel	
	call ReturnToMapWithSpeechTextbox
	ret
	
WriteDvEditMenuTilemap: ; 0x5005f
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill ; blank the tilemap
	ret
	
DVEditMenu:
	xor a 
	ld [wcf64], a
	ld hl, ChooseYourTraining
	call PrintText
	hlcoord 5, 9
    ld de, .label_OK ; def
    call PlaceString
	ld a, MON_DVS
	call GetPartyParamLocation	
	ld a, [hli]
	ld [wBuffer1], a 
	ld a, [hl]
	ld [wBuffer2], a
	
	ld de, wBuffer1	
	hlcoord 5, 3	
	ld b, 1	
	call TN_PrintDVs
	jr .loopRedraw
	
.loopRedrawAll:
	ld de, wBuffer1	
	hlcoord 5, 3	
	ld b, 0	
	call TN_PrintDVs
.loopRedraw:	
	call DelayFrame		
	ld de, .cursorPositions
	ld a, [wcf64]
	ld b, a 
	ld c, 0
.cursorLoop:
	hlcoord 0, 0
	push bc
	inc de
	ld a, [de]
	ld h, a
	dec de
	ld a, [de]
	ld l, a
	inc de
	inc de
	ld bc, wTileMap
	add hl, bc	
	pop bc
	ld a, c
	cp b 
	jr z, .drawCursor
	ld [hl], " "
	jr .endLoop
.drawCursor		
	ld [hl], $ed
.endLoop	
	inc c
	cp 4	
	jr nz, .cursorLoop

.loop: 
	call GetJoypad
	ld a, [hJoyPressed]	
	bit D_DOWN_F, a
	jr nz, .d_down
	bit D_UP_F, a
	jr nz, .d_up
	bit D_LEFT_F, a
	jr nz, .d_left
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit A_BUTTON_F, a 
	jr nz, .a_btn
	bit B_BUTTON_F, a 
	jr nz, .b_btn
	jr .done
.d_down
	ld a, [wcf64]
	cp 4
	jr z, .to_top
	inc a
	jr .d_down_done
.to_top	
	xor a
.d_down_done	
	ld [wcf64], a
	jr .loopRedraw 	
.d_up
	ld a, [wcf64]
	and a
	jr z, .to_bottom
	dec a
	jr .d_up_done
.to_bottom	
	ld a, 4
.d_up_done	
	ld [wcf64], a
	jr .loopRedraw 	
.a_btn	
	ld a, [wcf64]
	ld hl, .aPressFunctions
	rst JumpTable
	and a
	jr z, .done
	jr .finishedEditing
.b_btn	
	ld hl, WantToCancel
	call PrintText
	call YesNoBox
	ld a, 0 ; need to keep carry here
	jr nc, .finishedEditing
	jr .done
.d_left	
	ld a, [wcf64]
	ld hl, .leftPressFunctions
	rst JumpTable
	jp .loopRedrawAll
.d_right
	ld a, [wcf64]
	ld hl, .rightPressFunctions
	rst JumpTable
	jp .loopRedrawAll	
.done	
	jr .loop
	
.finishedEditing	
	ret

.label_OK:
	db "OK@"
	
.stub 
	xor a
	ret 	
	
.aPressFunctions:
	dw .stub
	dw .stub
	dw .stub
	dw .stub
	dw .selectionOK	
	
.selectionOK:
	ld hl, TrainingSelected
	call PrintText
	call YesNoBox
	ld a, 1
jr nc, .playerOK		
	ld hl, ChooseYourTraining
	call PrintText	
	xor a
.playerOK	
	ret
	
.leftPressFunctions:
	dw .leftAtk
	dw .leftDef
	dw .leftSpd
	dw .leftSpc
	dw .stub	

.leftAtk:
	ld a, [wBuffer1]
	ld c, a
	and $f0	
    swap a
	and a 
	jr z, .leftAtkOverflow 
	dec a 
	jr .leftAtkDone
.leftAtkOverflow
	ld a, 15	
.leftAtkDone
	swap a 
	ld b, a 
	ld a, c 
	and $0f
	or b
	ld [wBuffer1], a
	ret	
	
.leftDef:
	ld a, [wBuffer1]
	ld c, a
	and $0f	
	and a 
	jr z, .leftDefOverflow 
	dec a 
	jr .leftDefDone
.leftDefOverflow
	ld a, 15	
.leftDefDone 
	ld b, a 
	ld a, c 
	and $f0
	or b
	ld [wBuffer1], a
	ret	

.leftSpd:
	ld a, [wBuffer2]
	ld c, a
	and $f0	
    swap a
	and a 
	jr z, .leftSpdOverflow 
	dec a 
	jr .leftSpdDone
.leftSpdOverflow
	ld a, 15	
.leftSpdDone
	swap a 
	ld b, a 
	ld a, c 
	and $0f
	or b
	ld [wBuffer2], a
	ret	
	
.leftSpc:
	ld a, [wBuffer2]
	ld c, a
	and $0f	
	and a 
	jr z, .leftSpcOverflow 
	dec a 
	jr .leftSpcDone
.leftSpcOverflow
	ld a, 15	
.leftSpcDone 
	ld b, a 
	ld a, c 
	and $f0
	or b
	ld [wBuffer2], a
	ret		
	
	
.rightPressFunctions:
	dw .rightAtk
	dw .rightDef
	dw .rightSpd
	dw .rightSpc
	dw .stub	

.rightAtk:
	ld a, [wBuffer1]
	ld c, a
	and $f0	
    swap a
	cp 15
	jr z, .rightAtkOverflow 
	inc a 
	jr .rightAtkDone
.rightAtkOverflow
	ld a, 0	
.rightAtkDone
	swap a 
	ld b, a 
	ld a, c 
	and $0f
	or b
	ld [wBuffer1], a
	ret	
	
.rightDef:
	ld a, [wBuffer1]
	ld c, a
	and $0f	
	cp 15 
	jr z, .rightDefOverflow 
	inc a 
	jr .rightDefDone
.rightDefOverflow
	ld a, 0	
.rightDefDone 
	ld b, a 
	ld a, c 
	and $f0
	or b
	ld [wBuffer1], a
	ret	

.rightSpd:
	ld a, [wBuffer2]
	ld c, a
	and $f0	
    swap a
	cp 15
	jr z, .rightSpdOverflow 
	inc a 
	jr .rightSpdDone
.rightSpdOverflow
	ld a, 0	
.rightSpdDone
	swap a 
	ld b, a 
	ld a, c 
	and $0f
	or b
	ld [wBuffer2], a
	ret	
	
.rightSpc:
	ld a, [wBuffer2]
	ld c, a
	and $0f	
	cp 15 
	jr z, .rightSpcOverflow 
	inc a 
	jr .rightSpcDone
.rightSpcOverflow
	ld a, 0	
.rightSpcDone 
	ld b, a 
	ld a, c 
	and $f0
	or b
	ld [wBuffer2], a
	ret			
	
.cursorPositions:
	dw 5 * SCREEN_WIDTH + 4
	dw 6 * SCREEN_WIDTH + 4
	dw 7 * SCREEN_WIDTH + 4
	dw 8 * SCREEN_WIDTH + 4
	dw 9 * SCREEN_WIDTH + 4
   
ChooseYourTraining: ; 0x48e0f
	text "Decide how to"
	line "train, trainer!"
	done
	db "@"
	
TrainingSelected: ; 0x48e0f
	text "Is this to your"
	line "liking, trainer?"
	done
	db "@"	
	
WantToCancel: ; 0x48e0f
	text "Have you changed"
	line "you mind, trainer?"
	done
	db "@"		
	
; 0x48e14	   