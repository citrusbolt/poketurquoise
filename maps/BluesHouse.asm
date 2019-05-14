	object_const_def ; object_event constants
	const BLUESHOUSE_DAISY
	const BLUESHOUSE_MAP

BluesHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaisyScript:
	faceplayer
	opentext
	checkflag ENGINE_MAP_CARD
	iftrue .GotMap
	checkflag ENGINE_POKEDEX
	iftrue .GiveMap
	writetext DaisyInitialText
;	readvar VAR_HOUR
;	ifequal 15, .ThreePM
;	writetext DaisyHelloText
	waitbutton
	closetext
	end

.GiveMap:
	writetext DaisyOfferMapText
	waitbutton
	giveitem TOWN_MAP
	disappear BLUESHOUSE_MAP
	setflag ENGINE_MAP_CARD
	setevent EVENT_GOT_MAP_FROM_DAISY
	writetext DaisyGotMapText
	waitbutton
	closetext
	end

.GotMap:
	writetext DaisyUseMapText
	waitbutton
	closetext
	end

.ThreePM:
	checkflag ENGINE_DAISYS_GROOMING
	iftrue .AlreadyGroomedMon
	writetext DaisyOfferGroomingText
	yesorno
	iffalse .Refused
	writetext DaisyWhichMonText
	waitbutton
	special DaisysGrooming
	ifequal $0, .Refused
	ifequal $1, .CantGroomEgg
	setflag ENGINE_DAISYS_GROOMING
	writetext DaisyAlrightText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext GroomedMonLooksContentText
	special PlayCurMonCry
	buttonsound
	writetext DaisyAllDoneText
	waitbutton
	closetext
	end

.AlreadyGroomedMon:
	writetext DaisyAlreadyGroomedText
	waitbutton
	closetext
	end

.Refused:
	writetext DaisyRefusedText
	waitbutton
	closetext
	end

.CantGroomEgg:
	writetext DaisyCantGroomEggText
	waitbutton
	closetext
	end

DaisyInitialText:
	text "Hi <PLAYER>!"
	line "<RIVAL> is out at"
	cont "Grandpa's lab."
	done

DaisyOfferMapText:
	text "Grandpa asked you"
	line "to run an errand?"
	cont "Here, this will"
	cont "help you!"
	done

DaisyGotMapText:
	text "<PLAYER> got a"
	line "TOWN MAP!"
	done

DaisyUseMapText:
	text "Use the TOWN MAP"
	line "to find out where"
	cont "you are."
	done

DaisyHelloText:
	text "DAISY: Hi! My kid"
	line "brother is the GYM"

	para "LEADER in VIRIDIAN"
	line "CITY."

	para "But he goes out"
	line "of town so often,"

	para "it causes problems"
	line "for the trainers."
	done

DaisyOfferGroomingText:
	text "DAISY: Hi! Good"
	line "timing. I'm about"
	cont "to have some tea."

	para "Would you like to"
	line "join me?"

	para "Oh, your #MON"
	line "are a bit dirty."

	para "Would you like me"
	line "to groom one?"
	done

DaisyWhichMonText:
	text "DAISY: Which one"
	line "should I groom?"
	done

DaisyAlrightText:
	text "DAISY: OK, I'll"
	line "get it looking"
	cont "nice in no time."
	done

GroomedMonLooksContentText:
	text_ram wStringBuffer3
	text " looks"
	line "content."
	done

DaisyAllDoneText:
	text "DAISY: There you"
	line "go! All done."

	para "See? Doesn't it"
	line "look nice?"

	para "It's such a cute"
	line "#MON."
	done

DaisyAlreadyGroomedText:
	text "DAISY: I always"
	line "have tea around"

	para "this time. Come"
	line "join me."
	done

DaisyRefusedText:
	text "DAISY: You don't"
	line "want to have one"

	para "groomed? OK, we'll"
	line "just have tea."
	done

DaisyCantGroomEggText:
	text "DAISY: Oh, sorry."
	line "I honestly can't"
	cont "groom an EGG."
	done

BluesHouseBookshelf:
	jumpstd picturebookshelf

BluesHouseMapScript:
	opentext
	writetext BluesHouseMapText
	waitbutton
	closetext
	end

BluesHouseMapText:
	text "It's a big map!"
	line "This is useful!"
	done

BluesHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PALLET_TOWN, 2
	warp_event  3,  7, PALLET_TOWN, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 0,  1, BGEVENT_READ, BluesHouseBookshelf
	bg_event 1,  1, BGEVENT_READ, BluesHouseBookshelf
	bg_event 7,  1, BGEVENT_READ, BluesHouseBookshelf

	db 2 ; object events
	object_event  2,  3, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BluesHouseMapScript, EVENT_GOT_MAP_FROM_DAISY