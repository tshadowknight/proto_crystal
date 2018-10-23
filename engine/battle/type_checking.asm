
BattleCommand_Stab_:: ; 346d2
; STAB = Same Type Attack Bonus
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	cp STRUGGLE
	ret z

	ld hl, wBattleMonType1
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemyMonType1
	ld a, [hli]
	ld d, a
	ld e, [hl]

	ld a, [hBattleTurn]
	and a
	jr z, .go ; Who Attacks and who Defends

	ld hl, wEnemyMonType1
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wBattleMonType1
	ld a, [hli]
	ld d, a
	ld e, [hl]

.go
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	ld [wTypeMatchup], a

	push hl
	push de
	push bc
	call DoWeatherModifiers
	pop bc
	pop de
	pop hl

	push de
	push bc
	call DoBadgeTypeBoosts
	pop bc
	pop de

	ld a, [wTypeMatchup]
	cp b
	jr z, .stab
	cp c
	jr z, .stab

	jr .SkipStab

.stab
	ld hl, wCurDamage + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a

	ld b, h
	ld c, l
	srl b
	rr c
	add hl, bc

	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a

	ld hl, wTypeModifier
	set 7, [hl]

.SkipStab:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	ld b, a
	ld a, [wOptions2]
	ld hl, TypeMatchupsPrototype
	bit 1, a
	jr z, .TypesLoop
	ld hl, TypeMatchups

.TypesLoop:
	ld a, [hli]

	cp -1
	jr z, .end

	; foresight
	cp -2
	jr nz, .SkipForesightCheck
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	jr nz, .end

	jr .TypesLoop

.SkipForesightCheck:
	cp b
	jr nz, .SkipType
	ld a, [hl]
	cp d
	jr z, .GotMatchup
	cp e
	jr z, .GotMatchup
	jr .SkipType

.GotMatchup:
	push hl
	push bc
	inc hl
	ld a, [wTypeModifier]
	and %10000000
	ld b, a
; If the target is immune to the move, treat it as a miss and calculate the damage as 0
	ld a, [hl]
	and a
	jr nz, .NotImmune
	inc a
	ld [wAttackMissed], a
	xor a
.NotImmune:
	ld [hMultiplier], a
	add b
	ld [wTypeModifier], a

	xor a
	ld [hMultiplicand + 0], a

	ld hl, wCurDamage
	ld a, [hli]
	ld [hMultiplicand + 1], a
	ld a, [hld]
	ld [hMultiplicand + 2], a

	call Multiply

	ld a, [hProduct + 1]
	ld b, a
	ld a, [hProduct + 2]
	or b
	ld b, a
	ld a, [hProduct + 3]
	or b
	jr z, .ok ; This is a very convoluted way to get back that we've essentially dealt no damage.

; Take the product and divide it by 10.
	ld a, 10
	ld [hDivisor], a
	ld b, 4
	call Divide
	ld a, [hQuotient + 1]
	ld b, a
	ld a, [hQuotient + 2]
	or b
	jr nz, .ok

	ld a, 1
	ld [hMultiplicand + 2], a

.ok
	ld a, [hMultiplicand + 1]
	ld [hli], a
	ld a, [hMultiplicand + 2]
	ld [hl], a
	pop bc
	pop hl

.SkipType:
	inc hl
	inc hl
	jr .TypesLoop

.end
	call BattleCheckTypeMatchup_
	ld a, [wTypeMatchup]
	ld b, a
	ld a, [wTypeModifier]
	and %10000000
	or b
	ld [wTypeModifier], a
	ret

; 347c8


BattleCheckTypeMatchup_:: ; 347c8
	ld hl, wEnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, CheckTypeMatchup_
	ld hl, wBattleMonType1
CheckTypeMatchup_:: ; 347d3
; There is an incorrect assumption about this function made in the AI related code: when
; the AI calls CheckTypeMatchup (not BattleCheckTypeMatchup), it assumes that placing the
; offensive type in a will make this function do the right thing. Since a is overwritten,
; this assumption is incorrect. A simple fix would be to load the move type for the
; current move into a in BattleCheckTypeMatchup, before falling through, which is
; consistent with how the rest of the code assumes this code works like.
	push hl
	push de
	push bc
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	ld d, a
	ld b, [hl]
	inc hl
	ld c, [hl]
	ld a, 10 ; 1.0
	ld [wTypeMatchup], a
	ld a, [wOptions2]
	ld hl, TypeMatchupsPrototype
	bit 1, a
	jr z, .TypesLoop
	ld hl, TypeMatchups
.TypesLoop:
	ld a, [hli]
	cp -1
	jr z, .End
	cp -2
	jr nz, .Next
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	jr nz, .End
	jr .TypesLoop

.Next:
	cp d
	jr nz, .Nope
	ld a, [hli]
	cp b
	jr z, .Yup
	cp c
	jr z, .Yup
	jr .Nope2

.Nope:
	inc hl
.Nope2:
	inc hl
	jr .TypesLoop

.Yup:
	xor a
	ld [hDividend + 0], a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, [hli]
	ld [hMultiplicand + 2], a
	ld a, [wTypeMatchup]
	ld [hMultiplier], a
	call Multiply
	ld a, 10
	ld [hDivisor], a
	push bc
	ld b, 4
	call Divide
	pop bc
	ld a, [hQuotient + 2]
	ld [wTypeMatchup], a
	jr .TypesLoop

.End:
	pop bc
	pop de
	pop hl
	ret
	
DoWeatherModifiers: ; fbda4

	ld de, WeatherTypeModifiers
	ld a, [wBattleWeather]
	ld b, a
	ld a, [wd265] ; move type
	ld c, a

.CheckWeatherType:
	ld a, [de]
	inc de
	cp $ff
	jr z, .done_weather_types

	cp b
	jr nz, .NextWeatherType

	ld a, [de]
	cp c
	jr z, .ApplyModifier

.NextWeatherType:
	inc de
	inc de
	jr .CheckWeatherType


.done_weather_types
	ld de, WeatherMoveModifiers

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	ld c, a

.CheckWeatherMove:
	ld a, [de]
	inc de
	cp $ff
	jr z, .done

	cp b
	jr nz, .NextWeatherMove

	ld a, [de]
	cp c
	jr z, .ApplyModifier

.NextWeatherMove:
	inc de
	inc de
	jr .CheckWeatherMove

.ApplyModifier:
	xor a
	ld [hMultiplicand + 0], a
	ld hl, wCurDamage
	ld a, [hli]
	ld [hMultiplicand + 1], a
	ld a, [hl]
	ld [hMultiplicand + 2], a

	inc de
	ld a, [de]
	ld [hMultiplier], a

	call Multiply

	ld a, 10
	ld [hDivisor], a
	ld b, $4
	call Divide

	ld a, [hQuotient + 0]
	and a
	ld bc, -1
	jr nz, .Update

	ld a, [hQuotient + 1]
	ld b, a
	ld a, [hQuotient + 2]
	ld c, a
	or b
	jr nz, .Update

	ld bc, 1

.Update:
	ld a, b
	ld [wCurDamage], a
	ld a, c
	ld [wCurDamage + 1], a

.done
	ret

INCLUDE "data/battle/weather_modifiers.asm"


DoBadgeTypeBoosts: ; fbe24
	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [wInBattleTowerBattle]
	and a
	ret nz

	ld a, [hBattleTurn]
	and a
	ret nz

	push de
	push bc

	ld hl, BadgeTypeBoosts

	ld a, [wKantoBadges]
	ld b, a
	ld a, [wJohtoBadges]
	ld c, a

.CheckBadge:
	ld a, [hl]
	cp -1
	jr z, .done

	srl b
	rr c
	jr nc, .NextBadge

	ld a, [wd265] ; move type
	cp [hl]
	jr z, .ApplyBoost

.NextBadge:
	inc hl
	jr .CheckBadge

.ApplyBoost:
	ld a, [wCurDamage]
	ld h, a
	ld d, a
	ld a, [wCurDamage + 1]
	ld l, a
	ld e, a

	srl d
	rr e
	srl d
	rr e
	srl d
	rr e

	ld a, e
	or d
	jr nz, .done_min
	ld e, 1

.done_min
	add hl, de
	jr nc, .Update

	ld hl, $ffff

.Update:
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a

.done
	pop bc
	pop de
	ret

INCLUDE "data/types/badge_type_boosts.asm"
	