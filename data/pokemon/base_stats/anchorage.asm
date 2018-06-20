	db ANCHORAGE ; 181

	db  90,  110,  50,  110, 55,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, STEEL ; type
	db 120 ; catch rate
	db 117 ; base exp
	db NO_ITEM, NO_ITEM ; items.
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/anchorage/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, DRAGONBREATH, RETURN, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, REST, ATTRACT, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM, IRON_TAIL
	; end
