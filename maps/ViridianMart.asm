	object_const_def ; object_event constants
	const VIRIDIANMART_CLERK
	const VIRIDIANMART_LASS
	const VIRIDIANMART_COOLTRAINER_M

ViridianMart_MapScripts:
	db 2 ; scene scripts
	scene_script .GetParcel ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.GetParcel:
	opentext
	writetext GetParcelText1
	waitbutton
	closetext
	applymovement PLAYER, GetParcelMovement
	turnobject PLAYER, LEFT
	opentext
	writetext GetParcelText2
	waitbutton
	closetext
	opentext
	writetext GetParcelText3
	waitbutton
	closetext
	setevent EVENT_GOT_OAKS_PARCEL
	setscene SCENE_FINISHED
	giveitem OAKS_PARCEL
	end
	
.DummyScene1:
	end

ViridianMartClerkScript:
	opentext
	checkflag ENGINE_POKEDEX
	iffalse .NoDex
	pokemart MARTTYPE_STANDARD, MART_VIRIDIAN
.NoDex:
	writetext SayHiToOakText
	closetext
	end

ViridianMartLassScript:
	jumptextfaceplayer ViridianMartLassText

ViridianMartCooltrainerMScript:
	jumptextfaceplayer ViridianMartCooltrainerMText

GetParcelMovement
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

ViridianMartLassText:
	text "The GYM LEADER"
	line "here is totally"
	cont "cool."
	done

ViridianMartCooltrainerMText:
	text "Have you been to"
	line "CINNABAR?"

	para "It's an island way"
	line "south of here."
	done

GetParcelText1:
	text "Hey! You came from"
	line "PALLET TOWN?"
	done

GetParcelText2:
	text "You know PROF."
	line "OAK, right?"
	
	para "His order came in."
	line "Will you take it"
	cont "to him?"
	done
	
GetParcelText3:
	text "<PLAYER> got"
	line "OAK's PARCEL!"
	done
	
SayHiToOakText:
	text "Okay! Say hi to"
	line "PROF.OAK for me!"
	done

ViridianMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VIRIDIAN_CITY, 4
	warp_event  3,  7, VIRIDIAN_CITY, 4

	db 0 ; coord events
;	coord_event  3,  7, -1, GetParcelScript

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartClerkScript, -1
	object_event  7,  2, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartLassScript, -1
	object_event  1,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartCooltrainerMScript, -1
