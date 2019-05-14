	object_const_def ; object_event constants
	const PALLETTOWN_TEACHER
	const PALLETTOWN_FISHER
	const PALLETTOWN_OAK

PalletTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_PALLET
	return

PalletTownTeacherScript:
	jumptextfaceplayer PalletTownTeacherText

PalletTownFisherScript:
	jumptextfaceplayer PalletTownFisherText
	
MeetOakLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	
MeetOakRightScript:
	checkevent EVENT_MET_OAK
	iftrue NoOak
	setevent EVENT_MET_OAK
	turnobject PLAYER, DOWN
	playmusic MUSIC_PROF_OAK
	opentext
	writetext OakHeyWaitText
	showemote EMOTE_SHOCK, PLAYER, 15
	moveobject PALLETTOWN_OAK, 8, 6
	appear PALLETTOWN_OAK
	turnobject PALLETTOWN_OAK, UP
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PALLETTOWN_OAK, OakApproachLeft
	sjump MeetOakScript	
.OnRight:
	applymovement PALLETTOWN_OAK, OakApproachRight
MeetOakScript:
	opentext
	writetext OakUnsafeText
	waitbutton
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .OnLeft
	applymovement PALLETTOWN_OAK, OakMoveLeft
	applymovement PLAYER, PlayerMoveLeft
.OnLeft:
	follow PALLETTOWN_OAK, PLAYER
	applymovement PALLETTOWN_OAK, OakWalkToLab
	stopfollow
	applymovement PLAYER, PlayerEnterLab
	warp OAKS_LAB, 5, 11
	moveobject OAKSLAB_OAK, 5, 10
	appear OAKSLAB_OAK
	turnobject PLAYER, UP
	applymovement OAKSLAB_OAK, OakWalkUp
	disappear OAKSLAB_OAK
	moveobject OAKSLAB_OAK, 5, 2
	appear OAKSLAB_OAK
	applymovement PLAYER, PlayerWalkUp
	turnobject OAKSLAB_BLUE1, UP
	opentext
	writetext BlueStarterText1
	waitbutton
	closetext
	opentext
	writetext OakStarterText1
	waitbutton
	closetext
	opentext
	writetext BlueStarterText2
	waitbutton
	closetext
	opentext
	writetext OakStarterText2
	waitbutton
	closetext
	setevent EVENT_TIME_TO_CHOOSE_STARTER

NoOak:
	end

OakApproachLeft:
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step RIGHT
	slow_step UP
	step_end

OakApproachRight:
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step RIGHT
	slow_step UP
	step_end

OakMoveLeft:
	step LEFT
	step_end

PlayerMoveLeft:
	step LEFT
	step_end

OakWalkToLab:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
PlayerEnterLab:
	step UP
	step_end
	
OakWalkUp:
	step UP
	step UP
	step UP
	step UP
	step_end
	
PlayerWalkUp:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

PalletTownSign:
	jumptext PalletTownSignText

RedsHouseSign:
	jumptext RedsHouseSignText

OaksLabSign:
	jumptext OaksLabSignText

BluesHouseSign:
	jumptext BluesHouseSignText

PalletTownTeacherText:
	text "I'm raising #-"
	line "MON too."

	para "When they get"
	line "strong, they can"
	cont "protect me!"
	done

PalletTownFisherText:
	text "Technology is"
	line "incredible!"

	para "You can now store"
	line "and recall items"
	cont "and #MON as"
	cont "data via PC!"
	done

PalletTownSignText:
	text "PALLET TOWN"

	para "Shades of your"
	line "journey await!"
	done

RedsHouseSignText:
	text "<PLAYER>'S HOUSE"
	done

OaksLabSignText:
	text "OAK #MON"
	line "RESEARCH LAB"
	done

BluesHouseSignText:
	text "<RIVAL>'S HOUSE"
	done
	
OakHeyWaitText:
	text "OAK: Hey! Wait!"
	line "Don't go out!"
	done
	
OakUnsafeText:
	text "OAK: It's unsafe!"
	line "Wild #MON live"
	cont "in tall grass!"
	
	para "You need your own"
	line "#MON for your"
	cont "protection."
	cont "I know!"
	
	para "Here, come with"
	line "me!"
	done
	
BlueStarterText1:
	text "<RIVAL>: Gramps!"
	line "I'm fed up with"
	cont "waiting!"
	done
	
OakStarterText1:
	text "OAK: <RIVAL>?"
	line "Let me think..."
	
	para "Oh, that's right,"
	line "I told you to"
	cont "come! Just wait!"
	
	para "Here, <PLAYER>!"
	
	para "There are 3"
	line "#MON here!"
	
	para "Haha!"
	
	para "They are inside"
	line "the # BALLs."
	
	para "When I was young,"
	line "I was a serious"
	cont "#MON trainer!"
	
	para "In my old age, I"
	line "have only 3 left,"
	cont "but you can have"
	cont "one! Choose!"
	done
	
BlueStarterText2:
	text "<RIVAL>: Hey!"
	line "Gramps! What"
	cont "about me?"
	done
	
OakStarterText2:
	text "OAK: Be patient!"
	line "<RIVAL>, you can"
	cont "have one too!"
	done

PalletTown_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  5, REDS_HOUSE_1F, 1
	warp_event 13,  5, BLUES_HOUSE, 1
	warp_event 12, 11, OAKS_LAB, 1

	db 2 ; coord events
	coord_event  10,  1, -1, MeetOakLeftScript
	coord_event  11,  1, -1, MeetOakRightScript

	db 4 ; bg events
	bg_event  7,  9, BGEVENT_READ, PalletTownSign
	bg_event  3,  5, BGEVENT_READ, RedsHouseSign
	bg_event 13, 13, BGEVENT_READ, OaksLabSign
	bg_event 11,  5, BGEVENT_READ, BluesHouseSign

	db 3 ; object events
	object_event 12, 14, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PalletTownFisherScript, -1
	object_event  3,  8, SPRITE_GIRL, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletTownTeacherScript, -1
	object_event 28, 25, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, 0, -1
