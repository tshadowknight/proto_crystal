	db LYKWYSE ; 188

	db  84,  84,  84,  84, 84,  84
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 20 ; catch rate
	db 255 ; base exp
	db NO_ITEM, NO_ITEM ; items.
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/lykwyse/front.dimensions"
	db 0, 0, 0, 0 ; padding
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_DITTO, EGG_DITTO ; egg groups

	; tm/hm learnset
	tmhm 
	; end
