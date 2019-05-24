	object_const_def ; object_event constants
	const ROUTE22_BLUE

Route22_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end
.DummyScene1:
	checkevent EVENT_RIVAL_ROUTE_22
	iffalse .ChangeScene
	end
.ChangeScene:
	setscene SCENE_DEFAULT
	end

Route22BlueUp:
	playmusic MUSIC_RIVAL_ENCOUNTER
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	applymovement ROUTE22_BLUE, .MoveRight
	turnobject PLAYER, DOWN
	checkflag ENGINE_EARTHBADGE
	iftrue Route22Blue2
	jump Route22Blue
.done
	end
.MoveRight:
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	turn_head UP
	step_end

Route22BlueDown:
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement ROUTE22_BLUE, .MoveRight
	checkflag ENGINE_EARTHBADGE
	iftrue Route22Blue2
	jump Route22Blue
.done
	end
.MoveRight:
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end

Route22Blue:
	opentext
	writetext Route22BlueText
	waitbutton
	closetext
	winlosstext Route22BlueWinText, 0
	setlasttalked ROUTE22_BLUE
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .GotCharmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .GotSquirtle
	loadtrainer BLUE, BLUE_2_CHARMANDER
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishRival
.GotCharmander:
	loadtrainer BLUE, BLUE_2_SQUIRTLE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishRival
.GotSquirtle:
	loadtrainer BLUE, BLUE_2_BULBASAUR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
.FinishRival:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route22BlueAfterBattleText
	waitbutton
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .TopSquare
	applymovement ROUTE22_BLUE, .LeaveDown
	playsound SFX_EXIT_BUILDING
	disappear ROUTE22_BLUE
	setevent EVENT_RIVAL_ROUTE_22
	setscene SCENE_FINISHED
	waitsfx
	playmapmusic
	end
.TopSquare:
	applymovement ROUTE22_BLUE, .LeaveUp
	playsound SFX_EXIT_BUILDING
	disappear ROUTE22_BLUE
	setevent EVENT_RIVAL_ROUTE_22
	setscene SCENE_FINISHED
	waitsfx
	playmapmusic
	end
.LeaveDown:
	slow_step UP
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end
.LeaveUp:
	slow_step RIGHT
	slow_step RIGHT
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end

Route22Blue2:
	opentext
	writetext Route22Blue2Text
	waitbutton
	closetext
	winlosstext Route22Blue2WinText, 0
	setlasttalked ROUTE22_BLUE
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .GotCharmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .GotSquirtle
	loadtrainer BLUE, BLUE_7_CHARMANDER
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishRival
.GotCharmander:
	loadtrainer BLUE, BLUE_7_SQUIRTLE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .FinishRival
.GotSquirtle:
	loadtrainer BLUE, BLUE_7_BULBASAUR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
.FinishRival:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route22Blue2AfterBattleText
	waitbutton
	closetext
	applymovement ROUTE22_BLUE, .LeaveLeft
	playsound SFX_EXIT_BUILDING
	disappear ROUTE22_BLUE
	setevent EVENT_RIVAL_ROUTE_22
	setscene SCENE_FINISHED
	waitsfx
	playmapmusic
	end
.LeaveLeft:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	step_end

Route22BlueText:
	text "<RIVAL>: Hey!"
	line "<PLAYER>!"

	para "You're going to"
	line "#MON LEAGUE?"
	
	para "Forget it! You"
	line "probably don't"
	cont "have any BADGES!"

	para "The guard won't"
	line "let you through!"

	para "By the way, did"
	line "your #MON"
	cont "get any stronger?"
	done

Route22BlueWinText:
	text "<RIVAL>: Awww!"
	line "You just lucked"
	cont "Out!"
	done

Route22BlueAfterBattleText:
	text "I heard #MON"
	line "LEAGUE has many"
	cont "tough trainers!"
	
	para "I have to figure"
	line "out how to get"
	cont "past them!"

	para "You should quit"
	line "dawdling and get"
	cont "a move on!"
	done

Route22Blue2Text:
	text "<RIVAL>: What?"
	line "<PLAYER>! What a"
	cont "surprise to see"
	cont "you here!"

	para "So you're going to"
	line "#MON LEAGUE?"

	para "You collected all"
	line "the BADGEs too?"
	cont "That's cool!"

	para "Then I'll whip you"
	line "<PLAYER> as a"
	cont "warm up for"
	cont "#MON LEAGUE!"

	para "Come on!"
	done

Route22Blue2WinText:
	text "What!?"

	para "I was just"
	line "careless!"
	prompt

Route22Blue2AfterBattleText:
	text "That loosened me"
	line "up! I'm ready for"
	cont "#MON LEAGUE!"

	para "<PLAYER>, you need"
	line "more practice!"

	para "But hey, you know"
	line "that! I'm out of"
	cont "here. Smell ya!"
	done

VictoryRoadEntranceSign:
	jumptext VictoryRoadEntranceSignText

VictoryRoadEntranceSignText:
	text "#MON LEAGUE"
	line "Front Gate"
	done

Route22_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 8,  5, VICTORY_ROAD_GATE, 1

	db 2 ; coord events
	coord_event 29,  4, SCENE_DEFAULT, Route22BlueUp
	coord_event 29,  5, SCENE_DEFAULT, Route22BlueDown

	db 1 ; bg events
	bg_event 7,  11, BGEVENT_READ, VictoryRoadEntranceSign

	db 1 ; object events
	object_event  24,  5, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route22Blue, EVENT_RIVAL_ROUTE_22
