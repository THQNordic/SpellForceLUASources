-- You Are Currently Editing: 
-----------------------------
--		GdsActions.lua
-----------------------------


-- GdsCreateDoc HTML doc generator needs these:
numdoc = 1
doc = {}

-- **DOC** ----------------------------------------------------------
function Goto(params)
	local FuncName = "GDS: Goto(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X =")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y =")
	params.Range = params.Range or 5
	params.Range = 5
	params.NpcId = params.NpcId or NpcId
--	assert2(params.NpcId ~= Avatar, FuncName .. "INVALID PARAMETER: NpcId = Avatar")
	params.WalkMode = params.WalkMode or Walk
	params.GotoMode = params.GotoMode or GotoNormal
	params.XRand = params.XRand or 0
	params.YRand = params.YRand or 0
	assert2(getn(tkeys(params)) == 8, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	if params.XRand > 1 then
		--params.X = params.X + (random(0, params.XRand - 1) - params.XRand / 2)
	end
	if params.YRand > 1 then
		--params.Y = params.Y + (random(0, params.YRand - 1) - params.YRand / 2)
	end
	
	return CGdsFigureGoto:new(params.NpcId, params.X, params.Y, params.Range, params.GotoMode, params.WalkMode)
end

doc[numdoc] = [[Params: <code>X = , Y = , NpcId = self, Range = 5, WalkMode = Walk, GotoMode = GotoNormal, XRand = 0, YRand = 0</code><br>Lässt den NPC an die Koordinaten X, Y laufen. Bricht ab, wenn der Npc aggro wird. WalkMode ist optional und wenn auf 'Run' gesetzt dann rennt der NPC, ansonsten geht er. Range bezeichnet den Radius um den Zielpunkt um einen Radius zu erzeugen wo das Ziel als erreicht gilt. XRand und YRand geben einen zufälligen Bereich an, um den sich die X bzw. Y Koordinate ändern dürfen. Hat XRand z.b. den Wert 20, wird die X Position zufällig um -10 bis +9 verändert. Der Wert von X/YRand muss positiv und 2 oder höher sein, um in Effekt zu treten.<br>NEU: GotoMode gibt die "Art" des laufens an, es gibt diese Möglichkeiten:<br><code>GotoNormal<br>GotoForced == ignore aggro<br>GotoContinuous<br></code>]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function Spawn(params)
	local FuncName = "GDS: Spawn(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X =")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y =")
	--assert2(params.NpcId ~= NpcId, FuncName .. "NOT ALLOWED: can not spawn self.\n" .. FuncName .. "NpcId must not be the same as the NpcId of the NPC running this script.")
	params.NpcId = params.NpcId or 0
	if params.Target and params.Target >= 0 then
		params.SpawnRelative = TRUE
	else
		params.SpawnRelative = FALSE
		params.Target = -1
	end
	params.UnitId = params.UnitId or 0
	params.XRand = params.XRand or 0
	params.YRand = params.YRand or 0
	params.Clan = params.Clan or 0
	params.Range = params.Range or 0
	params.NotPersistant = params.NotPersistant or 0
	params.Effect = params.Effect or 0
	if type(params.Effect) == "string" then
		local e = params.Effect
		params.Effect = EffectList[e]
		assert2(params.Effect, FuncName .. "UNKNOWN EFFECT: " .. e .. " -- please update object/object_scripteffects.lua")
	end
	params.Length = params.Length or 0
	params.Length = params.Length / 100
	params.HardMode = params.HardMode or FALSE
	assert2(getn(tkeys(params)) == 14, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	if params.XRand > 1 then
		params.X = params.X + (random(0, params.XRand - 1) - params.XRand / 2)
	end
	if params.YRand > 1 then
		params.Y = params.Y + (random(0, params.YRand - 1) - params.YRand / 2)
	end

	--print("\t SPAWN dump:")
	--dump(params)
	
	local action = CGdsFigureSpawn:new(params.NpcId, params.X, params.Y, params.SpawnRelative, params.Target, params.Range, params.Clan, params.NotPersistant, params.Effect, params.Length, params.HardMode)
	if type(params.UnitId) == "table" then
		assert2(params.NpcId == 0, FuncName .. "INVALID PARAMETER: if UnitId == \"table\" then NpcId must be 0!")
		foreachi(params.UnitId, function(i, unit)
			%action:AddUnit(unit)
		end)
	else
		action:AddUnit(params.UnitId)
	end
	return action
end

doc[numdoc] = [[Params: <code>X = , Y = , NpcId = 0, Target = none, Range = 0, UnitId = self, Clan = 0, NotPersistant = FALSE, Effect = "Materialize", Length = 0, XRand = 0, YRand = 0</code><br>Spawned eine Figur mit der angegebenen NpcId (Achtung: doppelte NPC IDs verursachen einen assert!) an position x,y (tiles). UnitId ist der NPC Unit Typ aus der Datenbank (als Nummer). 
Wenn man die gespawnte Unit nicht im script ansprechen muss sollte man als NpcId 0 einsetzen bzw. den Parameter weglassen! Dies erlaubt das spawnen beliebig vieler Npcs mit Id 0. XRand und YRand geben einen zufälligen Bereich an, um den sich die X bzw. Y Koordinate ändern dürfen. Hat XRand z.b. den Wert 20, wird die X Position zufällig um -10 bis +9 verändert. Der Wert von X/YRand muss positiv und 2 oder höher sein, um in Effekt zu treten.<br>NEU: UnitId kann nun eine Tabelle {...} sein, um zufällig eine der in der tabelle angegebenen units zu spawnen. Dann muss allerdings die NpcId 0 sein.<br>Ausserdem: Range Parameter, für zufälliges spawnen innerhalb des Ranges (rechteckig!). <br>NEU: NotPersistant gibt an ob die Figur nach verlassen der Plattform erhalten bleibt (FALSE, default) oder dann wieder gelöscht wird (TRUE).<br>Target gibt die NpcId eines Target NPCs an, so das die Figur bei den aktuellen Koordinaten dieses NPCs spawned.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function Follow(params)
	local FuncName = "GDS: Follow(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Target, FuncName .. "MISSING PARAMETER: Target =")
	params.NpcId = params.NpcId or NpcId
	assert2(params.Target ~= params.NpcId, FuncName .. "NOT ALLOWED: can not follow self. Target must not be same as NpcId.")
	assert2(params.NpcId ~= params.Target, FuncName .. "NOT ALLOWED: can not follow self. Target must not be same as NpcId.")
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureFollow:new(params.NpcId, params.Target, TRUE)
end

doc[numdoc] = [[Params: <code>Target = , NpcId = self</code><br>Lässt den NPC mit der angegebenen NpcId dem TargetId (ebenfalls eine NpcId) folgen. Er wird die Verfolgung abbrechen wenn er aggro wird.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function StopFollow(params)
	local FuncName = "GDS: StopFollow(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Target, FuncName .. "MISSING PARAMETER: Target =")
	params.NpcId = params.NpcId or NpcId
	assert2(params.Target ~= params.NpcId, FuncName .. "NOT ALLOWED: can not follow self. Target must not be same as NpcId.")
	assert2(params.NpcId ~= params.Target, FuncName .. "NOT ALLOWED: can not follow self. Target must not be same as NpcId.")
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureFollow:new(params.NpcId, params.Target, FALSE)
end

doc[numdoc] = [[Params: <code>Target = , NpcId = self</code><br>Stoppt den Follow Mode eines NPC, der NPC bleibt stehen.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function Stop(params)
	local FuncName = "GDS: Stop(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
--	assert2(params.NpcId ~= Avatar, FuncName .. "INVALID PARAMETER: NpcId = Avatar")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureStop:new(params.NpcId)
end

doc[numdoc] = [[Params: <code>NpcId = self</code><br>Hält einen NPC an. Mir fällt nicht ein wo man das wirklich gebrauchen kann, denn z.b. bei Dialogen halten die Npcs automatisch an ebenso wie bei Tagesabläufen. Höchstens vielleicht um einen Npc in eine Richtung zu schicken mit Goto und nach bestimmter Zeit ein Stop zu geben und zu sehen wie weit er bis dahin gekommen ist.<br>Der Befehl wird hauptsächlich intern für die Scriptbefehle verwendet.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function Vanish(params)
	local FuncName = "GDS: Vanish(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	assert2(params.NpcId ~= Avatar, FuncName .. "INVALID PARAMETER: NpcId = Avatar")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureVanish:new(params.NpcId)
end

doc[numdoc] = [[Params: <code>NpcId = self</code><br>Lässt einen NPC verschwinden. Seine StateMachine läuft dabei weiter. Er wird NICHT auf den Respawn warten.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function ChangeObject(params)
	local FuncName = "GDS: ChangeObject(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X =")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y =")
	assert2(params.Object, FuncName .. "MISSING PARAMETER: Object =")
	if not params.Angle then
		params.Angle = 0
		params.ChangeAngle = FALSE
	else
		params.ChangeAngle = TRUE
	end
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsChangeObject:new(params.X, params.Y, params.Object, params.Angle, params.ChangeAngle)
end

doc[numdoc] = [[Params: <code>X = , Y = , Object = , Angle = keep angle ,</code><br>Ändert das Objekt an der angegebenen Position in das neue Objekt. Das Object ist die entsprechende Object Id aus der db. WICHTIG: es können nur Misc Objekte verändert werden! Das sind alle Objekte in einem Range von 768-1003 sowie 1920-2175.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function ChangeFigureOwner(params)
	local FuncName = "GDS: ChangeFigureOwner(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.Owner = params.Owner or OwnerPlayer
	-- hacked: don't allow change owner to OwnerNpc
	params.Owner = OwnerPlayer
	params.NpcId = params.NpcId or NpcId
	assert2(params.NpcId ~= Avatar, FuncName .. "INVALID PARAMETER: NpcId = Avatar")
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureChangeOwner:new(params.NpcId, params.Owner)
end

doc[numdoc] = [[Params: <code>NpcId = self</code><br>Ändert den Owner eines NPC, um den Npc für den Spieler steuerbar zu machen. Steuerbar heisst allerdings nur, das man der Figur entsprechende Lauf- oder Kampfbefehle geben kann, es ändert nicht deren Faction oder Scriptablauf. So würde ein Npc mit Tagesablaufscript zwar zu dem Punkt laufen den der Spieler angibt, bei Ankunft wird er aber wieder seinen Tagesablauf erfüllen wollen und zurücklaufen. Und ein böser Orc bleibt ein böser Orc auch wenn ihn der Player steuern kann. ;)]]
doc[numdoc] = nil
numdoc = numdoc + 1

function ChangeOwner(params)
	return ChangeFigureOwner(params)
end

-- **DOC** ----------------------------------------------------------
function ChangeBuildingRace(params)
	local FuncName = "GDS: ChangeBuildingRace(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X = ")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y = ")
	assert2(params.Race, FuncName .. "MISSING PARAMETER: Race")
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsBuildingChangeRace:new(params.X, params.Y, params.Race)
end

doc[numdoc] = [[Params: <code>X = , Y = , Race = </code><br>Ändert die Rasse eines Gebäudes . SOllte zum Beispiel ein Lager feindlich auf ein anderes werden und seine Gebäude behalten ist der Befehl nützlich]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function ChangeBuildingOwner(params)
	local FuncName = "GDS: ChangeBuildingOwner(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X = ")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y = ")
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsChangeBuildingOwner:new(params.X, params.Y)
end

doc[numdoc] = [[Params: <code>X = , Y = ,</code><br>Ändert den Owner eines Gebäudes so, das es der Spieler nutzen kann. So kann man z.b. auf der Karte gesetzte Gebäude dem Spieler zuweisen, so das er es und dessen Funktion nutzen kann.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function ChangeEquipment(params)
	local FuncName = "GDS: ChangeEquipment(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Slot, FuncName .. "MISSING PARAMETER: Slot =")
	assert2(params.Item, FuncName .. "MISSING PARAMETER: Item =")
	params.NpcId = params.NpcId or NpcId
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureChangeEquip:new(params.NpcId, params.Slot, params.Item)
end

doc[numdoc] = [[Params: <code>Slot = , Item = , NpcId = self</code><br>Ändert das Equipment einer Figur (ersetzt vorhandenes Item). Das Item ist eine entsprechende Item Id aus der db. Für Slot gibt es folgende Typen:<br><code>SlotHead<br>SlotRightHand<br>SlotChest<br>SlotLeftHand<br>SlotRightRing<br>SlotLegs<br>SlotLeftRing</code> *untested*]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function ChangeUnit(params)
	local FuncName = "GDS: ChangeUnit(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Unit, FuncName .. "MISSING PARAMETER: Unit =")
	params.NpcId = params.NpcId or NpcId
	params.ChangeLevel = params.ChangeLevel or FALSE
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureChangeUnit:new(params.NpcId, params.Unit, params.ChangeLevel)
end

doc[numdoc] = [[Params: <code>Unit = , NpcId = self, ChangeLevel = FALSE</code><br>Ändert die Unit einer Figur. Die Unit ist eine entsprechende Unit Id aus der db. Wenn ChangeLevel = TRUE wird auch der Level der Figur verändert, und zwar wird dann das Level von dem Creo der neuen Figur genommen.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function ChangeRace(params)
	local FuncName = "GDS: ChangeRace(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Race, FuncName .. "MISSING PARAMETER: Race =")
	params.NpcId = params.NpcId or NpcId
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureChangeRace:new(params.NpcId, params.Race)
end

doc[numdoc] = [[Params: <code>Race = , NpcId = self</code><br>Ändert die Race einer Figur. Race ist eine entsprechende Race Id aus der db. Mit dem ändern der Race ändert sich auch das Verhalten der Figur anderen gegenüber, so kann man z.b. einen Orc aggressiv zu seinen Artgenossen werden lassen.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function LookAtDirection(params)
	local FuncName = "GDS: LookAtDirection(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Direction, FuncName .. "MISSING PARAMETER: Direction =")
	assert2(params.Direction >= 0 and params.Direction < NumDirections, FuncName .. "INVALID PARAMETER: Direction = " .. tostring(params.Direction))
	params.NpcId = params.NpcId or NpcId
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsSetDirection:new(FaceDirection, params.NpcId, 0, params.Direction)
end

doc[numdoc] = [[Params: <code>Direction = , NpcId = self</code><br>Ändert die Blickrichtung einer Figur. NpcId ist die Id der unit die die Blickrichtung ändern soll. <br><code>East<br>SouthEast<br>South<br>SouthWest<br>West<br>NorthWest<br>North<br>NorthEast</code><br>]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function LookAtFigure(params)
	local FuncName = "GDS: LookAtFigure(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	assert2(params.Target, FuncName .. "MISSING PARAMETER: Target =")
	assert2(params.Target ~= params.NpcId, FuncName .. "INVALID PARAMETER: Target = self -- this is the thing that should not be!")
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsSetDirection:new(FaceNpc, params.NpcId, params.Target, 0)
end

doc[numdoc] = [[Params: <code>Target = , NpcId = self</code><br>Ändert die Blickrichtung einer Figur. Die Figur wird in die Richtung des Target (eine NpcId) blicken. NpcId ist die Id der unit die die Blickrichtung ändern soll. *untested*]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function CastSpell(params)
	local FuncName = "GDS: CastSpell(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Spell, FuncName .. "MISSING PARAMETER: Spell =")
	assert2(params.Target, FuncName .. "MISSING PARAMETER: Target =")
	assert2(params.TargetType, FuncName .. "MISSING PARAMETER: TargetType =")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X =")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y =")
	params.NpcId = params.NpcId or NpcId
	assert2(params.NpcId ~= Avatar, FuncName .. "INVALID PARAMETER: NpcId = Avatar")
	assert2(getn(tkeys(params)) == 6, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	return CGdsFigureCastSpell:new(params.NpcId, params.Spell, params.Target, params.TargetType, params.X, params.Y)
end

doc[numdoc] = [[Params: <code>Spell = , Target = , TargetType = , X = , Y = , NpcId = self</code><br>Lässt einen NPC einen Spell casten.<br>ACHTUNG: Wichtig ist folgendes:<br>
-das man das korrekte TargetType angibt<br>
-das der NPC zum casten still steht (geht nicht im Dialog)<br>
-das der Npc den Spell auch "besitzt" (muss der unit in der db zugewiesen sein)<br>
-das der Npc genug Mana für den Spell hat<br>
Der Npc wird das casten unterbrechen wenn er dabei ein Goto command erhält, entweder weil sein Tagesablauf ihm das sagt oder weil die KI ihn wohinlaufen lässt.<br>Spell ist eine Spell Id aus der Datenbank. Target ist die NpcId des Ziel Npc wenn TargetType = Figure ist. X, Y müssen dann 0 sein. Und umgekehrt muss das Target = 0 sein wenn TargetType was anderes als Figure ist. Die erlaubten Targettypes sind im einzelnen: <br><code>Figure<br>Building<br>Object<br>World<br>Area</code><br>NpcId ist letztlich der Npc der den Spell casten kann, per default der Npc der den CastSpell Befehl aufruft.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function SetEffect(params)
	local FuncName = "GDS: SetEffect(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Effect, FuncName .. "MISSING PARAMETER: Effect =")
	if type(params.Effect) == "string" then
		local e = params.Effect
		params.Effect = EffectList[e]
		assert2(params.Effect, FuncName .. "UNKNOWN EFFECT: " .. e .. " -- please update object/object_scripteffects.lua")
	end
	params.Length = params.Length or 0

	if params.TargetType ~= nil then
		if params.TargetType == Figure or params.TargetType == Object then
			params.NpcId = params.NpcId or NpcId
		else
			params.NpcId = params.NpcId or 0
		end
		if params.TargetType == World then
			assert2(params.X, FuncName .. "MISSING PARAMETER: X =")
			assert2(params.Y, FuncName .. "MISSING PARAMETER: Y =")
			assert2(params.X ~= 0 and params.Y ~= 0, FuncName .. "INVALID PARAMETER: X or Y or both = 0 while NpcId is 0 too!")
		else
			params.X = 0
			params.Y = 0
		end
	else
		if params.X and params.Y and params.X ~= 0 and params.Y ~= 0 then
			params.NpcId = 0
			params.TargetType = World
		else
			if not params.NpcId then
				params.NpcId = NpcId
			end
			params.X = 0
			params.Y = 0
			params.TargetType = Figure
		end
	end
	
	assert2(getn(tkeys(params)) == 6, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	--print("SetEffect(): fx = " .. params.Effect .. " -- x,y = " .. params.X .. "," .. params.Y .. " -- TargetType = " .. params.TargetType .. " -- NpcId = " .. params.NpcId .. " -- Length = " .. params.Length)
	return CGdsSetEffect:new(params.TargetType, params.NpcId, params.X, params.Y, params.Effect, params.Length)
end

doc[numdoc] = [[Params: <code>Effect = , X = , Y = , Length = 0, TargetType = Figure/World, NpcId = self</code><br>Setzt einen Effekt auf die Landschaft oder eine Figur. Entweder NpcId oder X,Y müssen gesetzt sein. Darauf basierend entscheidet sich ob der Effekt an einer Figur hängen soll oder auf der Landschaft. Per Default wird der Effekt auf die Figur gesetzt die diesen Befehl ausführt.<br>Effect ist ein Effect-String, die möglichen Effekte kann man mittels EffectList() in der Konsole dumpen lassen, oder in <a href=C:\project\main\redist\script\effectlist.lua>effectlist.lua</a> nachsehen. Um einen unendlich langen Effekt zu bekommen der nie beendet wird, muss man Length auf 0 setzen.<br>Die Targettypes sind im einzelnen:<br><code>Figure<br>Building<br>Object<br>World<br>Area</code><br>Welcher TargetType für welchen Effekt verwendet werden muss/kann ergibt sich meist aus der Logik, Area Spells natürlich Area, aber man kann auch viele Figure Effecte in die World setzen (sehen dann meist anders aus). Im schlimmsten Fall erscheint der Effekt halt gar nicht.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function StopEffect(params)
	local FuncName = "GDS: StopEffect(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")

	if params.TargetType ~= nil then
		if params.TargetType == Figure then
			params.NpcId = params.NpcId or NpcId
		else
			params.NpcId = params.NpcId or 0
		end
		if params.TargetType == World then
			assert2(params.X, FuncName .. "MISSING PARAMETER: X =")
			assert2(params.Y, FuncName .. "MISSING PARAMETER: Y =")
			assert2(params.X ~= 0 and params.Y ~= 0, FuncName .. "INVALID PARAMETER: X or Y or both = 0 while NpcId is 0 too!")
		else
			params.X = 0
			params.Y = 0
		end
	else
		if params.X and params.Y and params.X ~= 0 and params.Y ~= 0 then
			params.NpcId = 0
			params.TargetType = World
		else
			if not params.NpcId then
				params.NpcId = NpcId
			end
			params.X = 0
			params.Y = 0
			params.TargetType = Figure
		end
	end
	
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsStopEffect:new(params.TargetType, params.NpcId, params.X, params.Y)
end

doc[numdoc] = [[Params: <code>X = , Y = , TargetType = World/Figure, NpcId = 0</code><br>Stoppt einen Effekt auf der Landschaft oder einer Figur. Entweder NpcId oder X,Y müssen gesetzt sein. Darauf basierend entscheidet sich ob der Effekt an einer Figur gelöscht werden soll oder auf der Landschaft.<br>Die Targettypes sind im einzelnen: <br><code>Figure<br>Building<br>Object<br>World<br>Area</code><br>Es muss derselbe TargetType gesetzt sein wie der Effect mit SetEffect in die Welt gesetzt wurde.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function TransferResource(params)
	local FuncName = "GDS: TransferResource(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Resource, FuncName .. "MISSING PARAMETER: Resource = ")

--print("FIXME: for ease of transition, TransferResource will use SideLight as default...")
--params.Side = params.Side or SideLight

	assert2(params.Side, FuncName .. "MISSING PARAMETER: Side =  ... either SideLight or SideDark!")
	params.Amount = params.Amount or 10
	params.Flag = params.Flag or Give
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

REM = [[
	if params.Side == SideDark then
		print("Transferring " .. params.Amount .. " of Resource " .. params.Resource .. " to SideDark.")
	else
		print("Transferring " .. params.Amount .. " of Resource " .. params.Resource .. " to SideLight.")
	end		
]]

	return CGdsTransferResource:new(params.Resource, params.Amount, params.Side, params.Flag)
end

doc[numdoc] = [[Params: <code>Resource = , Side = , Amount = 10, Flag = Give</code><br>Ressourcen Transfer (geben und/oder nehmen). Flag kann sein:<br>
<code>Take<br>Give<br>Exchange</code><br>Die Flags müssen entsprechend gesetzt sein je nach gewünschter Aktion, ob man nehmen oder geben will. Alles aus der Sicht des Npc...<br>Es gibt folgende Resource Types:<br><code>GoodBoard<br>GoodStone<br>GoodMithril<br>GoodFood<br>GoodIron<br>GoodManaElixir<br>GoodManaHerb<br></code>Sides:<br><code>SideLight, SideDark</code>]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function TransferItem(params)
	local FuncName = "GDS: TransferItem(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.TakeItem = params.TakeItem or 0
	params.GiveItem = params.GiveItem or 0
	params.Amount = params.Amount or 1
	params.Flag = params.Flag or Give
	assert2(params.TakeItem ~= 0 or params.GiveItem ~= 0, FuncName .. "MISSING PARAMETER: Either TakeItem or GiveItem must be used!")
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsTransferItem:new(params.TakeItem, params.GiveItem, params.Flag, params.Amount)
end

doc[numdoc] = [[Params: <code>TakeItem = 0, GiveItem = 0, Amount = 1, Flag = Give</code><br>Item Transfer (geben und/oder nehmen). Flag kann sein:<br>
<code>Take<br>Give<br>Exchange</code><br>Die Flags müssen entsprechend gesetzt sein je nach gewünschter Aktion, ob man ein Item nehmen, geben oder gegen ein anderes tauschen will. Wenn man dem Spieler von einem NPC aus etwas gibt, muss das item nicht vorhanden sein. Wenn aber der Spieler etwas dem NPC geben soll, muss der Spieler das item auch besitzen!<br>Alles aus der Sicht des Npc...]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function TransferMoney(params)
	local FuncName = "GDS: TransferMoney(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Copper or params.Silver or params.Gold, FuncName .. "MISSING PARAMETER: either Copper, Silver or Gold")
	params.Copper = params.Copper or 0
	params.Silver = params.Silver or 0
	params.Gold = params.Gold or 0
	params.Flag = params.Flag or Give
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local CopperPieces = params.Copper + params.Silver * 100 + params.Gold * 100 * 100
	-- print(FuncName .. "Gold = " .. params.Gold .. ", Silver = " .. params.Silver .. ", Copper = " .. params.Copper .. " -- Sum: " .. CopperPieces .. " Copper")

	return CGdsTransferMoney:new(CopperPieces, params.Flag)
end

doc[numdoc] = [[Params: <code>Copper = , Silver = , Gold = , Flag = Give</code><br>Money Transfer. Flag kann sein:<br><code>Take<br>Give</code><br>Die Flags müssen entsprechend gesetzt sein je nach gewünschter Aktion, geben oder nehmen. Wenn man dem Spieler von einem NPC aus etwas gibt, muss das item nicht vorhanden sein. Wenn aber der Spieler etwas dem NPC geben soll, muss der Spieler das item auch besitzen!<br>Alles aus der Sicht des Npc... ]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function TransferXP(params)
	local FuncName = "GDS: TransferXP(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.XP, FuncName .. "MISSING PARAMETER: XP =")
	params.Flag = params.Flag or Give
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsTransferXP:new(params.XP, params.Flag)
end

doc[numdoc] = [[Params: <code>XP = , Flag = Give</code><br>XP Transfer (geben).  Flag kann sein:<br><code>Take<br>Give</code><br>Die Flags müssen entsprechend gesetzt sein je nach gewünschter Aktion, geben oder nehmen. Wenn man dem Spieler von einem NPC aus etwas gibt, muss das item nicht vorhanden sein. Wenn aber der Spieler etwas dem NPC geben soll, muss der Spieler das item auch besitzen!<br>Alles aus der Sicht des Npc... ]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function AttackWave(params)
	local FuncName = "GDS: AttackWave(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.SourceRace, FuncName .. "MISSING PARAMETER: SourceRace =")
	assert2(params.TargetRace, FuncName .. "MISSING PARAMETER: TargetRace =")
	assert2(params.Percent, FuncName .. "MISSING PARAMETER: Percent =")
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	return CGdsAttackWave:new(params.SourceRace, params.TargetRace, params.Percent);
end

doc[numdoc] = [[Params: <code>SourceRace = , TargetRace = , Percent = ,</code><br>Attack Wave Befehl für AI. Source ist die Rasse von der Units für den Angriff genommen werden sollen. Target ist die Rasse die angegriffen werden sollen (müssen wohl Feinde sein). Percent ist Prozent der Units dieser Rasse auf der Map die den Angriff durchführen sollen.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function AttackTarget(params)
	local FuncName = "GDS: AttackTarget(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Target, FuncName .. "MISSING PARAMETER: Target =")
	params.NpcId = params.NpcId or NpcId
	params.FriendlyFire = params.FriendlyFire or FALSE
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	return CGdsFigureAttack:new(params.NpcId, params.Target, params.FriendlyFire);
end

doc[numdoc] = [[Params: <code>Target = , NpcId = self, FriendlyFire = FALSE,</code><br>Lässt einen NPC das angegebene Target (auch eine NpcId) angreifen. FriendlyFire gibt dabei an, ob die Figur auch eigene Einheiten angreifen darf.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function ChangeGoal(params)
	local FuncName = "GDS: ChangeGoal(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Clan, FuncName .. "MISSING PARAMETER: Clan =")
	params.Goal = params.Goal or GoalNone
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	return CGdsAiChangeGoal:new(params.Clan, params.Goal)
end

doc[numdoc] = [[Params: <code>Clan = , Goal = NoGoal,</code><br>Change Goal für Ai um einem Clan ein anderes Goal für diese Map zuzuweisen . Clan ist die ClanId für diese Map (im Editor oder Log nachschauen). Goal ist das neue Goal, es gibt folgende Goals: <code><br>GoalDefault<br>GoalNone<br>GoalIdle<br>GoalScript<br>GoalNomadic<br>GoalAggressive<br>GoalDefensive<br></code>]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function ClanAttack(params)
	local FuncName = "GDS: ClanAttack(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Number, FuncName .. "MISSING PARAMETER: Number =")
	assert2(params.SourceClan, FuncName .. "MISSING PARAMETER: SourceClan =")
	assert2(params.TargetX, FuncName .. "MISSING PARAMETER: TargetX =")
	assert2(params.TargetY, FuncName .. "MISSING PARAMETER: TargetY =")
	params.WalkMode = params.WalkMode or Run
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsClanAttack:new(params.Number, params.SourceClan, params.TargetX, params.TargetY, params.WalkMode)
end

doc[numdoc] = [[Params: <code>Number = , SourceClan = , TargetX = , TargetY = , WalkMode = Run</code><br>Clan Attack Befehl für AI. Source ist der Clan von dem Number Units für den Angriff genommen werden sollen. TargetX ist die X Koordinate des Angriffspunktes TargetY die Y Koordinate. Run sagt ob der Angriff rennend erfolgen soll (Wert ungleich 0 ja).]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function DebugLog(params)
	local FuncName = "GDS: DebugLog(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.String, FuncName .. "MISSING PARAMETER: String =")
	assert2(type(params.String) == "string", FuncName .. "PARAMETER: String = IS NOT A STRING!")
	params.NpcId = params.NpcId or NpcId
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	return CGdsLogString:new(params.NpcId, params.String)
end

doc[numdoc] = [[Params: <code>String = "", NpcId = self,</code><br>Schreibt den String in die Log Datei. Mit diesem Befehl kann man rausfinden ob und wann ein bestimmter Actions = {} Block ausgeführt wurde.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function RemoveDialog(params)
	local FuncName = "GDS: RemoveDialog(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureClearDialogFlag:new(params.NpcId)
end

doc[numdoc] = [[Params: <code>NpcId = self ,</code><br>Nimmt dem NPC die Möglichkeit einen Dialog zu führen. Dieser wird dann nicht mehr ansprechbar sein, es sei denn er stirbt und respawned. Dann sollte man das RemoveDialog auch bei den Respawn Actions verwenden.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- for compatibility
function RemoveDialogFromNpc(params)
	print("NOTE: RemoveDialogFromNpc{}: please use RemoveDialog{} instead. However, this function still works.")
	return RemoveDialog(params)
end

-- **DOC** ----------------------------------------------------------
function EnableDialog(params)
	local FuncName = "GDS: EnableDialog(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	--params.Important = params.Important or TRUE
	params.Important = TRUE
	print(FuncName .. "Important is always TRUE!")
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureSetDialogFlag:new(params.NpcId, params.Important)
end

doc[numdoc] = [[Params: <code>NpcId = self, Important = TRUE</code><br>Gibt dem NPC die Möglichkeit einen Dialog zu führen zurück, wenn man ihn vorher mit RemoveDialog entfernt hat. Important besagt, ob der Dialog wichtig für den Spieler ist. Wenn FALSE, dann ist es ein Info-Dialog.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function SetDialogType(params)
	local FuncName = "GDS: SetDialogType(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	params.Type = params.Type or MainQuest
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureSetDialogFlag:new(params.NpcId, params.Type)
end

doc[numdoc] = [[Params: <code>NpcId = self, Type = MainQuest</code><br>Bestimmt welches Icon der Dialog NPC über seinem Kopf haben soll (schaltet nebenbei auch den Dialog an!). Es gibt folgende Types:<br><code>MainQuest<br>SideQuest<br></code>]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function EndDialog()
	return CGdsEndDialog:new()
end

doc[numdoc] = [[Params: <code>none</code><br>Beendet einen gerade aktiven Dialog mit sofortiger Wirkung.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function RevealUnExplored(params)
	local FuncName = "GDS: RevealUnExplored(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X =")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y =")
	params.Range = params.Range or 10
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsRevealUnExplored:new(params.X, params.Y, params.Range)
end

doc[numdoc] = [[Params: <code>X = , Y = , Range = 10</code><br>Lässt das UnExplored an der angegebenen Position verschwinden. Darf niemals mehrmals für dieselben Koordinaten aufgerufen werden!!! Deswegen am besten nur in OneTimeEvents benutzen.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function CutSceneBegin()
	if (Debug and Debug.DisableCutscenes == 1) and _DEBUG == 1 then
		return DebugLog{String = "CutScenes are disabled via config.lua ..."}
	end

	return CGdsCutScene:new(1)
end

doc[numdoc] = [[Params: <code>keine Parameter!</code><br>Beginnt eine CutScene (schwarze Balken einfahren).]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function CutSceneEnd()
	if (Debug and Debug.DisableCutscenes == 1) and _DEBUG == 1 then
		return DebugLog{String = "CutScenes are disabled via config.lua ..."}
	end

	return CGdsCutScene:new(0)
end

doc[numdoc] = [[Params: <code>keine Parameter!</code><br>Beendet eine CutScene (schwarze Balken abschalten).]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function CutSceneSay(params)
	local FuncName = "GDS: CutSceneSay(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.NpcId, FuncName .. "MISSING PARAMETER: NpcId = (can not be 'self' because of script parser)")
	assert2(params.String, FuncName .. "MISSING PARAMETER: String =")
	assert2(type(params.String) == "string", FuncName .. "INVALID PARAMETER: String must be a string!")
	params.Tag = params.Tag or ""
	params.Color = params.Color or ColorWhite
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	if Debug and Debug.DisableCutscenes == 1 and _DEBUG == 1 then
		return DebugLog{String = FuncName .. "CutScenes are disabled via config.lua ..."}
	end

	return CGdsCutSceneText:new(params.NpcId, params.Tag, params.String, params.Color)
end

doc[numdoc] = [[Params: <code>NpcId = , String = "", Tag = "", Color = ColorWhite</code><br>Gibt einen Text (mit Sprache) während einer CutScene aus. Folgende Color Codes sind definiert, mehr auf Anfrage:<br><code>
-------------------- COLORS -------------------------------------<br>
ColorWhite			=	kMnu_csWhite		-- = 0xCBCBCB, //white<br>
ColorPureWhite		=	kMnu_csFull			-- = 0xFFFFFF, //pure white<br>
ColorPureBlack		=	kMnu_csBlack		-- = 0x000000, //black<br>
ColorPureRed		=	kMnu_csPureRed		-- = 0xFF0000, //red<br>
ColorPureGreen		=	kMnu_csPureGreen	-- = 0x00FF00, //green<br>
ColorPureBlue		=	kMnu_csPureBlue		-- = 0x0000FF, //blue<br>
<br>
ColorBurntOrange	=	kMnu_csBurntOrange	-- = 0xCC9933,<br>
ColorSienna			=	kMnu_csSienna		-- = 0x993300,<br>
ColorRed			=	kMnu_csRed			-- = 0xFF3300,<br>
ColorDarkRed		=	kMnu_csDarkRed		-- = 0x990000,<br>
<br>
ColorSalmon			=	kMnu_csSalmon		-- = 0xFFCCCC,<br>
ColorPink			=	kMnu_csPink			-- = 0xFFCCFF,<br> 
ColorMagenta		=	kMnu_csMagenta		-- = 0xFF00FF,<br> 
ColorPurple			=	kMnu_csPurple		-- = 0xCC3399,<br> 
<br>
ColorViolett		=	kMnu_csViolett		-- = 0x660066,<br>
ColorLilac			=	kMnu_csLilac		-- = 0xCCCCFF,<br>
ColorLightBlue		=	kMnu_csLightBlue	-- = 0x6699CC,<br>
ColorRoyalBlue		=	kMnu_csRoyalBlue	-- = 0x3300FF,<br>
<br>
ColorDarkBlue		=	kMnu_csDarkBlue		-- = 0x333399,<br>
ColorLightCyan		=	kMnu_csLightCyan	-- = 0xCCFFFF,<br>
ColorCyan			=	kMnu_csCyan			-- = 0x00FFFF,<br>
ColorDarkCyan		=	kMnu_csDarkCyan		-- = 0x669999,<br>
<br>
ColorMint			=	kMnu_csMint			-- = 0xCCFFCC,<br>
ColorDarkMint		=	kMnu_csDarkMint		-- = 0x00CCCC,<br>
ColorLightGreen		=	kMnu_csLightGreen	-- = 0xCCFFCC,<br>
ColorGreen			=	kMnu_csGreen		-- = 0x33CC00,<br>
<br>
ColorGrassGreen		=	kMnu_csGrassGreen	-- = 0x66FF66,<br>
ColorSpringGreen	=	kMnu_csSpringGreen	-- = 0xCCFF00,<br>
ColorKhaki			=	kMnu_csKhaki		-- = 0x999933,<br>
ColorOlive			=	kMnu_csOlive		-- = 0x336600,<br>
<br>
ColorYellow			=	kMnu_csYellow		-- = 0xFFFF00,<br>
ColorLightYellow	=	kMnu_csLightYellow	-- = 0xFFFFCC,<br>
ColorSand			=	kMnu_csSand			-- = 0xCCCC00,<br>
ColorGrey			=	kMnu_csGrey			-- = 0x666666,<br></code> ]]
doc[numdoc] = nil
numdoc = numdoc + 1


-- **DOC** ----------------------------------------------------------
function PlaceObject(params)
	local FuncName = "GDS: PlaceObject(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X =")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y =")
	assert2(params.Object, FuncName .. "MISSING PARAMETER: Object =")
	params.Angle = params.Angle or floor(random(0, 359))
	--Jochens Änderungen
	params.DestroyNpc = params.DestroyNpc or FALSE
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	

	return CGdsSetObject:new(params.X, params.Y, params.Object, params.Angle, 0, params.DestroyNpc)
end

doc[numdoc] = [[Params: <code>X = , Y = , Object = , Angle = random, DestroyNpc = FALSE</code><br>Es wird ein (Misc) Object an der angegebenen Position erzeugt. Der Winkel (Angle) ist per default ein zufälliger Winkel. Das Object muss aus dem MiscId Range kommen (siehe db).Der DestroyNpc-Parameter gibt an, ob ein Npc, der sich auf dem Feld befindet, auf dem ein Objekt gespawnt wird gelöscht wird oder nicht.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function SpecialPlaceObjects(params)
	local FuncName = "GDS: SpecialPlaceObjects() :"
	assert2(type(params) == "table", FuncName.."PARAMETERS MUST BE PASSED AS A TABLE!")
	
	assert2(params.ObjectTable, FuncName .."ES GIBT KEINEN TABLE FÜR ZU PLACENDE OBJEKTE" )
	
	local action = CGdsSpecialSetObject:new ()
	
	foreachi (params.ObjectTable, function(i, obj)
		%action:AddObject (obj.X, obj.Y, obj.Object, random(0,359))
	end)
	return action
end	
	
doc[numdoc] = [[Params: <code>ObjectTable = {} ,</code><br>Spezialfall für Addon1. Jochen fragen.]]
doc[numdoc] = nil
numdoc = numdoc + 1
		
-- **DOC** ----------------------------------------------------------
function RemoveObject(params)
	local FuncName = "GDS: RemoveObject(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X =")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y =")
	assert2(params.Object, FuncName .. "MISSING PARAMETER: Object =")
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsSetObject:new(params.X, params.Y, params.Object, 0, 1)
end

doc[numdoc] = [[Params: <code>X = , Y = , Object = ,</code><br>Es wird ein Object an der angegebenen Position gelöscht. Es können nur Misc Objects (siehe db) gelöscht werden, und auch nur solche Objekte die keine NpcId haben!]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function TalkAnimPlay(params)
	local FuncName = "GDS: TalkAnimPlay(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	params.NpcId = params.NpcId or NpcId
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureSetTalkingFlag:new(params.NpcId, TRUE)
end

doc[numdoc] = [[Params: <code>NpcId = self ,</code><br>Die angegebene Figur beginnt Ihre Talkanims abzuspielen.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function TalkAnimStop(params)
	local FuncName = "GDS: TalkAnimStop(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	params.NpcId = params.NpcId or NpcId
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureSetTalkingFlag:new(params.NpcId, FALSE)
end

doc[numdoc] = [[Params: <code>NpcId = self ,</code><br>Die angegebene Figur hört auf Ihre Talkanims abzuspielen, und macht nur noch Idle Anims.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function Outcry(params)
	local FuncName = "GDS: Outcry(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.String, FuncName .. "MISSING PARAMETER: String =")
	assert2(type(params.String) == "string", FuncName .. "INVALID PARAMETER: String must be a string!")
	assert2(params.NpcId, FuncName .. "MISSING PARAMETER: NpcId = (can not be 'self' because of script parser!)")
	params.Tag = params.Tag or ""
	params.Color = params.Color or ColorWhite
	params.Delay = params.Delay or TRUE
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsInterferenceText:new(params.NpcId, params.Tag, params.String, params.Color, params.Delay)
end

doc[numdoc] = [[Params: <code>NpcId = , String = "" , Tag = "" , Delay = TRUE , Color = ColorWhite</code><br>Die angegebene Figur macht einen Zuruf der in der Statuszeile ausgegeben wird.<br>NEU: Delay parameter, damit kann man den 3-sekunden delay nach einem outcry abschalten, damit z.b. Gesprächs-Outcries direkt nacheinander abgespielt werden.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function SetInfoText(params)
	local FuncName = "GDS: SetInfoText(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.String, FuncName .. "MISSING PARAMETER: String =")
	assert2(type(params.String) == "string", FuncName .. "INVALID PARAMETER: String must be a string!")
	params.Tag = params.Tag or ""
	params.ClearAfterSpeech = params.ClearAfterSpeech or TRUE
	params.Color = params.Color or ColorWhite
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	-- HACK !!!
	if params.Color == ColorYellow and (PlatformId == 78 or PlatformId == 79) then
		--print("SetInfoText ohne waitforspeech: " .. params.String)
		params.ClearAfterSpeech = FALSE
	end

	return CGdsInfoText:new(params.Tag, params.String, params.Color, params.ClearAfterSpeech)
end

doc[numdoc] = [[Params: <code>String = "", Tag = "", Color = ColorWhite, ClearAfterSpeech = TRUE</code><br>Es wird ein (Tutorial) Info Text mit Sprachausgabe ausgegeben. Wenn String leer ist (String = "") dann wird der letzte Info text entfernt, ansonsten bleibt er solange angezeigt bis ein neuer Text kommt.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function ShowDebugText(params)
	local FuncName = "GDS: ShowDebugText(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.String, FuncName .. "MISSING PARAMETER: String =")
	assert2(type(params.String) == "string", FuncName .. "INVALID PARAMETER: String must be a string!")
	params.Tag = ""
	params.ClearAfterSpeech = TRUE
	params.Color = params.Color or ColorRed
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	if _DEBUG ~= TRUE then
		return CGdsLogString:new(0, params.String)
	else
		--return CGdsLogString:new(0, params.String)
		return CGdsInfoText:new(params.Tag, params.String, params.Color, params.ClearAfterSpeech)
	end
end

doc[numdoc] = [[Params: <code>String = "", Color = ColorRed</code><br>Es wird ein Debug Text ausgegeben.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function SetMinimapAlert(params)
	local FuncName = "GDS: SetMinimapAlert(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X =")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y =")
	params.Type = params.Type or AlertNotify
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsSetMinimapAlert:new(params.X, params.Y, params.Type)
end

doc[numdoc] = [[Params: <code>X = , Y = , Type = AlertNotify</code><br>Es wird ein Minimap Signal (Alarm) angezeigt. Es gibt folgende Alarm Typen:<br><code>AlertAttack<br>AlertScout<br>AlertNotify<br>AlertDragica<br></code>]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function SetFreezeFlagTrue(params)
	local FuncName = "GDS: SetFreezeFlagTrue(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	params.NpcId = params.NpcId or NpcId
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureSetFreezeFlag:new(params.NpcId, TRUE)
end

doc[numdoc] = [[Params: <code>NpcId = self</code><br>Friert die Animation der Figur ein.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function SetFreezeFlagFalse(params)
	local FuncName = "GDS: SetFreezeFlagFalse(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	params.NpcId = params.NpcId or NpcId
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureSetFreezeFlag:new(params.NpcId, FALSE)
end

doc[numdoc] = [[Params: <code>NpcId = self</code><br>Spielt wieder die Idle anim ab nach einem freeze.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function SetNoFightFlagTrue(params)
	local FuncName = "GDS: SetNoFightFlagTrue(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureSetVIP:new(params.NpcId, TRUE)
end

doc[numdoc] = [[Params: <code>NpcId = self</code><br>Setzt die Figur mit der angegebenen NpcId VIP, d.h. diese Figur wird in Kämpfen nicht beachtet. Bitte nur für Cutscenes verwenden!]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function SetNoFightFlagFalse(params)
	local FuncName = "GDS: SetNoFightFlagFalse(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureSetVIP:new(params.NpcId, FALSE)
end

doc[numdoc] = [[Params: <code>NpcId = self</code><br>Setzt die Figur mit der angegebenen NpcId VIP, d.h. diese Figur wird in Kämpfen wieder beachtet. Bitte nur für Cutscenes verwenden!]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function HoldPosition(params)
	local FuncName = "GDS: HoldPosition(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	params.FreeWill = params.FreeWill or FALSE
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureHoldPosition:new(params.NpcId, params.FreeWill)
end

doc[numdoc] = [[Params: <code>NpcId = self, FreeWill = FALSE</code><br>Die Figur hält ihre Position bei und kämpft erst wenn der Gegner in Waffenreichweite kommt. Wenn das FreeWill Flag TRUE ist wird HoldPosition wieder aufgehoben, Default ist FALSE]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function Kill(params)
	local FuncName = "GDS: Kill(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsKillNpc:new(params.NpcId)
end

doc[numdoc] = [[Params: <code>NpcId = self</code><br>Die Figur stirbt, mit Todes-Animation.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function SetHealth(params)
	local FuncName = "GDS: SetHealth(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	assert2(params.HitPoints, FuncName .. "MISSING PARAMETER: HitPoints = ")
	params.Decrease = params.Decrease or FALSE
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureSetHealth:new(params.NpcId, params.HitPoints, params.Decrease)
end

doc[numdoc] = [[Params: <code>HitPoints = , NpcId = self, Decrease = FALSE</code><br>Setzt die Anzahl Hitpoints von diesem NPC. Es muss darauf geachtet werden das die HitPoints nie höher ist als die max. Hitpoints die der NPC haben kann! Ist Decrease = TRUE dann wird vom aktuellen Healthwert die Menge hitpoints abgezogen.]]
doc[numdoc] = nil
numdoc = numdoc + 1
-- **DOC** ----------------------------------------------------------
function SetMana(params)
	local FuncName = "GDS: SetMana(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	assert2(params.Mana, FuncName .. "MISSING PARAMETER: Mana = ")
	params.Decrease = params.Decrease or FALSE
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureSetMana:new(params.NpcId, params.Mana, params.Decrease)
end

doc[numdoc] = [[Params: <code>Mana = , NpcId = self, Decrease = FALSE</code><br>Setzt die Anzahl Mana von diesem NPC. Es muss darauf geachtet werden das das Mana nie mehr ist als die max. Manazahl die der NPC haben kann! Ist Decrease = TRUE dann wird vom aktuellen Manawert die Menge Mana abgezogen.<br>Mana-mana! Dip-diiii-di-didi ...]]
doc[numdoc] = nil
numdoc = numdoc + 1
-- **DOC** ----------------------------------------------------------
function TeleportAvatar(params)
	local FuncName = "GDS: TeleportAvatar(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X = ")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y = ")
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsAvatarTeleport:new(params.X, params.Y)
end

doc[numdoc] = [[Params: <code>X = , Y = ,</code><br>Teleportiert den Avatar an die angegebenen Koordinaten. NUR FÜR CUTSCENES !!!<br>ACHTUNG: wenn sich der spieler in der 3rd person view befindet, wird der Avatar NICHT umteleportiert! Dies ist der Hauptgrund das man es nur in der Cutscene einsetzen darf wenn die Kamera bereits im "freien" Kameramodus ist!]]
doc[numdoc] = nil
numdoc = numdoc + 1
-- **DOC** ----------------------------------------------------------
function PlaySound(params)
	local FuncName = "GDS: PlaySound(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(params.Sound, FuncName .. "MISSING PARAMETER: Sound = ")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsUISoundEvent:new(params.Sound)
end

doc[numdoc] = [[Params: <code>Sound = </code><br>Spielt einen Sound der im Code definiert ist. Folgende Sounds sind verwendbar:<code><br>SoundAttackSignalTroops<br>SoundColosseumApplause<br>SoundColosseumBoohs<br>SoundColosseumCheers<br>SoundDragonSpawn<br>SoundEmpyriaBard1<br>SoundEmpyriaBard2<br>SoundEmpyriaBard3<br>SoundEmpyriaBard4<br>SoundEmpyriaBazaar1<br>SoundEmpyriaBazaar2<br>SoundEmpyriaCrowd1<br>SoundEmpyriaCrowd2<br>SoundHowlingHeads<br>SoundPentacleDestroyed<br>SoundSacredFreedom<br>SoundStoneExplosion<br>SoundVolcanoGrumble<br></code>]]
doc[numdoc] = nil
numdoc = numdoc + 1
------------------------------------------------------------------------
