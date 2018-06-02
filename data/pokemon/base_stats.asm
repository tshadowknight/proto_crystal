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
INCLUDE "data/pokemon/base_stats/chikorita.asm"	;152
INCLUDE "data/pokemon/base_stats/bayleef.asm"	;153
INCLUDE "data/pokemon/base_stats/meganium.asm"	;154
INCLUDE "data/pokemon/base_stats/cyndaquil.asm"	;155
INCLUDE "data/pokemon/base_stats/quilava.asm"	;156
INCLUDE "data/pokemon/base_stats/typhlosion.asm"	;157
INCLUDE "data/pokemon/base_stats/totodile.asm"	;158
INCLUDE "data/pokemon/base_stats/croconaw.asm"	;159
INCLUDE "data/pokemon/base_stats/feraligatr.asm"	;160
INCLUDE "data/pokemon/base_stats/sentret.asm"	;161
INCLUDE "data/pokemon/base_stats/furret.asm"	;162
INCLUDE "data/pokemon/base_stats/hoothoot.asm"	;163
INCLUDE "data/pokemon/base_stats/noctowl.asm"	;164
INCLUDE "data/pokemon/base_stats/ledyba.asm"	;165
INCLUDE "data/pokemon/base_stats/ledian.asm"	;166
INCLUDE "data/pokemon/base_stats/spinarak.asm"	;167
INCLUDE "data/pokemon/base_stats/ariados.asm"	;168
INCLUDE "data/pokemon/base_stats/crobat.asm"	;169
INCLUDE "data/pokemon/base_stats/chinchou.asm"	;170
INCLUDE "data/pokemon/base_stats/lanturn.asm"	;171
INCLUDE "data/pokemon/base_stats/pichu.asm"	;172
INCLUDE "data/pokemon/base_stats/cleffa.asm"	;173
INCLUDE "data/pokemon/base_stats/igglybuff.asm"	;174
INCLUDE "data/pokemon/base_stats/togepi.asm"	;175
INCLUDE "data/pokemon/base_stats/togetic.asm"	;176
INCLUDE "data/pokemon/base_stats/natu.asm"	;177
INCLUDE "data/pokemon/base_stats/xatu.asm"	;178
INCLUDE "data/pokemon/base_stats/mareep.asm"	;179
INCLUDE "data/pokemon/base_stats/flaaffy.asm"	;180
INCLUDE "data/pokemon/base_stats/ampharos.asm"	;181
INCLUDE "data/pokemon/base_stats/bellossom.asm"	;182
INCLUDE "data/pokemon/base_stats/marill.asm"	;183
INCLUDE "data/pokemon/base_stats/azumarill.asm"	;184
INCLUDE "data/pokemon/base_stats/sudowoodo.asm"	;185
INCLUDE "data/pokemon/base_stats/politoed.asm"	;186
INCLUDE "data/pokemon/base_stats/hoppip.asm"	;187
INCLUDE "data/pokemon/base_stats/skiploom.asm"	;188
INCLUDE "data/pokemon/base_stats/jumpluff.asm"	;189
INCLUDE "data/pokemon/base_stats/aipom.asm"	;190
INCLUDE "data/pokemon/base_stats/sunkern.asm"	;191
INCLUDE "data/pokemon/base_stats/sunflora.asm"	;192
INCLUDE "data/pokemon/base_stats/yanma.asm"	;193
INCLUDE "data/pokemon/base_stats/wooper.asm"	;194
INCLUDE "data/pokemon/base_stats/quagsire.asm"	;195
INCLUDE "data/pokemon/base_stats/espeon.asm"	;196
INCLUDE "data/pokemon/base_stats/umbreon.asm"	;197
INCLUDE "data/pokemon/base_stats/murkrow.asm"	;198
INCLUDE "data/pokemon/base_stats/slowking.asm"	;199
INCLUDE "data/pokemon/base_stats/misdreavus.asm"	;200
INCLUDE "data/pokemon/base_stats/unown.asm"	;201
INCLUDE "data/pokemon/base_stats/wobbuffet.asm"	;202
INCLUDE "data/pokemon/base_stats/girafarig.asm"	;203
INCLUDE "data/pokemon/base_stats/pineco.asm"	;204
INCLUDE "data/pokemon/base_stats/forretress.asm"	;205
INCLUDE "data/pokemon/base_stats/dunsparce.asm"	;206
INCLUDE "data/pokemon/base_stats/gligar.asm"	;207
INCLUDE "data/pokemon/base_stats/steelix.asm"	;208
INCLUDE "data/pokemon/base_stats/snubbull.asm"	;209
INCLUDE "data/pokemon/base_stats/granbull.asm"	;210
INCLUDE "data/pokemon/base_stats/qwilfish.asm"	;211
INCLUDE "data/pokemon/base_stats/scizor.asm"	;212
INCLUDE "data/pokemon/base_stats/shuckle.asm"	;213
INCLUDE "data/pokemon/base_stats/heracross.asm"	;214
INCLUDE "data/pokemon/base_stats/sneasel.asm"	;215
INCLUDE "data/pokemon/base_stats/teddiursa.asm"	;216
INCLUDE "data/pokemon/base_stats/ursaring.asm"	;217
INCLUDE "data/pokemon/base_stats/slugma.asm"	;218
INCLUDE "data/pokemon/base_stats/magcargo.asm"	;219
INCLUDE "data/pokemon/base_stats/swinub.asm"	;220
INCLUDE "data/pokemon/base_stats/piloswine.asm"	;221
INCLUDE "data/pokemon/base_stats/corsola.asm"	;222
INCLUDE "data/pokemon/base_stats/remoraid.asm"	;223
INCLUDE "data/pokemon/base_stats/octillery.asm"	;224
INCLUDE "data/pokemon/base_stats/delibird.asm"	;225
INCLUDE "data/pokemon/base_stats/mantine.asm"	;226
INCLUDE "data/pokemon/base_stats/skarmory.asm"	;227
INCLUDE "data/pokemon/base_stats/houndour.asm"	;228
INCLUDE "data/pokemon/base_stats/houndoom.asm"	;229
INCLUDE "data/pokemon/base_stats/kingdra.asm"	;230
INCLUDE "data/pokemon/base_stats/phanpy.asm"	;231
INCLUDE "data/pokemon/base_stats/donphan.asm"	;232
INCLUDE "data/pokemon/base_stats/porygon2.asm"	;233
INCLUDE "data/pokemon/base_stats/stantler.asm"	;234
INCLUDE "data/pokemon/base_stats/smeargle.asm"	;235
INCLUDE "data/pokemon/base_stats/tyrogue.asm"	;236
INCLUDE "data/pokemon/base_stats/hitmontop.asm"	;237
INCLUDE "data/pokemon/base_stats/smoochum.asm"	;238
INCLUDE "data/pokemon/base_stats/elekid.asm"	;239
INCLUDE "data/pokemon/base_stats/magby.asm"	;240
INCLUDE "data/pokemon/base_stats/miltank.asm"	;241
INCLUDE "data/pokemon/base_stats/blissey.asm"	;242
INCLUDE "data/pokemon/base_stats/raikou.asm"	;243
INCLUDE "data/pokemon/base_stats/entei.asm"	;244
INCLUDE "data/pokemon/base_stats/suicune.asm"	;245
INCLUDE "data/pokemon/base_stats/larvitar.asm"	;246
INCLUDE "data/pokemon/base_stats/pupitar.asm"	;247
INCLUDE "data/pokemon/base_stats/tyranitar.asm"	;248
INCLUDE "data/pokemon/base_stats/lugia.asm"	;249
INCLUDE "data/pokemon/base_stats/ho_oh.asm"	;250
INCLUDE "data/pokemon/base_stats/celebi.asm"	;251
