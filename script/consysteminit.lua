-- This file is the init file for the console script environment
-- It is run when starting the system
-- Remember, there is also a ConUserInit.lua which is not checked in to Sourcesafe and private per user

-- redirect output to console
function _ALERT(s) Application:Log(s .. "\n") end

-- set up variables for easier use (called in GameViewInit) -----------------------------
function SetupGlobals()

	-- !!! please remember to update PkgGlobals.pkg when you change any of the assignments !!!

	local old_globals = tcopy(globals())

	-- set some Drw shortcuts
	GameControl = Application:GetGameControl()
	GameView = GameControl:GetGameView()

	-- GameView members:
	Lake = GameView:GetLake()
	Adorn = GameView:GetAdorn()
	Atmosphere = GameView:GetAtmosphere()
	Camera = GameView:GetCamera()
	DebugInfo = GameView:GetDebugInfo()
	Illumination = GameView:GetIllumination()
	ObjectLibrary = GameView:GetObjectLibrary()
	Render = GameView:GetRender()
	Selection = GameControl:GetSelection()
	Sky = GameView:GetSky()
	Ocean = GameView:GetOcean()
	Terrain = GameView:GetTerrain ()
	UnExplored = GameView:GetUnexplored()

	Lightmap = Terrain:GetLightmap ()

	-- !!! please remember to update PkgGlobals.pkg when you change any of the assignments !!!

	-- set some Gd shortcuts
	AppSession = Application:GetAppSession()
	GdMain = AppSession:GetGdMain()
	GdsMain = AppSession:GetGdsMain()

	-- GdMain members:
	AStar = GdMain:GetAStarPtr()
	Building = GdMain:GetBuildingPtr()
	BuildingToolBox = GdMain:GetBuildingToolBoxPtr()
	Effect = GdMain:GetEffectPtr()
	Figure = GdMain:GetFigurePtr()
	FigureJobs = GdMain:GetFigureJobsPtr()
	FigureToolBox = GdMain:GetFigureToolBoxPtr()
	InfluenceMap = GdMain:GetInfluenceMapPtr()
	Object = GdMain:GetObjectPtr()
	Player = GdMain:GetPlayerPtr()
	-- hat noch kein Lua Interface: ObjectToolBox = GdMain:GetObjectToolBoxPtr()
	Spell = GdMain:GetSpellPtr()
	World = GdMain:GetWorldPtr()
	WorldToolBox = GdMain:GetWorldToolBoxPtr()

	-- !!! please remember to update PkgGlobals.pkg when you change any of the assignments !!!

	-- add :Help() function to all globally registered Objects
	-- if an error occurs here (attempt to index userdata)
	-- then this means that one of the above globals has no tolua interface yet
	-- (if tolua knows something about this object, it will set up tag methods that 
	-- allow setting of arbitrary values, such as the :Help() function)
	local new_globals = {}
	for i,v in globals() do
		if old_globals[i] == nil then -- did not exist before - is a newly registered global
			tinsert(new_globals, i)
		    v.Help = tolua.info -- add :Help function
		end
	end

	-- show what globals have been created:
	sort(new_globals)
	print("Registered Objects:",strjoin(", ", new_globals))
end

-- obsolete function (replaced by the one below and only here to ease transition)
function OnGameViewInit ()
end

-- post init of game view
function ConGameMenuInit()
	SetupGlobals()
	
	--print("DEBUG: " .. tostring(DEBUG))
	--print("RELEASE: " .. tostring(RELEASE))

	--if DEBUG == 1 then
		-- create effectlist.lua for script system
		doscript("!test\\ConTestEffects")
	--end

	-- register effect names for scripting
	EffectList = doscript("EffectList")

	doscript("ConWeatherInit")
	AtmoInit()

	doscript("ConLakesInit")
	LakesInit()

	-- Fog-Dichte: (f32 _fStart, f32 _fBreak, f32 _fBreakDensity, f32 _fFar, f32 _fFarDensity)
	
	Render:SetFogDensity(70, 200, 0.35, 800, 0.15)
	-- Kameralinsenöffnung
	--	Camera:SetViewAngles(0.8, 0.8)  -- default: (0.8, 0.8)
	-- Kamerawinkel: (f32 _fMinAngle, f32 _fMaxAngle, f32 _fMinDist, f32 _fMaxDist)
	--	Camera:SetDesiredAnglesAtDistances(30, 45, 10, 45) -- default: (30, 45, 10, 45)
	-- Minimale/Maximale Kameraentfernung
	--	Camera:SetDistanceRange(10, 45)  -- default: (10, 45)
end

-- post start menu init
function ConStartMenuInit()
	-- nothing to do 
	-- print("HINWEIS: ConStartMenuInit() called .........")
end

-- post loading of a map/savegame
function ConGameMenuStart()
    -- nothing to do
	-- print("HINWEIS: ConGameMenuStart() called .........")
	
	-- include debug functions (mainly for scripting/QA)
	-- allow these functions to be registered even in release version
	doscript("!test\\ConDebug")
	-- script variable & queststate wrapper zum debuggen:
	doscript("GdsVariables")

	-- FIXME: only call in debug build!
	if DEBUG == 1 then
		doscript("!test\\GdsWatchedVarsTemp.lua")

		-- benchmarking script, must come after balancing!
		doscript("!test\\Benchmark")
	end
end

-- dummy function to avoid error messages
-- this function is an option to be overwritten in conuserinit.lua
function ConGameMenuUserInit()
end

-- dummy function to avoid error messages
-- this function is an option to be overwritten in conuserinit.lua
function ConStartMenuUserInit()
end

-- dummy function to avoid error messages
function ConTrigger(_iStep)
end

-- dummy function to avoid error messages
-- this function is an option to be overwritten in conuserinit.lua
-- post loading of a map/savegame
function ConGameMenuUserStart()
	-- Var watching für NPC script vars:
	-- print("HINWEIS: ConGameMenuUserStart() called .........")
end

-- make OnGameViewInit called after initialising the game
AppMenu = Application:GetAppMenu()
AppMenu.OnGameViewInit = Application:MakeCallback ("OnGameViewInit")
Setup = Application:GetAppSession():GetGdMain():GetSetupPtr()
-- wurde gekickt, kein Zugriff aus der Konsole mehr?!: Snd = Application:GetSndMain()

-- this function can be used to extract performance data... will be called every frame...
function FrameStatistics(fFrameTime, fRenderTime, iNumOfTriangles, iNumOfTextureChanges)
-- doesn't do anything at the moment...
end

-- backward compatibility
output = print

doscript("config") -- make config values available as globals...


-- FIXME: these DOFILEs only for debug build, REMOVE in Master Candidate:
if DEBUG == 1 then
	-- include the lighting demo functions + figure/anim test
	doscript("!test\\ConTestFigures")
	doscript("!test\\ConTestFigures2")
	doscript("!test\\ConTestAnims")
end

-- arena hängt nur an der config.lua Debug sektion...
-- FIXME: im release komplett rausnehmen!
if Debug then
	-- for balancing, only active in arena map
	print("Arena Enabled !!!")
	doscript("!test\\ConBalanceFigures3")
end
