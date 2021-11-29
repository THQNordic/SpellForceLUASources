-- This file is the init file for the editor gameview

print("EditorInit called.")
EditorRunning = 1

-- GameView members:
Lake = GameView:GetLake()
Adorn = GameView:GetAdorn()
Atmosphere = GameView:GetAtmosphere()
Camera = GameView:GetCamera()
DebugInfo = GameView:GetDebugInfo()
Illumination = GameView:GetIllumination()
ObjectLibrary = GameView:GetObjectLibrary()
Render = GameView:GetRender()
Sky = GameView:GetSky()
Ocean = GameView:GetOcean()
Terrain = GameView:GetTerrain ()	
Lightmap = Terrain:GetLightmap ()

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

-- doscript("config") -- make config values available as globals...

-- include the lighting demo functions 
doscript("conweatherinit")
-- copied from ConSystemInit:
AtmoInit()

doscript("!test\\ConTestEffects")
doscript("ConLakesInit")
LakesInit()

Render:SetFogDensity(70, 200, 0.35, 800, 0.15)


local object = ObjectLibrary:GetObject(kGtCategoryObject, 2541);
object:ElementMesh("editor_dummy_spawnpoint.msh")

print("EditorInit finished.")