	object_const_def ; object_event constants
	const VIRIDIANPOKECENTER1F_NURSE
	const VIRIDIANPOKECENTER1F_COOLTRAINER1
	const VIRIDIANPOKECENTER1F_GENTLEMAN
	const VIRIDIANPOKECENTER1F_COOLTRAINER2

ViridianPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianPokecenter1FNurseScript:
	jumpstd pokecenternurse

ViridianPokecenter1FCooltrainer1Script:
	jumptextfaceplayer ViridianPokecenter1FCooltrainer1Text

ViridianPokecenter1FGentlemanScript:
	jumptextfaceplayer ViridianPokecenter1FGentlemanText

ViridianPokecenter1FCooltrainer2Script:
	jumptextfaceplayer ViridianPokecenter1FCooltrainer2Text

ViridianPokecenter1FCooltrainer1Text:
	text "There's a #MON"
	line "CENTER in every"
	cont "town ahead."
	
	para "They don't charge"
	line "any money either!"
	done

ViridianPokecenter1FCooltrainerMText_BlueReturned:
	text "There are no GYM"
	line "TRAINERS at the"
	cont "VIRIDIAN GYM."

	para "The LEADER claims"
	line "his policy is to"

	para "win without having"
	line "any underlings."
	done

ViridianPokecenter1FGentlemanText:
	text "You can use that"
	line "PC in the corner."

	para "The receptionist"
	line "told me. So kind!"
	done

ViridianPokecenter1FCooltrainer2Text:
	text "#MON CENTERs"
	line "heal your tired,"
	cont "hurt or fainted"
	cont "#MON!"
	done

ViridianPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, VIRIDIAN_CITY, 5
	warp_event  4,  7, VIRIDIAN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FNurseScript, -1
	object_event  4,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FCooltrainer1Script, -1
	object_event  7,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FGentlemanScript, -1
	object_event  0,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FCooltrainer2Script, -1
