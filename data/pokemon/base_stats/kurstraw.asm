	db KURSTRAW ; 182

	db  30,  30,  30,  30,  30, 30
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GHOST ; type
	db 255 ; catch rate
	db 10 ; base exp
	db CLEANSE_TAG, CLEANSE_TAG ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/kurstraw/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm
	; end
