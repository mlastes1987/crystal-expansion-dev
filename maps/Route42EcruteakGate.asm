	object_const_def
	const ROUTE42ECRUTEAKGATE_OFFICER
	const ROUTE42ECRUTEAKGATE_ELMS_AIDE

Route42EcruteakGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route42EcruteakGateOfficerScript:
	jumptextfaceplayer Route42EcruteakGateOfficerText

Route42EcruteakGateOfficerText:
	text "MT.MORTAR is like"
	line "a maze inside."

	para "Be careful. Don't"
	line "get lost in there."
	done

Route42EcruteakAideDexCheckScript:
	faceplayer
	opentext
	writetext AideTextGreeting
	checkevent EVENT_ECRUTEAK_GATE_AIDE
	iftrue .AlreadyGotItem
	readvar VAR_DEXCAUGHT
	ifgreater 20, .Aide20Caught
	writetext AideTextFailure
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext AideGotText
	waitbutton
	closetext
	end

.Aide20Caught
	writetext AideTextSuccess
	giveitem EXP_SHARE
	iffalse .NoRoom
	setevent EVENT_ECRUTEAK_GATE_AIDE
	waitbutton
	closetext
	end

.NoRoom
	writetext AideNoRoom
	waitbutton
	closetext
	end

AideTextGreeting:
	text "Hi! I'm Prof. Elm's"
	line "Aide!"

	para "If you have caught 20"
	line "#MON I'm supposed to"
	
	para "give you an EXP."
	line "SHARE."
	
	para "Have you caught 20 #MON?"
	done

AideTextFailure:
	text "Hmm… You don't have"
	line "enough #MON."

	para "No EXP. SHARE"
	line "for you."
	done

AideTextSuccess:
	text "Oh! You do have"
	line "enough #MON."

	para "Here's an EXP."
	line "SHARE!"
	done

AideNoRoom:
	text "Your PACK is full"
	line "it looks like."
	done

AideGotText:
	text "I will head back"
	line "to the lab soon."

	para "Good luck on your"
	line "journey"
	done

Route42EcruteakGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ECRUTEAK_CITY, 1
	warp_event  0,  5, ECRUTEAK_CITY, 2
	warp_event  9,  4, ROUTE_42, 1
	warp_event  9,  5, ROUTE_42, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route42EcruteakGateOfficerScript, -1
	object_event  2,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route42EcruteakAideDexCheckScript, EVENT_ECRUTEAK_GATE_AIDE
