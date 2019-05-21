	object_const_def ; object_event constants
	const VIRIDIANCITY_CAF_FIEND1
	const VIRIDIANCITY_CAF_FIEND2
	const VIRIDIANCITY_GRAMPS
	const VIRIDIANCITY_FISHER
	const VIRIDIANCITY_YOUNGSTER

ViridianCity_MapScripts:
	db 2 ; scene scripts
	scene_script .CafFiendNeedCoffee ; SCENE_DEFAULT
	scene_script .CafFiendGotCoffee ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.CafFiendNeedCoffee:
	checkflag ENGINE_POKEDEX
	iftrue .CafFiendGotCoffee
	disappear VIRIDIANCITY_CAF_FIEND2
	end
	
.CafFiendGotCoffee:
	setscene SCENE_FINISHED
	disappear VIRIDIANCITY_CAF_FIEND1
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	return

ViridianCityCafFiendNoPass:
	checkflag ENGINE_POKEDEX
	iftrue .done
	opentext
	writetext ViridianCityCafFiendNoCoffeeText
	waitbutton
	closetext
	applymovement PLAYER, .Down
.done:
	end

.Down:
	step DOWN
	step_end

ViridianCityCafFiendScript:
	checkflag ENGINE_POKEDEX
	iffalse .NeedCoffee
	faceplayer
	opentext
	writetext ViridianCityCafFiendYesCoffeeText
	yesorno
	iffalse .Tutorial
	writetext ViridianCityCafFiendHurryText
	waitbutton
	closetext
	end
.NeedCoffee:
	opentext
	writetext ViridianCityCafFiendNoCoffeeText
	waitbutton
	closetext
	applymovement PLAYER, .Down
	end
.Tutorial
	writetext ViridianCityCafFiendTutorial1Text
	waitbutton
	closetext
	loadwildmon WEEDLE, 5
	catchtutorial BATTLETYPE_TUTORIAL
	opentext
	writetext ViridianCityCafFiendTutorial2Text
	waitbutton
	closetext
	end

.Down:
	step DOWN
	step_end

ViridianCityGirlScript:
	faceplayer
	opentext
	checkflag ENGINE_POKEDEX
	iftrue .GotCoffee
	writetext ViridianCityGirlNoCoffeeText
	waitbutton
	closetext
	end
.GotCoffee:
	writetext ViridianCityGirlYesCoffeeText
	waitbutton
	closetext
	end

ViridianCityGrampsNearGym:
	faceplayer
	opentext
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue .BlueReturned
	writetext ViridianCityGrampsNearGymText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianCityGrampsNearGymBlueReturnedText
	waitbutton
	closetext
	end

ViridianCityDreamEaterFisher:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext ViridianCityDreamEaterFisherText
	buttonsound
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext ViridianCityDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end

ViridianCityYoungster1Script:
	jumptextfaceplayer ViridianCityYoungster1Text

ViridianCityYoungster2Script:
	faceplayer
	opentext
	writetext ViridianCityYoungster21Text
	yesorno
	iffalse .No
	writetext ViridianCityYoungster22Text
	waitbutton
	closetext
	end
.No:
	writetext ViridianCityYoungster23Text
	waitbutton
	closetext
	end

ViridianCitySign:
	jumptext ViridianCitySignText

ViridianGymSign:
	jumptext ViridianGymSignText

ViridianCityTrainerTipSign1:
	jumptext ViridianCityTrainerTipSign1Text

ViridianCityTrainerTipSign2:
	jumptext ViridianCityTrainerTipSign2Text

TrainerHouseSign:
	jumptext TrainerHouseSignText

ViridianCityPokecenterSign:
	jumpstd pokecentersign

ViridianCityMartSign:
	jumpstd martsign

ViridianCityCafFiendNoCoffeeText:
	text "You can't go"
	line "through there!"

	para "This is private"
	line "property!"
	done

ViridianCityCafFiendYesCoffeeText:
	text "Ahh, I've had my"
	line "coffee now and I"
	cont "feel great!"

	para "Sure you can go"
	line "through!"
	
	para "Are you in a"
	line "hurry?"
	done

ViridianCityCafFiendHurryText:
	text "Time is money..."
	line "Go along then."
	done

ViridianCityCafFiendTutorial1Text:
	text "I see you're using"
	line "a #DEX."
	
	para "When you catch a"
	line "#MON, #DEX"
	cont "is automatically"
	cont "updated."
	
	para "What? Don't you"
	line "know how to catch"
	cont "#MON?"
	
	para "I'll show you"
	line "how to then."
	done
	
ViridianCityCafFiendTutorial2Text:
	text "First, you need"
	line "to weaken the"
	cont "target #MON."
	done

ViridianCityGirlNoCoffeeText:
	text "Oh Grandpa! Don't"
	line "be so mean!"
	cont "He hasn't had his"
	cont "coffee yet."
	done

ViridianCityGirlYesCoffeeText:
	text "When I go shop in"
	line "PEWTER CITY, I"
	cont "have to take the"
	cont "winding trail in"
	cont "VIRIDIAN FOREST."
	done

ViridianCityGrampsNearGymText:
	text "This #MON GYM"
	line "is always closed."

	para "I wonder who the"
	line "leader is?"
	done

ViridianCityGrampsNearGymBlueReturnedText:
	text "Are you going to"
	line "battle the LEADER?"

	para "Good luck to you."
	line "You'll need it."
	done

ViridianCityDreamEaterFisherText:
	text "Yawn!"

	para "I must have dozed"
	line "off in the sun."

	para "…I had this dream"
	line "about a DROWZEE"

	para "eating my dream."
	line "Weird, huh?"

	para "Huh?"
	line "What's this?"

	para "Where did this TM"
	line "come from?"

	para "This is spooky!"
	line "Here, you can have"
	cont "this TM."
	done

ViridianCityDreamEaterFisherGotDreamEaterText:
	text "TM42 contains"
	line "DREAM EATER…"

	para "…Zzzzz…"
	done

ViridianCityYoungster1Text:
	text "Those # BALLS"
	line "at your waist!"
	cont "You have #MON!"

	para "It's great that"
	line "you can carry and"
	cont "use #MON any"
	cont "time, anywhere!"
	done

ViridianCityYoungster21Text:
	text "You want to know"
	line "about the 2 kinds"
	cont "of caterpillar"
	cont "#MON?"
	done

ViridianCityYoungster22Text:
	text "CATERPIE has no"
	line "poison, but"
	cont "WEEDLE does."
	
	para "Watch out for its"
	line "POISON STING!"
	done

ViridianCityYoungster23Text:
	text "Oh, OK then!"
	done

ViridianCitySignText:
	text "VIRIDIAN CITY"

	para "The Eternally"
	line "Green Paradise"
	done

ViridianGymSignText:
	text "VIRIDIAN CITY"
	line "#MON GYM"
	done

ViridianCityTrainerTipSign1Text:
	text "TRAINER TIPS"

	para "Catch #MON"
	line "and expand your"
	cont "collection!"
	
	para "The more you have,"
	line "the easier it is"
	cont "to fight!"
	done

ViridianCityTrainerTipSign2Text:
	text "TRAINER TIPS"

	para "The battle moves"
	line "of #MON are"
	cont "limited by their"
	cont "POWER POINTS, PP."
	
	para "To replenish PP,"
	line "rest your tired"
	cont "#MON at a"
	cont "#MON CENTER!"
	done

TrainerHouseSignText:
	text "TRAINER HOUSE"

	para "The Club for Top"
	line "Trainer Battles"
	done

ViridianCity_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 32,  7, VIRIDIAN_GYM, 1
	warp_event 21,  9, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event 23, 15, TRAINER_HOUSE_1F, 1
	warp_event 29, 19, VIRIDIAN_MART, 2
	warp_event 23, 25, VIRIDIAN_POKECENTER_1F, 1

	db 1 ; coord events
	coord_event 19, 9, 0, ViridianCityCafFiendNoPass

	db 7 ; bg events
	bg_event 17, 17, BGEVENT_READ, ViridianCitySign
	bg_event 27,  7, BGEVENT_READ, ViridianGymSign
	bg_event 19,  1, BGEVENT_READ, ViridianCityTrainerTipSign1
	bg_event 21, 29, BGEVENT_READ, ViridianCityTrainerTipSign2
	bg_event 21, 15, BGEVENT_READ, TrainerHouseSign
	bg_event 24, 25, BGEVENT_READ, ViridianCityPokecenterSign
	bg_event 30, 19, BGEVENT_READ, ViridianCityMartSign

	db 7 ; object events
	object_event 18,  9, SPRITE_DECAF, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCafFiendScript, -1
	object_event 19,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 3, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCafFiendScript, -1
	object_event 30,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, -1
	object_event  6, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, -1
	object_event 13, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 5, 5, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungster1Script, -1
	object_event 30, 25, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 5, 5, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungster2Script, -1
	object_event 17,  9, SPRITE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0,  ViridianCityGirlScript, -1
