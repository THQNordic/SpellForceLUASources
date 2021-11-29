-- You Are Currently Editing: 
-----------------------------
--		GdsDefines.lua
-----------------------------

-- globale variablen fürs GDS system werden hier definiert!
function DefineGlobalConstants()
	-- define global constants
	FALSCH	= 0
	WAHR	= 1
	FALSE	= 0
	TRUE	= 1
	
	------------------ ACTIONS ----------------------------------------------------
	StateUnknown	= kDbQuestStateUnknown
	StateUnsolvable	= kDbQuestStateUnsolvable
	StateKnown		= kDbQuestStateKnown
	StateActive		= kDbQuestStateActive
	StateSolved		= kDbQuestStateSolved
	
	-- if QuestStatesPrintedBefore == nil then
	if nil then
		QuestStatesPrintedBefore = 1
		print("QuestState Values:")
		print("\tUnknown\t = \t" .. StateUnknown)
		print("\tUnsolvable\t = \t" .. StateUnsolvable)
		print("\tKnown\t = \t" .. StateKnown)
		print("\tActive\t = \t" .. StateActive)
		print("\tSolved\t = \t" .. StateSolved)
	end

	-- Owner (0 = Npc, !0 = Player)
	Avatar			= 0

	------------- VARIABLES ---------------------------------------------------------
	Add				= kDbScriptVariableOperatorAdd
	OperatorAdd				= kDbScriptVariableOperatorAdd
	OperatorInvertBool		= kDbScriptVariableOperatorInvertBool
	OperatorSetRandom		= kDbScriptVariableOperatorSetRandom
	
	GlobalVariable	= 0
	NpcVariable		= 0
	PlayerVariable	= 1
	
	IsEqual			= kDbScriptVariableCompareEqual
	IsGreater		= kDbScriptVariableCompareGreater
	IsGreaterOrEqual = kDbScriptVariableCompareGreaterEqual
	IsLess			= kDbScriptVariableCompareLess
	IsLessOrEqual	= kDbScriptVariableCompareLessEqual
	IsNotEqual		= kDbScriptVariableCompareNotEqual
	

	if not ConsoleDebug or ConsoleDebug == FALSE then
		-- seed the random number generator
		if NpcId and NpcX and NpcY then
			randomseed(NpcId * NpcX * NpcY)
		else
			randomseed(tonumber(date("%H%M%S")))
		end
		-- einmal random, weil erster wert immer derselbe
		random(100)
	
		-- Goto command
		Walk	= 0
		Run		= 1
		-- RTS Spawning
		None	= 0
		Once	= -1
		
		-- spawn delay für animal clans
		AnimalSpawnTime = 300

		-- für cutscenes
		WaitForEndOfSpeech = 1

		-- TargetTypes:
		Figure			= 1
		Building		= 2
		Object			= 3
		World			= 4
		Area			= 5
		
		Take			= kGtScriptTransferFlagTake
		Give			= kGtScriptTransferFlagGive
		Exchange		= kGtScriptTransferFlagExchange
		
		SlotHead		= 0
		SlotRightHand	= 1
		SlotChest		= 2
		SlotLeftHand	= 3
		SlotRightRing	= 4
		SlotLegs		= 5
		SlotLeftRing	= 6
		
		East			= kGdDirectionEast
		SouthEast		= kGdDirectionSouthEast
		South			= kGdDirectionSouth
		SouthWest		= kGdDirectionSouthWest
		West			= kGdDirectionWest
		NorthWest		= kGdDirectionNorthWest
		North			= kGdDirectionNorth
		NorthEast		= kGdDirectionNorthEast
		NumDirections	= 8
		
		FaceDirection	= kGdsFaceDirection
		FaceNpc			= kGdsFaceNpc
		
		-- skill levels
		SkillEasy	= 0
		SkillNormal	= 1
		SkillHard	= 2
		
		-- ai goals
		GoalDefault		= 0
		GoalIdle		= 1
		GoalNomadic		= 3
		GoalAggressive	= 4
		GoalDefensive	= 5
		GoalScript		= 6
		GoalCoopAggressive	= 7
		GoalCoopDefensive	= 8
		GoalNone		= 9

		GoodBoard		= kGdGoodBoard
		GoodStone		= kGdGoodStone
		GoodMithril		= kGdGoodMithril
		GoodFood		= kGdGoodFood
		GoodIron		= kGdGoodIron
		GoodManaElixir	= kGdGoodManaElixir
		GoodManaHerb	= kGdGoodManaHerb
		
		SideLight		= kGdRaceTypeGood
		SideDark		= kGdRaceTypeEvil
		SideAll			= 0		-- nur für resource condition!!
	
		-- goto modes
		GotoNormal		= kGtWalkModeNormalGoto
		GotoForced		= kGtWalkModeForceGoto
		GotoContinous	= kGtWalkModeContinuousGoto
		GotoContinuous	= kGtWalkModeContinuousGoto

		-- dialog types
		MainQuest		= TRUE
		SideQuest		= FALSE
		
		------------------ CONDITIONS ----------------------------------------------------
		OwnerNpc		= kGdsOwnerNpc
		OwnerPlayer		= kGdsOwnerPlayer
		OwnerAll		= kGdsOwnerAll
		
		FigureAvatar	= kGdsFigureAvatar
		FigureHero		= kGdsFigureHero
		FigureRest		= kGdsFigureRest
		FigureAll		= kGdsFigureAll
	
		JobIdle	= CGdsFigureJob.kJobIdle
		
		-- Player Skills:
		-- hauptskills
		LeichteKriegskunst	= {Skill = 1, Spec = 0}
		SchwereKriegskunst	= {Skill = 2, Spec = 0}
		Fernkampf			= {Skill = 3, Spec = 0}
		WeisseMagie			= {Skill = 4, Spec = 0}
		ElementarMagie		= {Skill = 5, Spec = 0}
		MentalMagie			= {Skill = 6, Spec = 0}
		SchwarzeMagie		= {Skill = 7, Spec = 0}
		-- leichte kriegskunst
		Stichwaffen = {Skill = 1, Spec = 1}
		KleineSchwerter = {Skill = 1, Spec = 2}
		KleineSchlagwaffen = {Skill = 1, Spec = 3}
		LeichteRuestungen = {Skill = 1, Spec = 4}
		-- schwere kriegskunst
		GrosseSchwerter = {Skill = 2, Spec = 1}
		GrosseSchlagwaffen = {Skill = 2, Spec = 2}
		SchwereRuestungen = {Skill = 2, Spec = 3}
		Schilde = {Skill = 2, Spec = 4}
		-- fernkampf
		Bogen = {Skill = 3, Spec = 1}
		Armbrust = {Skill = 3, Spec = 2}
		-- weisse magie
		Leben = {Skill = 4, Spec = 1}
		Natur = {Skill = 4, Spec = 2}
		Segnung = {Skill = 4, Spec = 3}
		-- elementarmagie
		Feuer = {Skill = 5, Spec = 1}
		Eis = {Skill = 5, Spec = 2}
		Erde = {Skill = 5, Spec = 3}
		-- mentalmagie
		Verzauberung = {Skill = 6, Spec = 1}
		Offensiv = {Skill = 6, Spec = 2}
		Defensiv = {Skill = 6, Spec = 3}
		-- schwarze magie
		Tod = {Skill = 7, Spec = 1}
		Nekromantie = {Skill = 7, Spec = 2}
		Fluch = {Skill = 7, Spec = 3}

		-- Player Stats
		Agi	= kGtMsgStatAgi
		Cha	= kGtMsgStatCha
		Dex	= kGtMsgStatDex
		Int = kGtMsgStatInt
		Sta = kGtMsgStatSta
		Str = kGtMsgStatStr
		Wis = kGtMsgStatWis

		InvEquipment	= kUi_imEquipment
		InvSpellBook	= kUi_imSpellbook
		InvRuneBoard	= kUi_imRuneboard
		InvPlans		= kUi_imBuildingAndUnit
		InvQuestBook	= kUi_imQuestbook
		InvMerchant		= kUi_imMerchant
		InvCharacter	= kUi_imCharInfo
		
		PointsStats		= kGdsStat
		PointsSkills	= kGdsAbility
		PointsBoth		= kGdsStatAndAbility

		AlertAttack		= kAttack
		AlertScout		= kAttackAlly
		AlertNotify		= kInstruction
		AlertDragica	= kEnemySpotted

		EquipmentAvatar	= kGtAvatar  ---überprüft nur auf equipped
		EquipmentHero	= kGtHeros   ---überprüft nur auf equipped
		EquipmentAll	= kGtAll     ---überprüft alle und alles - auch nicht equipped

		-- SOUNDS --
		local i = 353
		SoundAttackSignalTroops = i;		i = i + 1;
		SoundColosseumApplause = i;		i = i + 1;
		SoundColosseumBoohs = i;			i = i + 1;
		SoundColosseumCheers = i;		i = i + 1;
		SoundDragonSpawn = i;			i = i + 1;
		SoundEmpyriaBard1 = i;			i = i + 1;
		SoundEmpyriaBard2 = i;			i = i + 1;
		SoundEmpyriaBard3 = i;			i = i + 1;
		SoundEmpyriaBard4 = i;			i = i + 1;
		SoundEmpyriaBazaar1 = i;			i = i + 1;
		SoundEmpyriaBazaar2 = i;			i = i + 1;
		SoundEmpyriaCrowd1 = i;			i = i + 1;
		SoundEmpyriaCrowd2 = i;			i = i + 1;
		SoundHowlingHeads = i;			i = i + 1;
		SoundPentacleDestroyed = i;		i = i + 1;
		SoundSacredFreedom = i;			i = i + 1;
		SoundStoneExplosion = i;			i = i + 1;
		SoundVolcanoGrumble = i;			i = i + 1;

		-------------------- COLORS -------------------------------------
		ColorWhite			=	kMnu_csWhite		-- = 0xCBCBCB, //white
		if not ColorWhite then ColorWhite = 4294967040 end
		ColorPureWhite		=	kMnu_csFull			-- = 0xFFFFFF, //pure white
		ColorPureBlack		=	kMnu_csBlack		-- = 0x000000, //black
		ColorPureRed		=	kMnu_csPureRed		-- = 0xFF0000, //red
		ColorPureGreen		=	kMnu_csPureGreen	-- = 0x00FF00, //green
		ColorPureBlue		=	kMnu_csPureBlue		-- = 0x0000FF, //blue
		
		--	//other             -- 
		ColorDarkOrange		=	kMnu_csDarkOrange
		ColorBurntOrange	=	kMnu_csBurntOrange	-- = 0xCC9933,
		ColorSienna			=	kMnu_csSienna		-- = 0x993300,
		ColorRed			=	kMnu_csRed			-- = 0xFF3300,
		ColorDarkRed		=	kMnu_csDarkRed		-- = 0x990000,
		
		ColorSalmon			=	kMnu_csSalmon		-- = 0xFFCCCC,
		ColorPink			=	kMnu_csPink			-- = 0xFFCCFF, 
		ColorMagenta		=	kMnu_csMagenta		-- = 0xFF00FF, 
		ColorPurple			=	kMnu_csPurple		-- = 0xCC3399, 
		
		ColorViolett		=	kMnu_csViolett		-- = 0x660066,
		ColorLilac			=	kMnu_csLilac		-- = 0xCCCCFF,
		ColorLightBlue		=	kMnu_csLightBlue	-- = 0x6699CC,
		ColorRoyalBlue		=	kMnu_csRoyalBlue	-- = 0x3300FF,
		
		ColorDarkBlue		=	kMnu_csDarkBlue		-- = 0x333399,
		ColorLightCyan		=	kMnu_csLightCyan	-- = 0xCCFFFF,
		ColorCyan			=	kMnu_csCyan			-- = 0x00FFFF,
		ColorDarkCyan		=	kMnu_csDarkCyan		-- = 0x669999,
		
		ColorMint			=	kMnu_csMint			-- = 0xCCFFCC,
		ColorDarkMint		=	kMnu_csDarkMint		-- = 0x00CCCC,
		ColorLightGreen		=	kMnu_csLightGreen	-- = 0xCCFFCC,
		ColorGreen			=	kMnu_csGreen		-- = 0x33CC00,
		
		ColorGrassGreen		=	kMnu_csGrassGreen	-- = 0x66FF66,
		ColorSpringGreen	=	kMnu_csSpringGreen	-- = 0xCCFF00,
		ColorKhaki			=	kMnu_csKhaki		-- = 0x999933,
		ColorOlive			=	kMnu_csOlive		-- = 0x336600,
		
		ColorYellow			=	kMnu_csYellow		-- = 0xFFFF00,
		ColorLightYellow	=	kMnu_csLightYellow	-- = 0xFFFFCC,
		ColorSand			=	kMnu_csSand			-- = 0xCCCC00,
		ColorGrey			=	kMnu_csGrey			-- = 0x666666,
		
		--	//create character
		--Color =	kUi_csHeader			-- = 0xE8BA4C,
		--Color =	kUi_csCCGreen			-- = 0x1AE889,
		--Color =	kUi_csCCYellow			-- = 0xB8A44B, //darker than orange
		--Color =	kUi_csCCGrey			-- = 0xD7D7D7, //default
		--Color =	kUi_csOrange			-- = 0xDF7D3B,
		ColorGold =	kUi_csGold				-- = 0xF7DD92, //used in character create
		--Color =	kUi_csGrey				-- = 0x75757D, //used in character create
		--Color =	kUi_csBeige				-- = 0xF7DD92, //used in character create
		--Color =	kUi_csRuneActive		-- = 0xAA6300, //used for active rune
		--Color =	kUi_csCoinGold			-- = kUi_csGold, //coins
		--Color =	kUi_csCoinSilver		-- = kMnu_csWhite, //coins
		--Color =	kUi_csCoinCopper		-- = kUi_csOrange, //coins
		--Color =                          -- 
		--Color =	kUi_csPlus				-- = 0x5AC376,
		--Color =	kUi_csMinus				-- = kMnu_csPureRed,
		--Color =                          -- 
		--Color =	//monument	            -- 
		--Color =	kUi_csMonCount			-- = 0xFFCC00,
		--Color =                          -- 
		--Color =	//dialog                -- 
		--Color =	kUi_csNPCHead			-- = 0xFFBA00,
		--Color =	kUi_csNPCTalk			-- = 0xFFEAB1,
		--Color =	                        -- 
		--Color =	kUi_csPCHead			-- = 0xFFBA00,
		--Color =	kUi_csPCTalk			-- = 0xA7D0FF,
		--Color =	kUi_csPCTalkMouseOver	-- = 0xE2F0FF,
		--Color =	kUi_csPCTalkMouseDown	-- = 0x83FF73,
		--Color =                          -- 
		--Color =	kUi_csPCTalkNum			-- = 0x83FF73, //number to be pressed
		--Color =                          -- 
		--Color =	//extended tooltip      -- 
		--Color =	kUi_csXTHeader			-- = 0xFFCB4D,
		--Color =	kUi_csXTStatsHeader		-- = 0xBEBEBE,
		--Color =	kUi_csXTStatsValue		-- = 0xFFFFFF,
		--Color =	kUi_csXTStatsValueNeg	-- = 0xFF4D4D,
		--Color =	kUi_csXTContext			-- = 0x1AE889, //additional info
		--Color =                          -- 
		--Color =	//quests                -- 
		--Color =	kUi_csQuestHeader		-- = 0xFFB400,
		--Color =	kUi_csQuestCurrent		-- = 0xFFFFFF, //selected
		--Color =	kUi_csQuestUnsolved		-- = 0xFFE197,
		--Color =	kUi_csQuestSolved		-- = 0xB4B4B4,
		--Color =	kUi_csQuestUnsolvable	-- = kUi_csQuestSolved,
		--Color =	kUi_csQuestXTooltip		-- = 0xFFFFFF, //standard font color
		--Color =                          -- 
		--Color =	//resourcen             -- 
		--Color =	kUi_csResGood			-- = 0xFFFFFF,
		--Color =	kUi_csResEvil			-- = 0xAFAFAF,
		--Color =	kUi_csResInsuff			-- = 0xFF4D4D,
		--Color =                          -- 
		--Color =	//char info             -- 
		--Color =	kUi_csCIHeader			-- = 0xFFCB4D,
		--Color =	kUi_csCIStatsHeader		-- = 0xD7D7D7,
		--Color =	kUi_csCIStatsValue		-- = 0xD7D7D7,
		--Color =	kUi_csCIStatsValuePos	-- = 0x1AE889,
		--Color =	kUi_csCIStatsValueNeg	-- = 0xFF4D4D,
		--Color =	kUi_csCIInfo			-- = 0x1AE889,
		--Color =                          -- 
		--Color =	//life/mana bar         -- 
		--Color =	kUi_csLife100			-- = 0x0DCE03,
		--Color =	kUi_csLife075			-- = 0xC0E900,
		--Color =	kUi_csLife050			-- = 0xFFD200,
		--Color =	kUi_csLife025			-- = 0xFF2D01,
		--Color =	kUi_csMana100			-- = 0x00AEF8,
		--Color =	kUi_csMana075			-- = 0x00A3E9,
		--Color =	kUi_csMana050			-- = 0x0099D9,
		--Color =	kUi_csMana025			-- = 0x0084BB,
		--Color =	kUi_csLifeZero			-- = 0x661200,
		--Color =	kUi_csManaZero			-- = 0x00025D,
		--Color =                          -- 
		--Color =	//minimap (faction)     -- 
		--Color =	kUi_csFacOwned			-- = 0x00FE20, //green
		--Color =	kUi_csFacEnemy			-- = 0xFF5300, //red
		--Color =	kUi_csFacAllied			-- = 0x63C6FF, //blue
		--Color =	kUi_csNotAttack			-- = 0xFF5300, //red	- notify
		--Color =	kUi_csNotLocation		-- = 0x63C6FF, //blue	- notify
		--Color =	kUi_csPortal			-- = kUi_csGold, //%$ todo
		--Color =	kUi_csMonument			-- = 0xFFC600, //orange/yellow
		--Color =                          -- 
		--Color =	//save menu             -- 
		--Color =	kUi_csSMHeaderInfo		-- = 0xA7A7A7, 
		--Color =	kUi_csSMBackground		-- = 0x0042CC, 
		--Color =                          -- 
		--Color =	kUi_csMax				-- = 0xFFFFFF,
	end
end
