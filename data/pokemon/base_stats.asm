tmhm: MACRO
; used in data/pokemon/base_stats/*.asm
tms1 = 0 ; TM01-TM24 (24)
tms2 = 0 ; TM25-TM48 (24)
tms3 = 0 ; TM49-TM50 + HM01-HM07 + MT01-MT03 (12/24)
rept _NARG
	if DEF(\1_TMNUM)
	if \1_TMNUM < 24 + 1
tms1 = tms1 | (1 << ((\1_TMNUM) - 1))
	elif \1_TMNUM < 48 + 1
tms2 = tms2 | (1 << ((\1_TMNUM) - 1 - 24))
	else
tms3 = tms3 | (1 << ((\1_TMNUM) - 1 - 48))
	endc
	else
		fail "\1 is not a TM, HM, or move tutor move"
	endc
	shift
endr
rept 3 ; TM01-TM24 (24/24)
	db tms1 & $ff
tms1 = tms1 >> 8
endr
rept 3 ; TM25-TM48 (24/24)
	db tms2 & $ff
tms2 = tms2 >> 8
endr
rept 2 ; TM49-TM50 + HM01-HM07 + MT01-MT03 (12/16)
	db tms3 & $ff
tms3 = tms3 >> 8
endr
ENDM

BaseData::
INCLUDE "data/pokemon/base_stats/bulbasaur.asm"	;1
INCLUDE "data/pokemon/base_stats/ivysaur.asm"	;2
INCLUDE "data/pokemon/base_stats/venusaur.asm"	;3
INCLUDE "data/pokemon/base_stats/charmander.asm"	;4
INCLUDE "data/pokemon/base_stats/charmeleon.asm"	;5
INCLUDE "data/pokemon/base_stats/charizard.asm"	;6
INCLUDE "data/pokemon/base_stats/squirtle.asm"	;7
INCLUDE "data/pokemon/base_stats/wartortle.asm"	;8
INCLUDE "data/pokemon/base_stats/blastoise.asm"	;9
INCLUDE "data/pokemon/base_stats/caterpie.asm"	;10
INCLUDE "data/pokemon/base_stats/metapod.asm"	;11
INCLUDE "data/pokemon/base_stats/butterfree.asm"	;12
INCLUDE "data/pokemon/base_stats/weedle.asm"	;13
INCLUDE "data/pokemon/base_stats/kakuna.asm"	;14
INCLUDE "data/pokemon/base_stats/beedrill.asm"	;15
INCLUDE "data/pokemon/base_stats/pidgey.asm"	;16
INCLUDE "data/pokemon/base_stats/pidgeotto.asm"	;17
INCLUDE "data/pokemon/base_stats/pidgeot.asm"	;18
INCLUDE "data/pokemon/base_stats/rattata.asm"	;19
INCLUDE "data/pokemon/base_stats/raticate.asm"	;20
INCLUDE "data/pokemon/base_stats/spearow.asm"	;21
INCLUDE "data/pokemon/base_stats/fearow.asm"	;22
INCLUDE "data/pokemon/base_stats/ekans.asm"	;23
INCLUDE "data/pokemon/base_stats/arbok.asm"	;24
INCLUDE "data/pokemon/base_stats/pikachu.asm"	;25
INCLUDE "data/pokemon/base_stats/raichu.asm"	;26
INCLUDE "data/pokemon/base_stats/sandshrew.asm"	;27
INCLUDE "data/pokemon/base_stats/sandslash.asm"	;28
INCLUDE "data/pokemon/base_stats/nidoran_f.asm"	;29
INCLUDE "data/pokemon/base_stats/nidorina.asm"	;30
INCLUDE "data/pokemon/base_stats/nidoqueen.asm"	;31
INCLUDE "data/pokemon/base_stats/nidoran_m.asm"	;32
INCLUDE "data/pokemon/base_stats/nidorino.asm"	;33
INCLUDE "data/pokemon/base_stats/nidoking.asm"	;34
INCLUDE "data/pokemon/base_stats/clefairy.asm"	;35
INCLUDE "data/pokemon/base_stats/clefable.asm"	;36
INCLUDE "data/pokemon/base_stats/vulpix.asm"	;37
INCLUDE "data/pokemon/base_stats/ninetales.asm"	;38
INCLUDE "data/pokemon/base_stats/jigglypuff.asm"	;39
INCLUDE "data/pokemon/base_stats/wigglytuff.asm"	;40
INCLUDE "data/pokemon/base_stats/zubat.asm"	;41
INCLUDE "data/pokemon/base_stats/golbat.asm"	;42
INCLUDE "data/pokemon/base_stats/oddish.asm"	;43
INCLUDE "data/pokemon/base_stats/gloom.asm"	;44
INCLUDE "data/pokemon/base_stats/vileplume.asm"	;45
INCLUDE "data/pokemon/base_stats/paras.asm"	;46
INCLUDE "data/pokemon/base_stats/parasect.asm"	;47
INCLUDE "data/pokemon/base_stats/venonat.asm"	;48
INCLUDE "data/pokemon/base_stats/venomoth.asm"	;49
INCLUDE "data/pokemon/base_stats/diglett.asm"	;50
INCLUDE "data/pokemon/base_stats/dugtrio.asm"	;51
INCLUDE "data/pokemon/base_stats/meowth.asm"	;52
INCLUDE "data/pokemon/base_stats/persian.asm"	;53
INCLUDE "data/pokemon/base_stats/psyduck.asm"	;54
INCLUDE "data/pokemon/base_stats/golduck.asm"	;55
INCLUDE "data/pokemon/base_stats/mankey.asm"	;56
INCLUDE "data/pokemon/base_stats/primeape.asm"	;57
INCLUDE "data/pokemon/base_stats/growlithe.asm"	;58
INCLUDE "data/pokemon/base_stats/arcanine.asm"	;59
INCLUDE "data/pokemon/base_stats/poliwag.asm"	;60
INCLUDE "data/pokemon/base_stats/poliwhirl.asm"	;61
INCLUDE "data/pokemon/base_stats/poliwrath.asm"	;62
INCLUDE "data/pokemon/base_stats/abra.asm"	;63
INCLUDE "data/pokemon/base_stats/kadabra.asm"	;64
INCLUDE "data/pokemon/base_stats/alakazam.asm"	;65
INCLUDE "data/pokemon/base_stats/machop.asm"	;66
INCLUDE "data/pokemon/base_stats/machoke.asm"	;67
INCLUDE "data/pokemon/base_stats/machamp.asm"	;68
INCLUDE "data/pokemon/base_stats/bellsprout.asm"	;69
INCLUDE "data/pokemon/base_stats/weepinbell.asm"	;70
INCLUDE "data/pokemon/base_stats/victreebel.asm"	;71
INCLUDE "data/pokemon/base_stats/tentacool.asm"	;72
INCLUDE "data/pokemon/base_stats/tentacruel.asm"	;73
INCLUDE "data/pokemon/base_stats/geodude.asm"	;74
INCLUDE "data/pokemon/base_stats/graveler.asm"	;75
INCLUDE "data/pokemon/base_stats/golem.asm"	;76
INCLUDE "data/pokemon/base_stats/ponyta.asm"	;77
INCLUDE "data/pokemon/base_stats/rapidash.asm"	;78
INCLUDE "data/pokemon/base_stats/slowpoke.asm"	;79
INCLUDE "data/pokemon/base_stats/slowbro.asm"	;80
INCLUDE "data/pokemon/base_stats/magnemite.asm"	;81
INCLUDE "data/pokemon/base_stats/magneton.asm"	;82
INCLUDE "data/pokemon/base_stats/farfetch_d.asm"	;83
INCLUDE "data/pokemon/base_stats/doduo.asm"	;84
INCLUDE "data/pokemon/base_stats/dodrio.asm"	;85
INCLUDE "data/pokemon/base_stats/seel.asm"	;86
INCLUDE "data/pokemon/base_stats/dewgong.asm"	;87
INCLUDE "data/pokemon/base_stats/grimer.asm"	;88
INCLUDE "data/pokemon/base_stats/muk.asm"	;89
INCLUDE "data/pokemon/base_stats/shellder.asm"	;90
INCLUDE "data/pokemon/base_stats/cloyster.asm"	;91
INCLUDE "data/pokemon/base_stats/gastly.asm"	;92
INCLUDE "data/pokemon/base_stats/haunter.asm"	;93
INCLUDE "data/pokemon/base_stats/gengar.asm"	;94
INCLUDE "data/pokemon/base_stats/onix.asm"	;95
INCLUDE "data/pokemon/base_stats/drowzee.asm"	;96
INCLUDE "data/pokemon/base_stats/hypno.asm"	;97
INCLUDE "data/pokemon/base_stats/krabby.asm"	;98
INCLUDE "data/pokemon/base_stats/kingler.asm"	;99
INCLUDE "data/pokemon/base_stats/voltorb.asm"	;100
INCLUDE "data/pokemon/base_stats/electrode.asm"	;101
INCLUDE "data/pokemon/base_stats/exeggcute.asm"	;102
INCLUDE "data/pokemon/base_stats/exeggutor.asm"	;103
INCLUDE "data/pokemon/base_stats/cubone.asm"	;104
INCLUDE "data/pokemon/base_stats/marowak.asm"	;105
INCLUDE "data/pokemon/base_stats/hitmonlee.asm"	;106
INCLUDE "data/pokemon/base_stats/hitmonchan.asm"	;107
INCLUDE "data/pokemon/base_stats/lickitung.asm"	;108
INCLUDE "data/pokemon/base_stats/koffing.asm"	;109
INCLUDE "data/pokemon/base_stats/weezing.asm"	;110
INCLUDE "data/pokemon/base_stats/rhyhorn.asm"	;111
INCLUDE "data/pokemon/base_stats/rhydon.asm"	;112
INCLUDE "data/pokemon/base_stats/chansey.asm"	;113
INCLUDE "data/pokemon/base_stats/tangela.asm"	;114
INCLUDE "data/pokemon/base_stats/kangaskhan.asm"	;115
INCLUDE "data/pokemon/base_stats/horsea.asm"	;116
INCLUDE "data/pokemon/base_stats/seadra.asm"	;117
INCLUDE "data/pokemon/base_stats/goldeen.asm"	;118
INCLUDE "data/pokemon/base_stats/seaking.asm"	;119
INCLUDE "data/pokemon/base_stats/staryu.asm"	;120
INCLUDE "data/pokemon/base_stats/starmie.asm"	;121
INCLUDE "data/pokemon/base_stats/mr__mime.asm"	;122
INCLUDE "data/pokemon/base_stats/scyther.asm"	;123
INCLUDE "data/pokemon/base_stats/jynx.asm"	;124
INCLUDE "data/pokemon/base_stats/electabuzz.asm"	;125
INCLUDE "data/pokemon/base_stats/magmar.asm"	;126
INCLUDE "data/pokemon/base_stats/pinsir.asm"	;127
INCLUDE "data/pokemon/base_stats/tauros.asm"	;128
INCLUDE "data/pokemon/base_stats/magikarp.asm"	;129
INCLUDE "data/pokemon/base_stats/gyarados.asm"	;130
INCLUDE "data/pokemon/base_stats/lapras.asm"	;131
INCLUDE "data/pokemon/base_stats/ditto.asm"	;132
INCLUDE "data/pokemon/base_stats/eevee.asm"	;133
INCLUDE "data/pokemon/base_stats/vaporeon.asm"	;134
INCLUDE "data/pokemon/base_stats/jolteon.asm"	;135
INCLUDE "data/pokemon/base_stats/flareon.asm"	;136
INCLUDE "data/pokemon/base_stats/porygon.asm"	;137
INCLUDE "data/pokemon/base_stats/omanyte.asm"	;138
INCLUDE "data/pokemon/base_stats/omastar.asm"	;139
INCLUDE "data/pokemon/base_stats/kabuto.asm"	;140
INCLUDE "data/pokemon/base_stats/kabutops.asm"	;141
INCLUDE "data/pokemon/base_stats/aerodactyl.asm"	;142
INCLUDE "data/pokemon/base_stats/snorlax.asm"	;143
INCLUDE "data/pokemon/base_stats/articuno.asm"	;144
INCLUDE "data/pokemon/base_stats/zapdos.asm"	;145
INCLUDE "data/pokemon/base_stats/moltres.asm"	;146
INCLUDE "data/pokemon/base_stats/dratini.asm"	;147
INCLUDE "data/pokemon/base_stats/dragonair.asm"	;148
INCLUDE "data/pokemon/base_stats/dragonite.asm"	;149
INCLUDE "data/pokemon/base_stats/mewtwo.asm"	;150
INCLUDE "data/pokemon/base_stats/mew.asm"	;151

INCLUDE "data/pokemon/base_stats/leef.asm"	;152 - chikorita
INCLUDE "data/pokemon/base_stats/blossomole.asm"	;153 - bayleef
INCLUDE "data/pokemon/base_stats/blossomite.asm"	;154 - meganium
INCLUDE "data/pokemon/base_stats/flambear.asm"	;155 - cyndaquil
INCLUDE "data/pokemon/base_stats/volbear.asm"	;156 - quilava
INCLUDE "data/pokemon/base_stats/dynabear.asm"	;157 - typhlosion
INCLUDE "data/pokemon/base_stats/cruz.asm"	;158 - totodile
INCLUDE "data/pokemon/base_stats/aqua.asm"	;159 - croconaw
INCLUDE "data/pokemon/base_stats/aquaria.asm"	;160 - feraligatr
INCLUDE "data/pokemon/base_stats/hoothoot.asm"	;161 - sentret
INCLUDE "data/pokemon/base_stats/hoohoo.asm"	;162 - furret
INCLUDE "data/pokemon/base_stats/mareep.asm"	;163 - hoothoot
INCLUDE "data/pokemon/base_stats/flaaffy.asm"	;164 - noctowl
INCLUDE "data/pokemon/base_stats/ampharos.asm"	;165 - ledyba
INCLUDE "data/pokemon/base_stats/trifox.asm"	;166 - ledian
INCLUDE "data/pokemon/base_stats/tangel.asm"	;167 - spinarak
INCLUDE "data/pokemon/base_stats/gelanla.asm"	;168 - ariados
INCLUDE "data/pokemon/base_stats/rayleep.asm"	;169 - crobat
INCLUDE "data/pokemon/base_stats/qwilfish.asm"	;170 - chinchou
INCLUDE "data/pokemon/base_stats/numpuff.asm"	;171 - lanturn
INCLUDE "data/pokemon/base_stats/pichu.asm"	;172 - pichu
INCLUDE "data/pokemon/base_stats/cleffa.asm"	;173 - cleffa
INCLUDE "data/pokemon/base_stats/igglybuff.asm"	;174 - igglybuff
INCLUDE "data/pokemon/base_stats/quagsire.asm"	;175 - togepi
INCLUDE "data/pokemon/base_stats/natu.asm"	;176 - togetic
INCLUDE "data/pokemon/base_stats/xatu.asm"	;177 - natu
INCLUDE "data/pokemon/base_stats/golppy.asm"	;178 - xatu
INCLUDE "data/pokemon/base_stats/marill.asm"	;179 - mareep
INCLUDE "data/pokemon/base_stats/sunmola.asm"	;180 - flaaffy
INCLUDE "data/pokemon/base_stats/anchorage.asm"	;181 - ampharos
INCLUDE "data/pokemon/base_stats/grotess.asm"	;182 - bellossom
INCLUDE "data/pokemon/base_stats/crobat.asm"	;183 - marill
INCLUDE "data/pokemon/base_stats/para.asm"	;184 - azumarill
INCLUDE "data/pokemon/base_stats/spinarak.asm"	;185 - sudowoodo
INCLUDE "data/pokemon/base_stats/ariados.asm"	;186 - politoed
INCLUDE "data/pokemon/base_stats/skarmory.asm"	;187 - hoppip
INCLUDE "data/pokemon/base_stats/lykwyse.asm"	;188 - skiploom
INCLUDE "data/pokemon/base_stats/douno.asm"	;189 - jumpluff
INCLUDE "data/pokemon/base_stats/sunflora.asm"	;190 - aipom
INCLUDE "data/pokemon/base_stats/phanpy.asm"	;191 - sunkern
INCLUDE "data/pokemon/base_stats/donphan.asm"	;192 - sunflora
INCLUDE "data/pokemon/base_stats/twinz.asm"	;193 - yanma
INCLUDE "data/pokemon/base_stats/girafarig.asm"	;194 - wooper
INCLUDE "data/pokemon/base_stats/smeargle.asm"	;195 - quagsire
INCLUDE "data/pokemon/base_stats/meowsy.asm"	;196 - espeon
INCLUDE "data/pokemon/base_stats/rinring.asm"	;197 - umbreon
INCLUDE "data/pokemon/base_stats/bellboyant.asm"	;198 - murkrow
INCLUDE "data/pokemon/base_stats/politoed.asm"	;199 - slowking
INCLUDE "data/pokemon/base_stats/slowking.asm"	;200 - misdreavus
INCLUDE "data/pokemon/base_stats/unown.asm"	;201 - unown
INCLUDE "data/pokemon/base_stats/ledyba.asm"	;202 - wobbuffet
INCLUDE "data/pokemon/base_stats/tripstar.asm"	;203 - girafarig
INCLUDE "data/pokemon/base_stats/minicorn.asm"	;204 - pineco
INCLUDE "data/pokemon/base_stats/espeon.asm"	;205 - forretress
INCLUDE "data/pokemon/base_stats/umbreon.asm"	;206 - dunsparce
INCLUDE "data/pokemon/base_stats/turbann.asm"	;207 - gligar
INCLUDE "data/pokemon/base_stats/grimey.asm"	;208 - steelix
INCLUDE "data/pokemon/base_stats/remoraid.asm"	;209 - snubbull
INCLUDE "data/pokemon/base_stats/octillery.asm"	;210 - granbull
INCLUDE "data/pokemon/base_stats/gohng.asm"	;211 - qwilfish
INCLUDE "data/pokemon/base_stats/hitmontop.asm"	;212 - scizor
INCLUDE "data/pokemon/base_stats/puddi.asm"	;213 - shuckle
INCLUDE "data/pokemon/base_stats/lefmew.asm"	;214 - heracross
INCLUDE "data/pokemon/base_stats/dandemew.asm"	;215 - sneasel
INCLUDE "data/pokemon/base_stats/cottomew.asm"	;216 - teddiursa
INCLUDE "data/pokemon/base_stats/ballerine.asm"	;217 - ursaring
INCLUDE "data/pokemon/base_stats/smoochum.asm"	;218 - slugma
INCLUDE "data/pokemon/base_stats/elekid.asm"	;219 - magcargo
INCLUDE "data/pokemon/base_stats/magby.asm"	;220 - swinub
INCLUDE "data/pokemon/base_stats/bellossom.asm"	;221 - piloswine
INCLUDE "data/pokemon/base_stats/belmitt.asm"	;222 - corsola
INCLUDE "data/pokemon/base_stats/miltank.asm"	;223 - remoraid
INCLUDE "data/pokemon/base_stats/bomseel.asm"	;224 - octillery
INCLUDE "data/pokemon/base_stats/delibird.asm"	;225 - delibird
INCLUDE "data/pokemon/base_stats/kotora.asm"	;226 - mantine
INCLUDE "data/pokemon/base_stats/raitora.asm"	;227 - skarmory
INCLUDE "data/pokemon/base_stats/madame.asm"	;228 - houndour
INCLUDE "data/pokemon/base_stats/kurstraw.asm"	;229 - houndoom
INCLUDE "data/pokemon/base_stats/pangshi.asm"	;230 - kingdra
INCLUDE "data/pokemon/base_stats/murkrow.asm"	;231 - phanpy
INCLUDE "data/pokemon/base_stats/blissey.asm"	;232 - donphan
INCLUDE "data/pokemon/base_stats/scizor.asm"	;233 - porygon2
INCLUDE "data/pokemon/base_stats/plux.asm"	;234 - stantler
INCLUDE "data/pokemon/base_stats/houndour.asm"	;235 - smeargle
INCLUDE "data/pokemon/base_stats/houndoom.asm"	;236 - tyrogue
INCLUDE "data/pokemon/base_stats/wolfman.asm"	;237 - hitmontop
INCLUDE "data/pokemon/base_stats/warwolf.asm"	;238 - smoochum
INCLUDE "data/pokemon/base_stats/porygon2.asm"	;239 - elekid
INCLUDE "data/pokemon/base_stats/likk.asm"	;240 - magby
INCLUDE "data/pokemon/base_stats/steelix.asm"	;241 - miltank
INCLUDE "data/pokemon/base_stats/kingdra.asm"	;242 - blissey
INCLUDE "data/pokemon/base_stats/rai.asm"	;243 - raikou
INCLUDE "data/pokemon/base_stats/en.asm"	;244 - entei
INCLUDE "data/pokemon/base_stats/sui.asm"	;245 - suicune
INCLUDE "data/pokemon/base_stats/sneasel.asm"	;246 - larvitar
INCLUDE "data/pokemon/base_stats/ho_oh.asm"	;247 - pupitar
INCLUDE "data/pokemon/base_stats/togepi.asm"	;248 - tyranitar
INCLUDE "data/pokemon/base_stats/snubbull.asm"	;249 - lugia
INCLUDE "data/pokemon/base_stats/aipom.asm"	;250 - ho_oh
INCLUDE "data/pokemon/base_stats/leafeon.asm"	;251 - celebi