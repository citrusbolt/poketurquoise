	object_const_def ; object_event constants
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_GIRL
	const OAKSLAB_BLUE
	const OAKSLAB_POKE_BALL1
	const OAKSLAB_POKE_BALL2
	const OAKSLAB_POKE_BALL3
	const OAKSLAB_POKEDEX1
	const OAKSLAB_POKEDEX2

OaksLab_MapScripts:
	db 2 ; scene scripts
	scene_script .OakGone ; SCENE_DEFAULT
	scene_script .OakHere ; SCENE_FINISHED

	db 0 ; callbacks

.OakGone:
	checkevent EVENT_TIME_TO_CHOOSE_STARTER
	iffalse .OakDisappear
	setscene SCENE_FINISHED
	end
.OakDisappear:
	disappear OAKSLAB_OAK
	end
	
.OakHere:
	end

CharmanderPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakLastPokeBallScript
	checkevent EVENT_TIME_TO_CHOOSE_STARTER
	iffalse LookAtOakPokeBallScript
	turnobject OAKSLAB_OAK, DOWN
	refreshscreen
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	opentext
	writetext TakeCharmanderText
	yesorno
	iffalse DidntChooseOakStarterScript
	disappear OAKSLAB_POKE_BALL1
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	setevent EVENT_GOT_CHARMANDER_FROM_OAK
	setevent EVENT_CHARMANDER_POKEBALL_IN_OAKS_LAB
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, CHARMANDER
	writetext ReceivedOakStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHARMANDER, 5, BERRY
	closetext
	readvar VAR_FACING
	ifnotequal UP, .NotCharmanderUp1
	applymovement OAKSLAB_BLUE, .Down
.NotCharmanderUp1
	applymovement OAKSLAB_BLUE, BlueToSquirtleMovement
	ifnotequal UP, .NotCharmanderUp2
	applymovement OAKSLAB_BLUE, .Up
.NotCharmanderUp2
	sjump BlueStarterScript

.Down:
	slow_step DOWN
	step_end
	
.Up:
	slow_step UP
	step_end

SquirtlePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakLastPokeBallScript
	checkevent EVENT_TIME_TO_CHOOSE_STARTER
	iffalse LookAtOakPokeBallScript
	turnobject OAKSLAB_OAK, DOWN
	refreshscreen
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	opentext
	writetext TakeSquirtleText
	yesorno
	iffalse DidntChooseOakStarterScript
	disappear OAKSLAB_POKE_BALL2
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	setevent EVENT_GOT_SQUIRTLE_FROM_OAK
	setevent EVENT_SQUIRTLE_POKEBALL_IN_OAKS_LAB
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, SQUIRTLE
	writetext ReceivedOakStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke SQUIRTLE, 5, BERRY
	closetext
	readvar VAR_FACING
	ifnotequal UP, .NotSquirtleUp1
	applymovement OAKSLAB_BLUE, .Down
.NotSquirtleUp1
	applymovement OAKSLAB_BLUE, BlueToBulbasaurMovement
	ifnotequal UP, .NotSquirtleUp2
	applymovement OAKSLAB_BLUE, .Up
.NotSquirtleUp2
	sjump BlueStarterScript

.Down:
	slow_step DOWN
	step_end
	
.Up:
	slow_step UP
	step_end

BulbasaurPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakLastPokeBallScript
	checkevent EVENT_TIME_TO_CHOOSE_STARTER
	iffalse LookAtOakPokeBallScript
	turnobject OAKSLAB_OAK, DOWN
	refreshscreen
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	opentext
	writetext TakeBulbasaurText
	yesorno
	iffalse DidntChooseOakStarterScript
	disappear OAKSLAB_POKE_BALL3
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	setevent EVENT_GOT_BULBASAUR_FROM_OAK
	setevent EVENT_BULBASAUR_POKEBALL_IN_OAKS_LAB
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, BULBASAUR
	writetext ReceivedOakStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke BULBASAUR, 5, BERRY
	closetext
	applymovement OAKSLAB_BLUE, BlueToCharmanderMovement
	sjump BlueStarterScript
	
BlueStarterScript:
	clearevent EVENT_TIME_TO_CHOOSE_STARTER
	opentext
	writetext BlueGrabStarterText
	waitbutton
	closetext
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .BlueGetSquirtle
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .BlueGetBulbasaur
	disappear OAKSLAB_POKE_BALL1
	setevent EVENT_CHARMANDER_POKEBALL_IN_OAKS_LAB
	opentext
	writetext BlueGetCharmanderText
	waitbutton
	closetext
	end
.BlueGetSquirtle:
	disappear OAKSLAB_POKE_BALL2
	setevent EVENT_SQUIRTLE_POKEBALL_IN_OAKS_LAB
	opentext
	writetext BlueGetSquirtleText
	waitbutton
	closetext
	end
.BlueGetBulbasaur:
	disappear OAKSLAB_POKE_BALL3
	setevent EVENT_BULBASAUR_POKEBALL_IN_OAKS_LAB
	opentext
	writetext BlueGetBulbasaurText
	waitbutton
	closetext
	end
	
LookAtOakPokeBallScript:
	opentext
	writetext OakPokeBallText
	waitbutton
	closetext
	end
	
LookAtOakLastPokeBallScript:
	opentext
	writetext OakLastPokeBallText
	waitbutton
	closetext
	end

DidntChooseOakStarterScript:
	end

Oak:
	faceplayer
	opentext
	checkevent EVENT_GOT_OAKS_PARCEL
	iftrue .OakGotParcel
	checkevent EVENT_RIVAL_BATTLE_01
	iftrue .OakFoughtRival
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .OakGotStarter
	checkevent EVENT_TIME_TO_CHOOSE_STARTER
	iftrue .OakChooseStarter
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckPokedex
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftrue .CheckBadges
	writetext OakWelcomeKantoText
	buttonsound
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.CheckBadges:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .OpenMtSilver
	ifequal NUM_JOHTO_BADGES, .Complain
	sjump .AhGood

.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

.OpenMtSilver:
	writetext OakOpenMtSilverText
	buttonsound
	setevent EVENT_OPENED_MT_SILVER
	sjump .CheckPokedex

.Complain:
	writetext OakNoKantoBadgesText
	buttonsound
	sjump .CheckPokedex

.AhGood:
	writetext OakYesKantoBadgesText
	buttonsound
	sjump .CheckPokedex

.OakGotParcel:
	writetext OakGotParcelText1
	waitbutton
	closetext
	opentext
	writetext OakGotParcelText2
	waitbutton
	closetext
	takeitem OAKS_PARCEL
	opentext
	writetext OakGotParcelText3
	waitbutton
	closetext
	opentext
	writetext BlueGotParcelText1
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal LEFT, .ParcelPlus1
	ifequal RIGHT, .ParcelPlus1
	ifequal UP, .ParcelPlus2
	moveobject OAKSLAB_BLUE, 4, 6
	appear OAKSLAB_BLUE
	jump .RivalEnter
.ParcelPlus1:
	moveobject OAKSLAB_BLUE, 4, 7
	appear OAKSLAB_BLUE
	applymovement OAKSLAB_BLUE, .Up
	jump .RivalEnter
.ParcelPlus2:
	moveobject OAKSLAB_BLUE, 4, 8
	appear OAKSLAB_BLUE
	applymovement OAKSLAB_BLUE, .Up
	applymovement OAKSLAB_BLUE, .Up
.RivalEnter:
	turnobject OAKSLAB_OAK, DOWN
	applymovement OAKSLAB_BLUE, BlueEnterOaksLabMovement
	opentext
	writetext BlueGotParcelText2
	waitbutton
	closetext
	opentext
	writetext OakGotParcelText4
	waitbutton
	closetext
	opentext
	writetext OakGotParcelText5
	waitbutton
	closetext
	opentext
	writetext OakGotParcelText6
	playsound SFX_KEY_ITEM
	disappear OAKSLAB_POKEDEX1
	disappear OAKSLAB_POKEDEX2
	setevent EVENT_GOT_POKEDEX
	setflag ENGINE_POKEDEX
	clearevent EVENT_CAF_FIEND_NEEDS_COFFEE
	waitbutton
	closetext
	opentext
	writetext OakGotParcelText7
	waitbutton
	closetext
	turnobject OAKSLAB_BLUE, RIGHT
	opentext
	writetext BlueGotParcelText3
	waitbutton
	closetext
	applymovement OAKSLAB_BLUE, BlueLeaveOaksLabMovement
	disappear OAKSLAB_BLUE
	end
	
.Up:
	slow_step UP
	step_end	

.OakFoughtRival:
	writetext OakFoughtRivalText
	waitbutton
	closetext
	end
	
.OakGotStarter:
	writetext OakGotStarterText
	waitbutton
	closetext
	end
	
.OakChooseStarter:
	writetext OakChooseStarterText
	waitbutton
	closetext
	end

OaksLabBlue:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .BlueGotStarter
	checkevent EVENT_TIME_TO_CHOOSE_STARTER
	iftrue .BlueChooseScript
	writetext BlueWaitingText
	waitbutton
	closetext
	end

.BlueGotStarter:
	writetext BlueGotStarterText
	waitbutton
	closetext
	end

.BlueChooseScript
	writetext BlueChooseText
	waitbutton
	closetext
	end

LeaveOaksLabLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

LeaveOaksLabRightScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue BlueBattle01Script
	checkevent EVENT_TIME_TO_CHOOSE_STARTER
	iftrue OakDontGoScript
	end
	
BlueBattle01Script:
	checkevent EVENT_RIVAL_BATTLE_01
	iftrue .NoBattle
	turnobject PLAYER, UP
	opentext
	writetext BlueBattle01Text
	waitbutton
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement OAKSLAB_BLUE, .Left
.OnRight
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .GotCharmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .GotSquirtle
	applymovement OAKSLAB_BLUE, BlueFromCharmanderMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	winlosstext OaksLabBlueWinText, OaksLabBlueLossText
	setlasttalked OAKSLAB_BLUE
	loadtrainer BLUE, BLUE_1_CHARMANDER
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	sjump .FinishRival
.GotCharmander:
	applymovement OAKSLAB_BLUE, BlueFromSquirtleMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	winlosstext OaksLabBlueWinText, OaksLabBlueLossText
	setlasttalked OAKSLAB_BLUE
	loadtrainer BLUE, BLUE_1_SQUIRTLE
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	sjump .FinishRival
.GotSquirtle:
	applymovement OAKSLAB_BLUE, BlueFromBulbasaurMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	winlosstext OaksLabBlueWinText, OaksLabBlueLossText
	setlasttalked OAKSLAB_BLUE
	loadtrainer BLUE, BLUE_1_BULBASAUR
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
.FinishRival:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext OaksLabBlueAfterBattleText
	waitbutton
	closetext
	setevent EVENT_RIVAL_BATTLE_01
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight2
	applymovement OAKSLAB_BLUE, BlueLeaveOaksLabRightMovement
	disappear OAKSLAB_BLUE
	special HealParty
	playmapmusic
	end
.OnRight2:
	applymovement OAKSLAB_BLUE, BlueLeaveOaksLabLeftMovement
	disappear OAKSLAB_BLUE
	special HealParty
	playmapmusic
.NoBattle:
	end

.Left:
	slow_step LEFT
	step_end

OakDontGoScript:
	opentext
	writetext OakDontGoText
	waitbutton
	closetext
	applymovement PLAYER, .Up
	end

.Up:
	slow_step UP
	step_end

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd difficultbookshelf

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

PokedexScript:
	jumptext PokedexText

BlueToSquirtleMovement:
	slow_step DOWN
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	turn_head UP
	step_end

BlueToBulbasaurMovement:
	slow_step DOWN
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	turn_head UP
	step_end

BlueToCharmanderMovement:
	slow_step DOWN
	slow_step RIGHT
	slow_step RIGHT
	turn_head UP
	step_end

BlueFromCharmanderMovement:
	slow_step LEFT
	slow_step DOWN
	step_end
	
BlueFromSquirtleMovement:
	slow_step LEFT
	slow_step LEFT
	slow_step DOWN
	step_end
	
BlueFromBulbasaurMovement:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	slow_step DOWN
	step_end

BlueLeaveOaksLabLeftMovement:
	slow_step LEFT
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end

BlueLeaveOaksLabRightMovement:
	slow_step RIGHT
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end
	
BlueLeaveOaksLabMovement:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end
	
BlueEnterOaksLabMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

OakWelcomeKantoText:
	text "OAK: Ah, <PLAY_G>!"
	line "It's good of you"

	para "to come all this"
	line "way to KANTO."

	para "What do you think"
	line "of the trainers"

	para "out here?"
	line "Pretty tough, huh?"
	done

OakLabDexCheckText:
	text "How is your #-"
	line "DEX coming?"

	para "Let's see…"
	done

OakLabGoodbyeText:
	text "If you're in the"
	line "area, I hope you"
	cont "come visit again."
	done

OakOpenMtSilverText:
	text "OAK: Wow! That's"
	line "excellent!"

	para "You collected the"
	line "BADGES of GYMS in"
	cont "KANTO. Well done!"

	para "I was right in my"
	line "assessment of you."

	para "Tell you what,"
	line "<PLAY_G>. I'll make"

	para "arrangements so"
	line "that you can go to"
	cont "MT.SILVER."

	para "MT.SILVER is a big"
	line "mountain that is"

	para "home to many wild"
	line "#MON."

	para "It's too dangerous"
	line "for your average"

	para "trainer, so it's"
	line "off limits. But"

	para "we can make an"
	line "exception in your"
	cont "case, <PLAY_G>."

	para "Go up to INDIGO"
	line "PLATEAU. You can"

	para "reach MT.SILVER"
	line "from there."
	done

OakNoKantoBadgesText:
	text "OAK: Hmm? You're"
	line "not collecting"
	cont "KANTO GYM BADGES?"

	para "The GYM LEADERS in"
	line "KANTO are as tough"

	para "as any you battled"
	line "in JOHTO."

	para "I recommend that"
	line "you challenge"
	cont "them."
	done

OakYesKantoBadgesText:
	text "OAK: Ah, you're"
	line "collecting KANTO"
	cont "GYM BADGES."

	para "I imagine that"
	line "it's hard, but the"

	para "experience is sure"
	line "to help you."

	para "Come see me when"
	line "you get them all."

	para "I'll have a gift"
	line "for you."

	para "Keep trying hard,"
	line "<PLAY_G>!"
	done

OaksAssistant1Text:
	text "I study #MON as"
	line "PROF.OAK's AIDE."
	done

OaksAssistant2Text:
	text "Thanks to your"
	line "work on the #-"
	cont "DEX, the PROF's"

	para "research is coming"
	line "along great."
	done

OaksAssistant3Text:
	text "PROF.OAK is the"
	line "authority on"
	cont "#MON!"
	
	para "Many #MON"
	line "trainers hold him"
	cont "in high regard!"
	done

OaksLabPoster1Text:
	text "Press START to"
	line "open the MENU!"
	done

OaksLabPoster2Text:
	text "The SAVE option is"
	line "on the MENU"
	cont "screen."
	done

OaksLabTrashcanText:
	text "There's nothing in"
	line "here…"
	done

OaksLabPCText:
	text "There's an e-mail"
	line "message here!"

	para "…"

	para "Calling all"
	line "#MON trainers!"

	para "The elite trainers"
	line "of #MON LEAGUE"
	cont "are ready to take"
	cont "on all comers!"

	para "Bring your best"
	line "#MON and see"
	cont "how you rate as a"
	cont "trainer!"

	para "#MON LEAGUE HQ"
	line "INDIGO PLATEAU"

	para "PS: PROF.OAK,"
	line "please visit us!"
	cont "..."
	done
	
TakeCharmanderText:
	text "So! You want the"
	line "fire #MON,"
	cont "CHARMANDER?"
	done

TakeSquirtleText:
	text "So! You want the"
	line "water #MON,"
	cont "SQUIRTLE?"
	done

TakeBulbasaurText:
	text "So! You want the"
	line "plant #MON,"
	cont "BULBASAUR?"
	done

OakGotStarterText:
	text "OAK: If a wild"
	line "#MON appears,"
	cont "your #MON can"
	cont "fight against it!"
	done

OakChooseStarterText:
	text "OAK: Now, <PLAYER>,"
	line "which #MON do"
	cont "you want?"
	done

OakFoughtRivalText:
	text "OAK: <PLAYER>,"
	line "raise your young"
	cont "#MON by making"
	cont "it fight!"
	done

OakGotParcelText1:
	text "OAK: Oh, <PLAYER>!"
	
	para "How is my old"
	line "#MON?"
	
	para "Well, it seems to"
	line "like you a lot."
	
	para "You must be"
	line "talented as a"
	cont "#MON trainer!"
	
	para "What? You have"
	line "something for me?"
	done
	
OakGotParcelText2
	text "<PLAYER> delivered"
	line "OAK's PARCEL."
	done
	
OakGotParcelText3
	text "Ah! This is the"
	line "custom # BALL"
	cont "I ordered!"
	cont "Thank you!"
	done
	
BlueGotParcelText1:
	text "<RIVAL>: Gramps!"
	done
	
BlueGotParcelText2:
	text "<RIVAL>: What did"
	line "you call me for?"
	done
	
OakGotParcelText4:
	text "OAK: Oh right! I"
	line "have a request"
	cont "of you two."
	
	para "On the desk there"
	line "is my invention,"
	cont "#DEX!"
	
	para "It automatically"
	line "records data on"
	cont "#MON you've"
	cont "seen or caught!"
	
	para "It's a hi-tech"
	line "encyclopedia!"
	done
	
OakGotParcelText5:
	text "OAK: <PLAYER> and"
	line "<RIVAL>! Take"
	cont "these with you!"
	done
	
OakGotParcelText6:
	text "<PLAYER> got"
	line "#DEX from OAK!"
	done

OakGotParcelText7:
	text "To make a complete"
	line "guide on all the"
	cont "#MON in the"
	cont "world..."
	
	para "That was my dream!"
	
	para "But, I'm too old!"
	line "I can't do it!"
	
	para "So, I want you two"
	line "to fufill my"
	cont "dream for me!"
	
	para "Get moving, you"
	line "two!"
	
	para "This is a great"
	line "undertaking in"
	cont "#MON history!"
	done
	
BlueGotParcelText3:
	text "<RIVAL>: Alright"
	line "Gramps! Leave it"
	cont "all to me!"
	
	para "<PLAYER>, I hate to"
	line "say it, but I"
	cont "don't need you!"
	
	para "I know! I'll"
	line "borrow a TOWN MAP"
	cont "from my sis!"
	
	para "I'll tell her not"
	line "to lend you one,"
	cont "<PLAYER>! Hahaha!"
	done

OakGotPokedexText:
	text "#MON around the"
	line "world wait for"
	cont "you, <PLAYER>!"
	done

ReceivedOakStarterText:
	text "This #MON is"
	line "really energetic!"
	
	para "<PLAYER> received"
	line "a @"
	text_ram wStringBuffer3
	text "!"
	done
	
OakPokeBallText:
	text "Those are #"
	line "BALLS. They"
	cont "contain #MON!"
	done

OakLastPokeBallText:
	text "That's PROF.OAK's"
	line "last #MON!"
	done

BlueWaitingText:
	text "<RIVAL>: Yo"
	line "<PLAYER>! Gramps"
	cont "isn't around!"
	done
	
BlueChooseText:
	text "<RIVAL>: Heh, I"
	line "don't need to be"
	cont "greedy like you!"
	
	para "Go ahead and"
	line "choose, <PLAYER>!"
	done
	
BlueGrabStarterText:
	text "<RIVAL>: I'll take"
	line "this one, then!"
	done
	
BlueGetCharmanderText:
	text "<RIVAL> received"
	line "a CHARMANDER!"
	done
	
BlueGetSquirtleText:
	text "<RIVAL> received"
	line "a SQUIRTLE!"
	done
	
BlueGetBulbasaurText:
	text "<RIVAL> received"
	line "a BULBASAUR!"
	done
	
BlueGotStarterText:
	text "<RIVAL>: My"
	line "#MON looks a"
	cont "lot stronger."
	done
	
OakDontGoText:
	text "OAK: Hey! Don't go"
	line "away yet!"
	done
	
BlueBattle01Text:
	text "<RIVAL>: Wait"
	line "<PLAYER>!"
	cont "Let's check out"
	cont "our #MON!"
	
	para "Come on, I'll take"
	line "you on!"
	done

OaksLabBlueWinText:
	text "<RIVAL>: What?"
	line "Unbelievable!"
	cont "I picked the"
	cont "wrong #MON!"
	done

OaksLabBlueLossText:
	text "<RIVAL>: Yeah! Am"
	line "I great or what?"
	done
	
OaksLabBlueAfterBattleText:
	text "<RIVAL>: Okay!"
	line "I'll make my"
	cont "#MON fight to"
	cont "toughen it up!"
	
	para "<PLAYER>! GRAMPS!"
	line "Smell ya later!"
	done

PokedexText:
	text "It's encyclopedia-"
	line "like, but the"
	cont "pages are blank!"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	db 2 ; coord events
	coord_event  4,  6, -1, LeaveOaksLabLeftScript
	coord_event  5,  6, -1, LeaveOaksLabRightScript

	db 15 ; bg events
	bg_event  6,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  5,  0, BGEVENT_READ, OaksLabPoster2
;	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	db 10 ; object events
	object_event  5,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  2, 10, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event  8, 10, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event  1,  9, SPRITE_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksAssistant3Script, -1
	object_event  4,  3, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksLabBlue, EVENT_GOT_A_POKEMON_FROM_OAK
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharmanderPokeBallScript, EVENT_CHARMANDER_POKEBALL_IN_OAKS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SquirtlePokeBallScript, EVENT_SQUIRTLE_POKEBALL_IN_OAKS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BulbasaurPokeBallScript, EVENT_BULBASAUR_POKEBALL_IN_OAKS_LAB
	object_event  2,  1, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokedexScript, EVENT_GOT_POKEDEX
	object_event  3,  1, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokedexScript, EVENT_GOT_POKEDEX
