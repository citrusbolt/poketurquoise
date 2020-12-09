	object_const_def ; object_event constants
	const VIRIDIANNICKNAMESPEECHHOUSE_POKEFAN_M
	const VIRIDIANNICKNAMESPEECHHOUSE_LASS
	const VIRIDIANNICKNAMESPEECHHOUSE_SPEARY
	const VIRIDIANNICKNAMESPEECHHOUSE_RATTEY

ViridianNicknameSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianNicknameSpeechHousePokefanMScript:
	jumptextfaceplayer ViridianNicknameSpeechHousePokefanMText

ViridianNicknameSpeechHouseLassScript:
	jumptextfaceplayer ViridianNicknameSpeechHouseLassText

Speary:
	opentext
	writetext SpearyText
	cry SPEAROW
	waitbutton
	closetext
	end

Rattey:
	opentext
	writetext RatteyText
	cry RATTATA
	waitbutton
	closetext
	end

ViridianNicknameSpeechHousePaperScript:
	opentext
	writetext ViridianNicknameSpeechHousePaperText
	waitbutton
	closetext
	end

ViridianNicknameSpeechHousePaperText:
	text "SPEAROW"
	line "NAME: SPEARY"
	done

ViridianNicknameSpeechHousePokefanMText:
	text "Coming up with"
	line "nicknames is fun,"
	cont "but hard."

	para "Simple names are"
	line "the easiest to"
	cont "remember."
	done

ViridianNicknameSpeechHouseLassText:
	text "My Daddy loves"
	line "#MON too."
	done

SpearyText:
	text "SPEARY: Tetweet!"
	done

RatteyText:
	text "RATTEY: Kikiii!"
	done

ViridianNicknameSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VIRIDIAN_CITY, 2
	warp_event  3,  7, VIRIDIAN_CITY, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianNicknameSpeechHousePokefanMScript, -1
	object_event  1,  4, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianNicknameSpeechHouseLassScript, -1
	object_event  5,  5, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Speary, -1
	object_event  4,  0, SPRITE_PAPER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianNicknameSpeechHousePaperScript, -1
