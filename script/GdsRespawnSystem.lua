-- GdsCreateDoc HTML doc generator needs these:
numdoc = 1
doc = {}


REM = [[

Rebirth
{
	WaitTime = 120,
	X = 100, Y = 200,	-- fallback position when no bindstone is in use
	BindStones = {
		[1] = {X = 10, Y = 20, Actions = {} },
		[2] = {X = 20, Y = 30, Actions = {} },
		[3] = {X = 40, Y = 40, Actions = {} },
		[4] = {X = 80, Y = 50, Actions = {} },
	},
	params.DeathActions = params.DeathActions or {}
	params.Conditions = params.Conditions or {}
	params.NoSpawnEffect = params.NoSpawnEffect or FALSE
}

PlatformInitAction( spawnflag true )
Umspawn wenn spawnflag true, spawnflag dann false

]]

-- **DOC** ------------------------------------------------------------------
function RebirthSpecial(params)
	-- prüfe den Datensatz
	local FuncName = "GDS: RebirthSpecial(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.BindStones, FuncName .. "MISSING PARAMETER: BindStones =")
	assert2(getn(params.BindStones) > 0, FuncName .. "INVALID PARAMETER: BindStones table is empty ...")
	assert2(params.WaitTime, FuncName .. "MISSING PARAMETER: WaitTime =")
	assert2(params.WaitTime > 0, FuncName .. "INVALID PARAMETER: WaitTime must be > 0")
	params.X = params.X or 0
	params.Y = params.Y or 0
	params.DeathActions = params.DeathActions or {}
	params.Actions = params.Actions or {}
	params.Conditions = params.Conditions or {}
	params.NoSpawnEffect = params.NoSpawnEffect or TRUE
	assert2(getn(tkeys(params)) == 8, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	assert2(getn(RespawnDataSet) == 0, FuncName .. "Respawn and Rebirth don't mix!")

	if getn(params.DeathActions) > 0 then
		foreachi(params.DeathActions, function(i, item)
			tinsert(DeathActionData, item)
		end)
	end
	tinsert(RebirthDataSet, params)
	
	PlatformInitAction( SetNpcFlagTrue{Name = "RebirthSpecialUmspawnFlag"} )
	PlatformInitAction( SetNpcTimeStamp{Name = "RebirthSpecialUmspawnTimer"} )

	
	-- umspawnen bei plattform betreten
	Umspawn
	{
		X = 0, Y = 0, Target = Avatar,
		NoSpawnEffect = TRUE, OnlyOnce = FALSE,
		Conditions = {
			IsNpcFlagTrue{Name = "RebirthSpecialUmspawnFlag", UpdateInterval = 5},
			IsNpcTimeElapsed{Name = "RebirthSpecialUmspawnTimer", UpdateInterval = 10, Seconds = 1,},
		}, 
		Actions = {
			SetNpcFlagFalse{Name = "RebirthSpecialUmspawnFlag"},
			SetEffect {Effect = "BuildingFire", NpcId = 0, Length = 65000},
			ClearNpcTimeStamp{Name = "RebirthSpecialUmspawnTimer"},
			--Follow {Target = Avatar},
		},
	}

	---- umspawnen bei spielertod ...
	--Umspawn
	--{
	--	X = 0, Y = 0, Target = Avatar,
	--	NoSpawnEffect = TRUE, OnlyOnce = FALSE,
	--	Conditions = {
	--		FigureDead{NpcId = Avatar},
	--	}, 
	--	Actions = {
	--		SetEffect {Effect = "Spawnboss", NpcId = 0, Length = 65000},
	--		--Follow {Target = Avatar},
	--		SetEffect {Effect = "Lightning", NpcId = 0, Length = 65000},
	--	},
	--}
end

doc[numdoc] = [[Params: <code>WaitTime = , X = startX, Y = startY, BindStones = { [1] = {X = , Y = }, } NoSpawnEffect = FALSE ,<br>Conditions = { ... } , Actions = { ... } , DeathActions = { ... } </code><br> ... rebirth spezial für Grim & Lea ...]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ------------------------------------------------------------------
function Rebirth(params)
	-- prüfe den Datensatz
	local FuncName = "GDS: Rebirth(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.BindStones, FuncName .. "MISSING PARAMETER: BindStones =")
	assert2(getn(params.BindStones) > 0, FuncName .. "INVALID PARAMETER: BindStones table is empty ...")
	assert2(params.WaitTime, FuncName .. "MISSING PARAMETER: WaitTime =")
	assert2(params.WaitTime > 0, FuncName .. "INVALID PARAMETER: WaitTime must be > 0")
	params.X = params.X or 0
	params.Y = params.Y or 0
	params.DeathActions = params.DeathActions or {}
	params.Actions = params.Actions or {}
	params.Conditions = params.Conditions or {}
	params.NoSpawnEffect = params.NoSpawnEffect or TRUE
	assert2(getn(tkeys(params)) == 8, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	assert2(getn(RespawnDataSet) == 0, FuncName .. "Respawn and Rebirth don't mix!")

	if getn(params.DeathActions) > 0 then
		foreachi(params.DeathActions, function(i, item)
			tinsert(DeathActionData, item)
		end)
	end
	tinsert(RebirthDataSet, params)
end

doc[numdoc] = [[Params: <code>WaitTime = , X = startX, Y = startY, BindStones = { [1] = {X = , Y = }, } NoSpawnEffect = FALSE,<br>Conditions = { ... } , Actions = { ... } , DeathActions = { ... } </code><br> ... ]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ------------------------------------------------------------------
function SpawnOnlyWhen(params)
	-- prüfe den Datensatz
	local FuncName = "GDS: SpawnOnlyWhen(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")	
	assert2(params.Conditions, FuncName .. "MISSING PARAMETER: Conditions = {...}")
	params.Actions = params.Actions or {}
	params.Target = params.Target or -1
	params.X = params.X or NpcX
	params.Y = params.Y or NpcY
	params.Clan = params.Clan or 0
	params.UnitId = params.UnitId or 0
	params.NoSpawnEffect = params.NoSpawnEffect or FALSE
	assert2(getn(tkeys(params)) == 8, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	assert2(SpawnDead == FALSE, FuncName .. "ERROR: This command may only be used ONCE per NPC!")
	assert2(PlatformInitActionCalled ~= TRUE, FuncName .. "can NOT be used together with PlatformInitAction() !!!")

	-- wg. idlehome ausrichtung...
	tinsert(params.Actions, SetNpcFlagTrue{Name = "IchHabeEinenDialogBeendet"})

	-- set global var that reroutes _INIT transition to the BornDead State... (in CreateBase)
	SpawnDead = TRUE
	BornDeadData = params
end

doc[numdoc] = [[Params: <code>X = 0, Y = 0, Clan = 0, UnitId = 0, NoSpawnEffect = FALSE, Target = none, <br>Conditions = { ... } , Actions = { ... } </code><br>Dieser Befehl erlaubt es einen NPC erst dann auf der map zu spawnen, wenn die Conditions zutreffen. Er wird also solange "unsichtbar" oder "tot" warten, bis er spawnen darf. Solange prüft er keine anderen events oder sonstige Scriptereignisse. Zusätzlich können noch Actions ausgeführt werden beim Spawn. Spawnen tut er per default an der position wo er in der map gesetzt wurde, man kann aber mittels X = und Y = auch eine andere position angeben (z.b. wenn mehrere units auf demselben punkt spawnen müssen).<br>Die InitActions() werden aber wie gehabt zu Beginn der Map ausgeführt, wenn der NPC welche hat. Auch der Respawn bleibt davon unberührt, und dessen Conditions werden erst nach dem ersten "realen" Tod des NPC geprüft. Technisch gesehen befindet sich der NPC also in einem Subraum zwischen _INIT und _IDLE State und wartet auf seine Korporalwerdung.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ------------------------------------------------------------------
function Respawn(params)
	-- prüfe den Datensatz
	local FuncName = "GDS: Respawn(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.WaitTime, FuncName .. "MISSING PARAMETER: WaitTime =")
	assert2(params.WaitTime > 0, FuncName .. "INVALID PARAMETER: WaitTime must be > 0")
	params.X = params.X or 0
	params.Y = params.Y or 0
	params.Target = params.Target or -1
	params.UnitId = params.UnitId or 0
	params.Clan = params.Clan or 0
	params.Chief = params.Chief or {}
	params.Actions = params.Actions or {}
	params.DeathActions = params.DeathActions or {}
	params.Conditions = params.Conditions or {}
	params.NoSpawnEffect = params.NoSpawnEffect or FALSE
	assert2(getn(tkeys(params)) == 11, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	assert2(getn(RebirthDataSet) == 0, FuncName .. "Respawn and Rebirth don't mix!")


	-- wg. idlehome ausrichtung...
	tinsert(params.Actions, SetNpcFlagTrue{Name = "IchHabeEinenDialogBeendet"})

	if getn(params.DeathActions) > 0 then
		foreachi(params.DeathActions, function(i, item)
			tinsert(DeathActionData, item)
		end)
	end
	tinsert(RespawnDataSet, params)
end

doc[numdoc] = [[Params: <code>WaitTime = , UnitId = self, Clan = 0, Target = none, X = startX, Y = startY, Chief = none, NoSpawnEffect = FALSE, Conditions = { ... }, Actions = { ... }, DeathActions = { ... } </code><br>Chief = { ... } enthält eine oder mehrere NPC IDs von Vorgesetzten, etwa so: Chief = { 1250, 1260, 1044, 2003 } bzw. bei einem einzelnen spawnboss alternativ: Chief = 1240<br>Respawn (erneut auf map erscheinen) Funktion für den NPC. Der Befehl funktioniert unabhängig vom Tagesablauf. Er wird aktiv sobald der NPC gestorben ist.<br>WaitTime ist die Zeit (in Sekunden) die mindestens vergehen muss bevor der neue NPC nach dem Ableben des vorigen erscheint.<br>UnitId ist nicht zu verwechseln mit der NPC ID! Die UnitId sagt (anhand der db) welcher NPC erscheinen soll, es kann also auch ein ganz anderer Typ NPC gewählt werden. So kann nach dem Tod eines einfachen Goblins dieser als gefährlicher Golem neu erscheinen. Lässt man UnitId weg, so wird derselbe Typ wieder gespawned, was man in 99% der Fälle auch so lassen sollte.<br>X und Y sind die Gridkoordinaten auf der Map, wie gehabt. Lässt man die weg, erscheint der NPC an der Stelle wo er in der map gesetzt wurde. Das macht auch am meisten Sinn.<br>Chief ist die NPC ID eines Anführers. Nur wenn der NPC mit dieser ID auf der Karte ist und lebt, dann wird auch der NPC mit Respawn wieder erscheinen. So wird das spawnen von „Hilfskämpfern“ bei einem Boss Monster automatisch unterbunden, sobald der Boss tot ist.<br>Conditions sind zusätzliche Bedingungen die erfüllt sein müssen, damit der NPC spawnen darf.<br>Actions sind zusätzliche Aktionen die der NPC sofort nach dem spawnen ausführen soll.<br>DeathActions sind dagegen die Aktionen, die der NPC beim sterben ausführen soll.<br>Für zufällige Variation der Spawnzeit eines NPC kann man auf die WaitTime random(x) aufaddieren, wobei x eine beliebige Anzahl Sekunden ist. Allerdings wird diese zufällige Spawnzeit nur beim Mapstart festgelegt, und nicht bei jedem Spawn zufällig neu gesetzt.<br>Respawn kann je
tzt ausserdem mehrfach pro NPC verwendet werden!]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ------------------------------------------------------------------
function Despawn(params)
	-- prüfe den Datensatz
	local FuncName = "GDS: Despawn(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	params.Conditions = params.Conditions or {}
	params.Actions = params.Actions or {}
	params.PlayDeathAnim = params.PlayDeathAnim or FALSE
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	tinsert(DespawnDataSet, params)
end

doc[numdoc] = [[Params: <code>PlayDeathAnim = FALSE,<br>Conditions = { ... }, Actions = { ... }</code><br>Mit diesem Befehl kann man den NPC Despawnen (von der Map verschwinden und auf Respawn warten) lassen. Conditions müssen gesetzt sein, Actions sind optional. Ein NPC kann mehrere Despawn Events haben. NEU: PlayDeathAnim = TRUE würde den NPC nicht Despawnen, sondern töten wodurch seine Sterbe-Anim abgespielt wird. Technisch ändert sich dadurch nichts.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ------------------------------------------------------------------
function Umspawn(params)
	local FuncName = "GDS: Umspawn(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	params.Conditions = params.Conditions or {}
	params.Actions = params.Actions or {}
	params.PlayDeathAnim = params.PlayDeathAnim or FALSE
	params.Target = params.Target or -1
	params.X = params.X or 0
	params.Y = params.Y or 0
	params.UnitId = params.UnitId or 0
	params.Clan = params.Clan or 0
	params.NoSpawnEffect = params.NoSpawnEffect or FALSE
	params.OnlyOnce = params.OnlyOnce or TRUE
	assert2(getn(tkeys(params)) == 10, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	tinsert(UmspawnDataSet, params)
end

doc[numdoc] = [[Params: <code>UnitId = self, Clan = 0, X = startX, Y = startY, Target = none, NoSpawnEffect = FALSE, OnlyOnce = TRUE, PlayDeathAnim = FALSE,<br>Conditions = { ... } , Actions = { ... }</code><br>Umspawn (verschwinden und sofort wieder auf map erscheinen) Funktion für den NPC.<br>UnitId ist nicht zu verwechseln mit der NPC ID! Die UnitId sagt (anhand der db) welcher NPC erscheinen soll, es kann also auch ein ganz anderer Typ NPC gewählt werden. So kann nach dem Tod eines einfachen Goblins dieser als gefährlicher Golem neu erscheinen. Lässt man UnitId weg, so wird derselbe Typ wieder gespawned.<br>X und Y sind die Gridkoordinaten auf der Map, wie gehabt. Lässt man die weg, erscheint der NPC an der Stelle wo er in der map gesetzt wurde. Das macht auch am meisten Sinn.<br>Conditions sind Bedingungen die erfüllt sein müssen, damit der NPC umspawnen darf.<br>Actions sind zusätzliche Aktionen die der NPC sofort nach dem umspawnen ausführen soll.<br>Target ist eine NpcId, wenn gesetzt, dann wird der NPC an der Position des angegebenen NPCs gespawnt anstatt an fixen Koordinaten.<br>HINWEIS: wenn das umspawnen relativ zu einer NpcID erfolgen soll, so wird die figur verschwinden und nur dann am ziel erscheinen wenn auch die Figur mit der entspr. NpcId am Leben ist! Ansonsten wird sie solange verschwunden bleiben und auf die Zielfigur warten bis diese am Leben ist.]]
doc[numdoc] = nil
numdoc = numdoc + 1


-- **DOC** ------------------------------------------------------------------
function UmspawnToAvatar(params)
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	params.Conditions = params.Conditions or {}
	params.Actions = params.Actions or {}
	params.PlayDeathAnim = params.PlayDeathAnim or FALSE
	params.Target = params.Target or -1
	params.X = params.X or 0
	params.Y = params.Y or 0
	params.UnitId = params.UnitId or 0
	params.Clan = params.Clan or 0
	params.NoSpawnEffect = params.NoSpawnEffect or FALSE
	params.OnlyOnce = params.OnlyOnce or TRUE
	params.DisableFirstMapLoadUmspawn = params.DisableFirstMapLoadUmspawn or TRUE
	params.FollowPlayer = params.FollowPlayer or TRUE
	assert2(getn(tkeys(params)) == 12, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- umspawn flag setzen bei spielertod
	OnToggleEvent
	{
		OnConditions = 
		{
			FigureDead{NpcId = Avatar},
		},
		OnActions = 
		{
		},
		OffConditions = 
		{
			FigureAlive{NpcId = Avatar},
		},
		OffActions = 
		{
			SetNpcFlagTrue{Name = "BitteUmspawnen"},
		}
	}
	-- umspawn flag setzen bei plattformwechsel
	OnPlatformOneTimeEvent
	{
		Conditions =
		{
		},
		Actions = 
		{
			SetNpcFlagTrue{Name = "BitteUmspawnen"},
		}
	}

	if params.DisableFirstMapLoadUmspawn == TRUE then
		-- gleich wieder löschen beim allerersten mal (verhindert vor- bzw. nach-cutscene umspawn-problem)
		NewState{Name = "AvoidUmspawnAfterMapStartCutscene"}
		AddTransition
		{
			From = "_IDLE", To = "AvoidUmspawnAfterMapStartCutscene", RemoveTransitionAfterUse = TRUE,
			Conditions = {IsNpcFlagTrue{Name = "BitteUmspawnen", UpdateInterval = 1}},
			Actions = {SetNpcFlagFalse{Name = "BitteUmspawnen"}},
		}
		AddTransition
		{
			From = "AvoidUmspawnAfterMapStartCutscene", To = "_IDLE", RemoveTransitionAfterUse = TRUE,
			Conditions = { }, Actions = { },
		}
	end
	
	
	--Umspawn, wenn Spieler tot mit Follow auf Avatar
	tinsert(params.Conditions, 1, ODER(AvatarLocalTeleport{}, IsNpcFlagTrue{Name = "BitteUmspawnen", UpdateInterval = 3}) )
	tinsert(params.Actions, SetNpcFlagFalse{Name = "BitteUmspawnen"} )
	if params.FollowPlayer == TRUE then
		tinsert(params.Actions, Follow{Target = 0} )
	end

	Umspawn 
	{
		UnitId = params.UnitId, 
		Clan = params.Clan, 
		X = params.X, 
		Y = params.Y,
		Target = params.Target,
		NoSpawnEffect = params.NoSpawnEffect,
		OnlyOnce = params.OnlyOnce,
		Conditions = params.Conditions, 
		Actions = params.Actions,
	}
end
doc[numdoc] = [[Params: <code>UnitId = self, Clan = 0, X = startX, Y = startY, Target = none, NoSpawnEffect = FALSE, OnlyOnce = TRUE, PlayDeathAnim = FALSE, FollowPlayer = TRUE, DisableFirstMapLoadUmspawn = TRUE<br>Conditions = { ... }, Actions = { ... }</code><br>Wrapper für Umspawn von NPCs die den Avatar auf der Karte begleiten. D.h. die spawnen auch um wenn der Spieler die Karte an einem anderen Portal/Bindstone betritt bzw. innerhalb der Karte per Bindstone reist. Man kann auch den FollowModus auf den Avatar nach dem Umspawn aktivieren, wenn der NPC dem Spieler folgen soll (in der Regel schon). Wobei man beachten muss das man dennoch weiterhin ein FollowEvent benötigt und dieses unbedingt NACH diesem Befehl stehen muss. DisableFirstMapLoadUmspawn besagt übrigens das beim aller-ersten Karten-betreten die Figur NICHT umgespawned wird sondern an der location stehenbleibt an der sie auf der Karte platziert wurde. Dies ist insbesondere von Vorteil für Cutscenes die zu Beginn einer Karte stattfinden.]]
doc[numdoc] = nil
numdoc = numdoc + 1

---------------------------------------------------------------------------------------------------------------------

function InitRespawnSystem()
	BornDeadData = nil
	RespawnDataSet = {}
	RebirthDataSet = {}
	DespawnDataSet = {}
	UmspawnDataSet = {}
	DeathActionData = {}
	StateBornDead = nil
	SpawnDead = FALSE
end

function CreateRespawnSystem()
	-- early out on platform script n0.lua
	if NpcId == 0 then return end
	
	assert(StateMachine ~= nil)
	assert(NpcId ~= nil)
	
	
	
	FuncName = "RespawnSystem: "

	-- BORN DEAD SPAWN (SpawnOnlyWhen)
	if SpawnDead == TRUE then
		assert(StateBornDead)
		assert(type(BornDeadData) == "table")
		
		StateWaitAlive = CreateState("RespawnWait_BornDead")
			
		-- create transition from BornDead state to idle state
		local transition = StateBornDead:CreateTransition(CreateTransitionName("Base", "BornDead", "BORNDEAD", "WaitAlive"), StateWaitAlive)

		-- Zusätzliche Bedingungen einbauen
		foreachi(BornDeadData.Conditions, function(i, item)
			assert2(type(item) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(item)))
			if item.SetUpdateInterval then item:SetUpdateInterval(10) end
			%transition:AddCondition(item) 
		end)
	
		if BornDeadData.Target >= 0 then
			transition:AddCondition( FigureAlive{NpcId = BornDeadData.Target} )
			BornDeadData.X = 0
			BornDeadData.Y = 0
		end

		-- Respawn action & dialog flag
		local action = nil
		if BornDeadData.NoSpawnEffect == TRUE then
			action = Spawn{NpcId = NpcId, Target = BornDeadData.Target, X = BornDeadData.X, Y = BornDeadData.Y, Clan = BornDeadData.Clan, UnitId = BornDeadData.UnitId}
		else
			action = Spawn{NpcId = NpcId, Target = BornDeadData.Target, X = BornDeadData.X, Y = BornDeadData.Y, Clan = BornDeadData.Clan, UnitId = BornDeadData.UnitId, Effect = "Materialize", Length = 2000}
		end
		--action:AddUnit(BornDeadData.UnitId)
		transition:AddAction(action)
		
		local transition = StateWaitAlive:CreateTransition(CreateTransitionName("Base", "BornDead", "WaitAlive", "_Idle"), StateIdle)
		
		if NpcHasDialog == TRUE then
			--print("DIALOGFLAG: set in respawn system in transition from BORNDEAD state to IDLE... IMPORTANT == TRUE!")
			transition:AddAction(CGdsFigureSetDialogFlag:new(NpcId, TRUE))
		end
	
		-- freie aktionen (jenseits des nackten respawn
		if BornDeadData.Actions ~= nil then
			foreachi(BornDeadData.Actions, function(i, item) 
				assert2(type(item) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(item)))
				%transition:AddAction(item) 
			end)
		end
	end


	-- DYING & DEAD ...
	-- create state for the dead npc (always, even if he has no respawn!
	-- fixes a problem where dead npcs with no respawn still check and execute global events!)
	assert(StateDead == nil)
	StateDying = CreateState("DYING")
	StateDead = CreateState("DEAD")

	-- create transitions from any state to the dying state
	-- to DYING state by dying
	if CreateNoDeathEventPlease ~= TRUE then
		assert(getn(States) > 0)
		foreachi(States, function(i, state)
			if state ~= StateInit and state ~= StateDead and state ~= StateBornDead and state ~= StateDying then
				local transition = state:CreateTransition(CreateTransitionName("Respawn", "Dying", state:GetName():CMbStr(), "DYING"), StateDying)
				transition:AddCondition(CGdsFigureDeadEvent:new(NpcId))
			end
		end)
	end

	-- now go from DYING state to DEAD state and add DeathActions
	-- only set timestamp if the NPC has a respawn command
	local transition = StateDying:CreateTransition(CreateTransitionName("Respawn", "Die", StateDying:GetName():CMbStr(), "DEAD"), StateDead)
	if getn(RespawnDataSet) > 0 or getn(RebirthDataSet) > 0 then
		transition:AddAction(SetNpcTimeStamp{Name = "RespawnTimer"})
	end
	
	-- DEATH ACTIONS: freie Todes-Aktionen einfügen
	if getn(DeathActionData) ~= 0 then
		foreachi(DeathActionData, function(i, item) 
			assert2(type(item) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(item)))
			%transition:AddAction(item) 
		end)
	end
	transition = nil


	-- DESPAWN --
	-- to DEAD state by despawning (not in dialog states!)
	foreachi(DespawnDataSet, function(_, DespawnData)
		foreachi(States, function(i, state)
			--if state ~= StateInit and state ~= StateDead and state ~= StateDying and state ~= StateBornDead and strfind(state:GetName():CMbStr(), "DialogSystem") == nil then
			-- tryfix: nur im IDLE state !!!!!
			if state == StateIdle then
				local transitionname = CreateTransitionName("Respawn", "Despawn", state:GetName():CMbStr(), "DEAD")
				local transition = state:CreateTransition(transitionname, StateDead)
				--print("Despawn Transition: " .. transitionname)
				foreachi(%DespawnData.Conditions, function(i, item)
					assert2(type(item) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(item)))
					--print("\tadd Despawn condition: " .. tostring(item))
					%transition:AddCondition(item)
				end)
				foreachi(%DespawnData.Actions, function(i, item)
					assert2(type(item) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(item)))
					--print("\tadd Despawn action: " .. tostring(item))
					%transition:AddAction(item)
				end)
				-- only set timestamp if the NPC has a respawn command
				if getn(RespawnDataSet) > 0 then
					transition:AddAction(SetNpcTimeStamp{Name = "RespawnTimer"})
				end
				-- clear "about to be despawned" flag ... (for idlehome walking despawn)
				transition:AddAction(SetNpcFlagFalse{Name = "NpcIsAboutToBeDespawned"})
				
				-- at last, set the vanish action
				if %DespawnData.PlayDeathAnim == TRUE then
					transition:AddAction(Kill{})
				else
					transition:AddAction(Vanish{})
				end
			-- abort transition für alle idle go home ...
			elseif strfind(state:GetName():CMbStr(), "OnIdleGoHomeState", 1, 1) then
				local transitionname = CreateTransitionName("Respawn", "DespawnAbortIdleHome", state:GetName():CMbStr(), "_IDLE")
				local transition = state:CreateTransition(transitionname, StateIdle)
				print("DESPAWN: create abort transition in: " .. transitionname)

				foreachi(%DespawnData.Conditions, function(i, item)
					assert2(type(item) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(item)))
					--print("\tadd Despawn condition: " .. tostring(item))
					%transition:AddCondition(item:Clone())
				end)

				transition:AddAction(SetNpcFlagTrue{Name = "NpcIsAboutToBeDespawned"})
			end
		end)
	end)


	-- RESPAWN --
	foreachi(RespawnDataSet, function(_, RespawnData)
		assert(type(RespawnData) == "table")
		assert(StateIdle ~= nil)
		assert(StateDead ~= nil)
		
		StateWaitAlive = CreateState("RespawnWait_Respawn")
		
		-- create transition from dead state to idle state
		
		local transition = StateDead:CreateTransition(CreateTransitionName("Respawn", "Respawn", "DEAD", "WaitAlive"), StateWaitAlive)
		
		-- berücksichtige wartezeit
		local cond = IsNpcTimeElapsed{Name = "RespawnTimer", Seconds = RespawnData.WaitTime}
		local updateinterval = RespawnData.WaitTime * 10 * 0.33 + random(0,5)
		if updateinterval < 10 then updateinterval = 8 + random(0,4) end
		cond:SetUpdateInterval(updateinterval)
		transition:AddCondition(cond)
		
		-- berücksichtige ein oder mehrere vorgesetzte npcs 
		-- %$ TODO: Gebäude etc. auch berücksichtigen, kann man aber auch unter Conditions abhandeln
		if RespawnData.Chief ~= nil then
			if type(RespawnData.Chief) == "table" then
				foreachi(RespawnData.Chief, function(i, sup) %transition:AddCondition(FigureAlive{NpcId = sup}) end)
			else
				transition:AddCondition(FigureAlive{NpcId = RespawnData.Chief})
			end
		end
	
		-- Zusätzliche Bedingungen einbauen
		if RespawnData.Conditions ~= nil then
			foreachi(RespawnData.Conditions, function(i, item) 
				assert2(type(item) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(item)))
				%transition:AddCondition(item) 
			end)
		end
	
		if RespawnData.Target >= 0 then
			transition:AddCondition( FigureAlive{NpcId = RespawnData.Target} )
		end

		-- Respawn action
		local action = nil
		if RespawnData.NoSpawnEffect == TRUE then
			action = Spawn{NpcId = NpcId, Target = RespawnData.Target, X = RespawnData.X, Y = RespawnData.Y, Range = 0, Clan = RespawnData.Clan, UnitId = RespawnData.UnitId}
		else
			action = Spawn{NpcId = NpcId, Target = RespawnData.Target, X = RespawnData.X, Y = RespawnData.Y, Range = 0, Clan = RespawnData.Clan, UnitId = RespawnData.UnitId, Effect = "Materialize", Length = 2000}
		end

		--action:AddUnit(RespawnData.UnitId)
		transition:AddAction(action)
		
		local transition = StateWaitAlive:CreateTransition(CreateTransitionName("Respawn", "Respawn", "WaitAlive", "_Idle"), StateIdle)
		
		-- dialog flag setzen wenn der NPC dialog hat
		if NpcHasDialog == TRUE then
			--print("DIALOGFLAG: set in respawn system in transition from DEAD to IDLE ... IMPORTANT == TRUE")
			transition:AddAction(CGdsFigureSetDialogFlag:new(NpcId, TRUE))
		end

		-- freie aktionen (jenseits des nackten respawn)
		foreachi(RespawnData.Actions, function(i, item) %transition:AddAction(item) end)
	end)


	-- REBIRTH --
	foreachi(RebirthDataSet, function(_, RebirthData)
		assert(type(RebirthData) == "table")
		assert(StateIdle ~= nil)
		assert(StateDead ~= nil)

		local BindStates = {}
		local BindX = {}
		local BindY = {}
		local BindActions = {}
		foreachi(RebirthData.BindStones, function(i, bindstone)
			tinsert(%BindStates, CreateState("BINDSTONE_" .. i))
			tinsert(%BindX, bindstone.X)
			tinsert(%BindY, bindstone.Y)
			tinsert(%BindActions, bindstone.Actions or {})
		end)

		-- last point goes to idle anyway...
		tinsert(BindStates, CreateState("BINDSTONE_LAST"))
		tinsert(BindX, RebirthData.X)
		tinsert(BindY, RebirthData.Y)
		tinsert(BindActions, RebirthData.Actions)
		
		print("BindState from DEAD to #1")
		
		assert(BindStates[1] ~= nil)
		local transition = StateDead:CreateTransition(CreateTransitionName("Respawn", "Rebirth", "DEAD", "BINDSTONE_1"), BindStates[1])
		
		-- berücksichtige wartezeit
		local cond = IsNpcTimeElapsed{Name = "RespawnTimer", Seconds = RebirthData.WaitTime}
		local updateinterval = RebirthData.WaitTime * 10 * 0.33 + random(0,5)
		if updateinterval < 10 then updateinterval = 8 + random(0,4) end
		cond:SetUpdateInterval(updateinterval)
		transition:AddCondition(cond)
		
		-- Zusätzliche Bedingungen einbauen
		if RebirthData.Conditions ~= nil then
			foreachi(RebirthData.Conditions, function(i, item) 
				assert2(type(item) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(item)))
				%transition:AddCondition(item) 
			end)
		end
		
		-- timer zum prüfen des nächsten übergangs
		transition:AddAction( SetNpcTimeStamp{Name = "RebirthBindstoneSelectionTimer"} )
		transition = nil
		
		foreachi(BindStates, function(i, bindstate)
			local transition = nil
			transition = bindstate:CreateTransition(CreateTransitionName("Respawn", "Rebirth", "BINDSTONE_" .. i, "_IDLE"), StateIdle)
			print("BindState from #" .. i .. " to IDLE")

			if i < getn(%BindStates) then
				transition:AddCondition( IsMonumentInUse{X = %BindX[i], Y = %BindY[i], Range = 0, UpdateInterval = 1} )
			end

			-- Respawn action
			local action = nil
			if %RebirthData.NoSpawnEffect == TRUE then
				action = Spawn{NpcId = NpcId, X = %BindX[i], Y = %BindY[i], Range = 1}
			else
				action = Spawn{NpcId = NpcId, X = %BindX[i], Y = %BindY[i], Range = 1, Effect = "Materialize", Length = 2000}
			end
	
			transition:AddAction(action)
			
			-- dialog flag setzen wenn der NPC dialog hat
			if NpcHasDialog == TRUE then
				--print("DIALOGFLAG: set in respawn system in transition from REBIRTH to IDLE ... IMPORTANT == TRUE")
				transition:AddAction(CGdsFigureSetDialogFlag:new(NpcId, TRUE))
			end
	
			-- freie aktionen (jenseits des nackten respawn)
			assert2(%BindActions[i], "no actions in rebirth bindstone position " .. i)
			foreachi(%BindActions[i], function(i, item) %transition:AddAction(item) end)
			
			-- transition to next bindstone...
			if i < getn(%BindStates) then
				print("BindState from #" .. i .. " to #" .. i+1)
				transition = bindstate:CreateTransition(CreateTransitionName("Respawn", "Rebirth", "BINDSTONE_" .. i, "BINDSTONE_" .. i+1), %BindStates[i+1])
				transition:AddCondition( IsNpcTimeElapsed{Name = "RebirthBindstoneSelectionTimer", Seconds = 0.2, UpdateInterval = 1} )
				transition:AddAction( SetNpcTimeStamp{Name = "RebirthBindstoneSelectionTimer"} )
			end

		end)
	end)


	-- UMSPAWN --
	-- to DEAD state and back alive by umspawning (not in dialog states!)
	foreachi(UmspawnDataSet, function(umspawnindex, UmspawnData)
		foreachi(States, function(i, state)
			--if state ~= StateInit and state ~= StateDead and state ~= StateDying and state ~= StateBornDead and strfind(state:GetName():CMbStr(), "DialogSystem") == nil then
			-- tryfix: nur im IDLE state !!!!!
			if state == StateIdle then
				local StateNirvanaName = "NIRVANA" .. %umspawnindex
				local transitionname = CreateTransitionName("Respawn", "Umspawn", "_IDLE", StateNirvanaName)
				StateNirvana = CreateState(StateNirvanaName)
				local transition = StateIdle:CreateTransition(transitionname, StateNirvana)
				print("Umspawn Transition: " .. transitionname)
				foreachi(%UmspawnData.Conditions, function(i, item)
					assert2(type(item) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(item)))
					--print("\tadd Umspawn condition: " .. tostring(item))
					%transition:AddCondition(item)
				end)
				transition:AddCondition( FigureAlive{NpcId = NpcId} )
				transition:AddCondition(IsGlobalFlagFalse{Name = "GDS_PlatformLoaded", UpdateInterval = 10})
				
				-- clear "about to be Umspawned" flag ... (for idlehome walking Umspawn)
				transition:AddAction(SetNpcFlagFalse{Name = "NpcIsAboutToBeDespawned"})
				transition:AddAction(DebugLog{String = "Umspawn Nirvana"})

				-- at last, set the vanish action
				if %UmspawnData.PlayDeathAnim == TRUE then
					transition:AddAction(Kill{})
				else
					transition:AddAction(Vanish{})
				end
				
				if %UmspawnData.OnlyOnce == TRUE then
					transition:AddAction( CGdsRemoveTransition:new("_IDLE", transitionname) )
				end

				--------------------------------------------------------
				-- and back to live, back to reality ...
				StateWaitAlive = CreateState("RespawnWait_UmSpawn")
				local transitionname = CreateTransitionName("Respawn", "Umspawn", StateNirvanaName, "WaitAlive")
				local transition = StateNirvana:CreateTransition(transitionname, StateWaitAlive)
				
				local c1, c2, c3 = nil, nil, nil
		
				if %UmspawnData.Target >= 0 then
					c1 = FigureAlive{NpcId = %UmspawnData.Target}
				end
				c2 = FigureDead{NpcId = NpcId}
				c3 = IsGlobalFlagTrue{Name = "GDS_PlatformLoaded", UpdateInterval = 5}
				
				if not c1 then
					transition:AddCondition( ODER(c2, c3) )
				else
					transition:AddCondition( ODER( UND(c1, c2), c3) )
				end
				
				local action = nil
				if %UmspawnData.NoSpawnEffect == TRUE then
					action = Spawn{NpcId = NpcId, Target = %UmspawnData.Target, X = %UmspawnData.X, Y = %UmspawnData.Y, Range = 0, Clan = %UmspawnData.Clan, UnitId = %UmspawnData.UnitId}
				else
					action = Spawn{NpcId = NpcId, Target = %UmspawnData.Target, X = %UmspawnData.X, Y = %UmspawnData.Y, Range = 0, Clan = %UmspawnData.Clan, UnitId = %UmspawnData.UnitId, Effect = "Materialize", Length = 2000}
				end
				transition:AddAction(action)
				
				local transition = StateWaitAlive:CreateTransition(CreateTransitionName("Respawn", "Rebirth", StateNirvanaName, "_Idle"), StateIdle)
				
				if NpcHasDialog == TRUE then
					--print("DIALOGFLAG: set in respawn system in transition from NIRVANA state to IDLE... IMPORTANT == TRUE!")
					transition:AddAction(CGdsFigureSetDialogFlag:new(NpcId, TRUE))
				end

				transition:AddAction(LookAtDirection{Direction = North})
		
				foreachi(%UmspawnData.Actions, function(i, item)
					assert2(type(item) == "userdata", FuncName .. "illegal action type, not userdata! type: " .. tostring(type(item)))
					--print("\tadd Umspawn action: " .. tostring(item))
					%transition:AddAction(item)
				end)

			-- abort transition für alle idle go home ...
			elseif strfind(state:GetName():CMbStr(), "OnIdleGoHomeState", 1, 1) then
				local transitionname = CreateTransitionName("Respawn", "DespawnAbortIdleHome", state:GetName():CMbStr(), "_IDLE")
				local transition = state:CreateTransition(transitionname, StateIdle)
				print("UMSPAWN: create abort transition in: " .. transitionname)

				foreachi(%UmspawnData.Conditions, function(i, item)
					assert2(type(item) == "userdata", FuncName .. "illegal condition type, not userdata! type: " .. tostring(type(item)))
					--print("\tadd Umspawn condition: " .. tostring(item))
					%transition:AddCondition(item:Clone())
				end)

				transition:AddAction(SetNpcFlagTrue{Name = "NpcIsAboutToBeDespawned"})
				
				if %UmspawnData.OnlyOnce == TRUE then
					transition:AddAction( CGdsRemoveTransition:new(state:GetName():CMbStr(), transitionname) )
				end
			end
		end)
	end)
end
                                                         