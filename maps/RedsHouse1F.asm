	object_const_def ; object_event constants
	const REDSHOUSE1F_REDS_MOM

RedsHouse1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

RedsMom:
	faceplayer
	opentext
	checkflag ENGINE_POKEDEX
	iftrue .Bank
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .Heal
	checkflag ENGINE_PLAYER_IS_FEMALE
	iffalse .Male
	writetext MomLeaveGirlText
	waitbutton
	closetext
	end
.Male:
	writetext MomLeaveBoyText
	waitbutton
	closetext
	end
.Bank:
	special BankOfMom
	waitbutton
.Heal:
	writetext MomHeal1Text
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext MomHeal2Text
	closetext
	end

RedsHouse1FTV:
	readvar VAR_FACING
	ifequal LEFT, .WrongSide
	ifequal RIGHT, .WrongSide
	jumptext RedsHouse1FTVText
.WrongSide
	jumptext RedsHouseTVWrongSideText

RedsHouse1FBookshelf:
	jumpstd picturebookshelf

MomLeaveGirlText:
	text "Right."
	line "All girls leave"
	cont "home some day."
	cont "It said so on TV."

	para "PROF.OAK, next"
	line "door, is looking"
	cont "for you."
	done

MomLeaveBoyText:
	text "Right."
	line "All boys leave"
	cont "home some day."
	cont "It said so on TV."

	para "PROF.OAK, next"
	line "door, is looking"
	cont "for you."
	done

MomHeal1Text:
	text "<PLAYER>!"
	line "You should take a"
	cont "quick rest."
	done
	
MomHeal2Text:
	text "Oh good!"
	line "You and your"
	cont "#MON are"
	cont "looking great!"
	cont "Take care now!"
	done

RedsHouse1FTVText:
	text "There's a movie"
	line "on TV. Four boys"
	cont "are walking on"
	cont "railroad tracks."
	
	para "I better go too."
	done
	
RedsHouseTVWrongSideText:
	text "Oops, wrong side."
	done

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, PALLET_TOWN, 1
	warp_event  3,  7, PALLET_TOWN, 1
	warp_event  7,  1, REDS_HOUSE_2F, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  1,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  3,  1, BGEVENT_READ, RedsHouse1FTV

	db 1 ; object events
	object_event  5,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1
