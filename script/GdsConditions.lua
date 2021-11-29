-- You Are Currently Editing: 
-----------------------------
--		GdsConditions.lua
-----------------------------


-- GdsCreateDoc HTML doc generator needs these:
-- every function to be documented must be marked with a **DOC** comment as seen below
numdoc = 1
doc = {}

-----------------------------------------------------------
function ParametrizeCondition(_Condition, _Parameters)
	if _Parameters ~= nil and type(_Parameters) == "table" then
		if _Parameters.UpdateInterval then
			if _Parameters.UpdateInterval > 1 then
				if PlatformId == 209 then
					_Condition:SetUpdateInterval(_Parameters.UpdateInterval * 2)
				--elseif PlatformId == 207 then
				--	_Condition:SetUpdateInterval(_Parameters.UpdateInterval + random(1,15))
				else
					_Condition:SetUpdateInterval(_Parameters.UpdateInterval)
				end
			else
				_Condition:SetUpdateInterval(1)
			end
		end
	end
end

-- **DOC** -----------------------------------------------------------
function TimeOfDay(params)
	local FuncName = "GDS: TimeOfDay(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Hour, FuncName .. "MISSING PARAMETER: Hour = ")
	assert2(params.Hour >= 0 and params.Hour < 24, FuncName .. "INVALID PARAMETER: Hour = " .. tostring(params.Hour))
	if params.Minute then
		assert2(params.Minute >= 0 and params.Minute < 59, FuncName .. "INVALID PARAMETER: Minute = " .. tostring(params.Minute))
	else
		params.Minute = 0
	end
	if params.TimeFrame then
		assert2(params.TimeFrame > 0, FuncName .. "INVALID PARAMETER: TimeFrame = " .. tostring(params.TimeFrame))
	else
		params.TimeFrame = 15
	end
	params.Second = 0
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
		
	params.TimeFrame = params.TimeFrame * 60	
	local condition = CGdsTimeOfDay:new(hms(params.Hour, params.Minute, params.Second), params.TimeFrame)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Hour = , Minute = 0, TimeFrame = 15, UpdateInterval = 60 </code><br>Prüft ob die aktuelle Uhrzeit der angegebenen entspricht, mit einer Toleranz von + TimeFrame Minuten. Es muss z.b. bei 12:30 mind. 12:30 Uhr sein, maximal darf es 12:30 + TimeFrame Minuten sein, damit die Bedingung wahr wird.<br>Minute ist optional, default 0. TimeFrame ist optional, default sind 15 Minuten.<br>UpdateInterval besagt wie häufig der Wert gepollt werden soll in GdSteps (10 GdSteps = 1 Sekunde). Der Default Wert ist 60 GdSteps wenn UpdateInterval nicht angegeben wurde.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function TimeBetween(params)
	local FuncName = "GDS: TimeBetween(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Hour, FuncName .. "MISSING PARAMETER: Hour = ")
	assert2(params.Hour >= 0 and params.Hour < 24, FuncName .. "INVALID PARAMETER: Hour = " .. tostring(params.Hour))
	if params.Minute then
		assert2(params.Minute >= 0 and params.Minute < 60, FuncName .. "INVALID PARAMETER: Minute = " .. tostring(params.Minute))
	else
		params.Minute = 0
	end
	assert2(params.ToHour, FuncName .. "MISSING PARAMETER: ToHour = ")
	assert2(params.ToHour >= 0 and params.ToHour < 24, FuncName .. "INVALID PARAMETER: ToHour = " .. tostring(params.ToHour))
	if params.ToMinute then
		assert2(params.ToMinute >= 0 and params.ToMinute < 60, FuncName .. "INVALID PARAMETER: ToMinute = " .. tostring(params.ToMinute))
	else
		params.ToMinute = 0
	end
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	local TMin1 = params.Hour * 60 + params.Minute
	local TMin2 = params.ToHour * 60 + params.ToMinute
	assert2(TMin1 < TMin2, FuncName .. "INVALID PARAMETERS: ToHour:ToMinute must be a later time than Hour:Minute!")
	
	params.TimeFrame = TMin2 - TMin1
	return TimeOfDay{Hour = params.Hour, Minute = params.Minute, TimeFrame = params.TimeFrame, UpdateInterval = params.UpdateInterval}
end

doc[numdoc] = [[Params: <code>Hour = , Minute = 0, ToHour = , ToMinute = 0, UpdateInterval = 60</code><br>Prüft ob die aktuelle Uhrzeit im Spiel zwischen der ersten und der zweiten liegt. Die erste Uhrzeit muss zeitlich VOR der zweiten liegen, also z.b. 00:00 und 23:59 wäre das Extrembeispiel. Minute ist jeweils optional, default 0.<br>UpdateInterval besagt wie häufig der Wert gepollt werden soll in GdSteps (10 GdSteps = 1 Sekunde). Der Default Wert ist 60 GdSteps (1 Minute) wenn UpdateInterval nicht angegeben wurde.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function TimeTorchOn()
	return Negated(TimeBetween{Hour = 4, Minute = 15, ToHour = 18, ToMinute = 0})
end

doc[numdoc] = [[Prüft ob es Zeit ist die Nachtbeleuchtung (Fackeln) anzumachen. TimeTorchOn ist definiert als Zeit zwischen 18:00 Uhr und 23:59 Uhr abends. Nützlich für Tagesabläufe oder Events die möglichst immer zur selben Uhrzeit (auf versch. maps) ausgeführt werden sollen, z.b. die Fackeln nachts anschalten.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function TimeTorchOff()
	return TimeBetween{Hour = 4, Minute = 15, ToHour = 18, ToMinute = 0}
end

doc[numdoc] = [[Prüft ob es Zeit ist die Nachtbeleuchtung (Fackeln) auszumachen weil es hell genug ist. TimeTorchOn ist definiert als Zeit zwischen 04:15 Uhr und 16:00 Uhr. Nützlich für Tagesabläufe oder Events die möglichst immer zur selben Uhrzeit (auf versch. maps) ausgeführt werden sollen, z.b. die Fackeln nachts anschalten.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function TimeDawn()
	return TimeBetween{Hour = 3, Minute = 30, ToHour = 5, ToMinute = 0}
end

doc[numdoc] = [[Prüft ob es Morgendämmerung (Dawn) ist. Dawn ist definiert als Zeit zwischen 03:30 Uhr und 05:00 Uhr morgens. Nützlich für Tagesabläufe oder Events die möglichst immer zur selben Uhrzeit (auf versch. maps) ausgeführt werden sollen, z.b. die Fackeln nachts anschalten.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function TimeDay()
	return TimeBetween{Hour = 5, Minute = 0, ToHour = 19, ToMinute = 0}
end

doc[numdoc] = [[Prüft ob es Tag ist. Tag ist definiert als Zeit zwischen 05:00 Uhr morgens und 19:00 Uhr abends. Nützlich für Tagesabläufe oder Events die möglichst immer zur selben Uhrzeit (auf versch. maps) ausgeführt werden sollen, z.b. die Fackeln nachts anschalten.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function TimeForeNoon()
	return TimeBetween{Hour = 5, Minute = 0, ToHour = 11, ToMinute = 0}
end

doc[numdoc] = [[Prüft ob es Vormittag ist. Vormittag ist definiert als Zeit zwischen 05:00 Uhr morgens und 11:00 Uhr vormittags. Nützlich für Tagesabläufe oder Events die möglichst immer zur selben Uhrzeit (auf versch. maps) ausgeführt werden sollen, z.b. die Fackeln nachts anschalten.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function TimeBreakFast()
	return TimeBetween{Hour = 7, Minute = 30, ToHour = 8, ToMinute = 30}
end

doc[numdoc] = [[Prüft ob es Zeit zum Frühstücken ist. Frühstück findet immer zwischen 07:30 Uhr und 08:30 Uhr morgens statt. Nützlich für Tagesabläufe oder Events die möglichst immer zur selben Uhrzeit (auf versch. maps) ausgeführt werden sollen, z.b. die Fackeln nachts anschalten.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function TimeNoon()
	return TimeBetween{Hour = 11, Minute = 0, ToHour = 13, ToMinute = 0}
end

doc[numdoc] = [[Prüft ob es Mittag ist. Mittag ist definiert als Zeit zwischen 11:00 Uhr vormittags und 13:00 Uhr nachmittags. Nützlich für Tagesabläufe oder Events die möglichst immer zur selben Uhrzeit (auf versch. maps) ausgeführt werden sollen, z.b. die Fackeln nachts anschalten.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function TimeAfterNoon()
	return TimeBetween{Hour = 13, Minute = 0, ToHour = 19, ToMinute = 0}
end

doc[numdoc] = [[Prüft ob es Nachmittag ist. Nachmittag ist definiert als Zeit zwischen 13:00 Uhr nachmittags und 19:00 Uhr abends. Nützlich für Tagesabläufe oder Events die möglichst immer zur selben Uhrzeit (auf versch. maps) ausgeführt werden sollen, z.b. die Fackeln nachts anschalten.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function TimeTeaTime()
	return TimeBetween{Hour = 15, Minute = 30, ToHour = 16, ToMinute = 30}
end

doc[numdoc] = [[Prüft ob es Zeit für den Nachmittags-Tee ist. Tee-Zeit ist immer zwischen 15:30 Uhr und 16:30 Uhr nachmittags. Nützlich für Tagesabläufe oder Events die möglichst immer zur selben Uhrzeit (auf versch. maps) ausgeführt werden sollen, z.b. die Fackeln nachts anschalten.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function TimeDusk()
	return TimeBetween{Hour = 19, Minute = 0, ToHour = 20, ToMinute = 30}
end

doc[numdoc] = [[Prüft ob es Sonnenuntergang (Dusk) ist. Dusk ist definiert als Zeit zwischen 19:00 Uhr und 20:30 Uhr abends. Nützlich für Tagesabläufe oder Events die möglichst immer zur selben Uhrzeit (auf versch. maps) ausgeführt werden sollen, z.b. die Fackeln nachts anschalten.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function TimeNight()
	return Negated(TimeDay())
end

doc[numdoc] = [[Prüft ob es Nacht ist. Die Nacht ist definiert als Zeit zwischen 20:30 Uhr abends und 3:30 Uhr morgens. Nützlich für Tagesabläufe oder Events die möglichst immer zur selben Uhrzeit (auf versch. maps) ausgeführt werden sollen, z.b. die Fackeln nachts anschalten.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function TimeNightExtended()
	return Negated(TimeDay())
end

doc[numdoc] = [[Prüft ob es Nacht ist, inklusive Abend- und Morgendämmerung. Die "lange" Nacht ist definiert als Zeit zwischen 19:00 Uhr abends und 5:00 Uhr morgens. Nützlich für Tagesabläufe oder Events die möglichst immer zur selben Uhrzeit (auf versch. maps) ausgeführt werden sollen, z.b. die Fackeln nachts anschalten.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function TimeNightBeforeMidnight()
	return TimeBetween{Hour = 20, Minute = 30, ToHour = 23, ToMinute = 59}
end

doc[numdoc] = [[Prüft ob es Nacht (vor Mitternacht) ist. Die Nacht vor Mitternacht ist definiert als Zeit zwischen 20:30 Uhr abends und 23:59 Uhr nachts. Nützlich für Tagesabläufe oder Events die möglichst immer zur selben Uhrzeit (auf versch. maps) ausgeführt werden sollen, z.b. die Fackeln nachts anschalten.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function TimeNightAfterMidnight()
	return TimeBetween{Hour = 0, Minute = 0, ToHour = 3, ToMinute = 30}
end

doc[numdoc] = [[Prüft ob es Nacht (nach Mitternacht) ist. Die Nacht nach Mitternacht ist definiert als Zeit zwischen 00:00 Uhr abends und 03:30 Uhr morgens. Nützlich für Tagesabläufe oder Events die möglichst immer zur selben Uhrzeit (auf versch. maps) ausgeführt werden sollen, z.b. die Fackeln nachts anschalten.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function FigureDying(params)
	local FuncName = "GDS: FigureDying(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureDeadEvent:new(params.NpcId)
end

doc[numdoc] = [[Params: <code>NpcId = self</code><br>Prüft, ob der angegebene NPC gerade stirbt.... nicht verwechseln mit „NPC ist tot“ ... diese condition ist nur in dem Augenblick wahr, wenn die Figur gerade stirbt (sozusagen der letzte Atemzug). Der Test funktioniert auf sich selbst nur dann, wenn der Npc keine Respawn Funktion hat. Ansonsten muss man die DeathActions bei Respawn benutzen um beim Sterben eine Action auszulösen. Wenn der Npc keinen Respawn hat empfiehlt es sich generell gleich auf das OnDyingEvent zurückzugreifen.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsCreoActive(params)
	local FuncName = "GDS: IsCreoActive: "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert(params.CreoId,FuncName .. "Missing Parameter: CreoId = ?")
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsIsCreoActive:new(params.CreoId)
end

doc[numdoc] = [[Params: <code>NpcId = self</code><br>Prüft, ob der Held mit der Angegebenen Creo vorhanden ist.... ]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function AvatarLocalTeleport(params)
	local FuncName = "GDS: AvatarLocalTeleport(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(getn(tkeys(params)) == 0, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsAvatarLocalTeleport:new()
end

doc[numdoc] = [[to be written]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function FigureDominated(params)
	local FuncName = "GDS: FigureDominated(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsFigureIsDominated:new(params.NpcId)
	ParametrizeCondition(condition, _Parameters)
	return condition
end

doc[numdoc] = [[Params: <code>NpcId = self</code><br>Prüft, ob der angegebene NPC dominated ist.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function FigureDead(params)
	local FuncName = "GDS: FigureDead(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.NpcId, FuncName .. "MISSING PARAMETER: NpcId = ")
	if NpcId ~= Avatar then
		--assert2(params.NpcId ~= NpcId, FuncName .. "NOT ALLOWED: this condition can not be applied to the NPC who is testing the condition.\n" .. FuncName .. "It can only test for other NPCs being dead, never itself.")
	end
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsFigureAlive:new(params.NpcId)
	condition:ToggleNegated()
	return condition
end

doc[numdoc] = [[Params: <code>NpcId = </code><br>Prüft, ob der angegebene NPC tot ist. Kann nicht auf sich selbst angewendet werden (wenn man tot ist, hat man besseres zu tun als Conditions zu prüfen *g*).]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function FigureAlive(params)
	local FuncName = "GDS: FigureAlive(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.NpcId, FuncName .. "MISSING PARAMETER: NpcId = ")
--	if NpcId ~= Avatar then
--		assert2(params.NpcId ~= NpcId, FuncName .. "NOT ALLOWED: this condition can not be applied to the NPC who is testing the condition.\n" .. FuncName .. "It just doesn't make sense to test oneself for being alive. ;)")
--	end
	assert2(getn(tkeys(params)) == 1, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")
	
	return CGdsFigureAlive:new(params.NpcId)
end

doc[numdoc] = [[Params: <code>NpcId = </code><br>Prüft, ob der angegebene NPC noch lebt.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function PlayerHasItem(params)
	local FuncName = "GDS: PlayerHasItem(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.ItemId, FuncName .. "MISSING PARAMETER: ItemId = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.Amount = params.Amount or 1
	params.Equipment = params.Equipment or EquipmentAll
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsInventoryLookup:new(params.ItemId, 1, params.Equipment, params.Amount)
	ParametrizeCondition(condition, _Parameters)
	return condition
end

doc[numdoc] = [[Params: <code>ItemId = , Amount = 1, Equipment = EquipmentAll, UpdateInterval = 60</code><br>Hat der Player (Avatar oder einer seiner Helden) das Item "ItemId" im inventory? ItemId ist natürlich eine ItemId aus der db. Equipment bestimmt ob alles durchsucht wird (EquipmentAll), d.h. inventory und alle items die Helden und Avatar equipped haben. Oder man sucht nur nach items die entweder der Avatar equipped hat (EquipmentAvatar) oder einer seiner Helden (EquipmentHero).<br>UpdateInterval besagt wie häufig der Wert gepollt werden soll in GdSteps (10 GdSteps = 1 Sekunde). Der Default Wert ist 60 GdSteps (1 Minute) wenn UpdateInterval nicht angegeben wurde.]]
doc[numdoc] = nil
numdoc = numdoc + 1


function AvatarHasItem(params)
	return PlayerHasItemEquipped(params)
end
-- **DOC** -----------------------------------------------------------
function PlayerHasItemEquipped(params)
	local FuncName = "GDS: PlayerHasItemEquipped(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.ItemId, FuncName .. "MISSING PARAMETER: ItemId = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.Amount = params.Amount or 1
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsInventoryLookup:new(params.ItemId, 1, EquipmentAvatar, params.Amount)
	ParametrizeCondition(condition, _Parameters)
	return condition
end

doc[numdoc] = [[Params: <code>ItemId = , Amount = 1,UpdateInterval = 60</code><br>Hat der Avatar (ohne Helden) das Item "ItemId" im Equipment? Die ItemId kommt natürlich aus der db.<br>UpdateInterval besagt wie häufig der Wert gepollt werden soll in GdSteps (10 GdSteps = 1 Sekunde). Der Default Wert ist 60 GdSteps (1 Minute) wenn UpdateInterval nicht angegeben wurde.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function PlayerHasNotItem(params)
	local FuncName = "GDS: PlayerHasNotItem(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.ItemId, FuncName .. "MISSING PARAMETER: ItemId = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.Amount = params.Amount or 1
	params.Equipment = params.Equipment or EquipmentAll
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsInventoryLookup:new(params.ItemId, 0, params.Equipment, params.Amount)
	ParametrizeCondition(condition, _Parameters)
	return condition
end

doc[numdoc] = [[Params: <code>ItemId = , Amount = 1, Equipment = EquipmentAll, UpdateInterval = 60</code><br>Hat Player (Avatar oder Helden) das Item "ItemId" NICHT im inventory? ItemId wie in der db. Equipment bestimmt ob alles durchsucht wird (EquipmentAll), d.h. inventory und alle items die Helden und Avatar equipped haben. Oder man sucht nur nach items die entweder der Avatar equipped hat (EquipmentAvatar) oder einer seiner Helden (EquipmentHero).<br>UpdateInterval besagt wie häufig der Wert gepollt werden soll in GdSteps (10 GdSteps = 1 Sekunde). Der Default Wert ist 60 GdSteps (1 Minute) wenn UpdateInterval nicht angegeben wurde.]]
doc[numdoc] = nil
numdoc = numdoc + 1

function AvatarHasNotItem(params)
	return PlayerHasItemNotEquipped(params)
end
-- **DOC** -----------------------------------------------------------
function PlayerHasItemNotEquipped(params)
	local FuncName = "GDS: PlayerHasItemNotEquipped(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.ItemId, FuncName .. "MISSING PARAMETER: ItemId = ")
	params.UpdateInterval = params.UpdateInterval or 60
	params.Amount = params.Amount or 1
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsInventoryLookup:new(params.ItemId, 0, EquipmentAvatar, params.Amount)
	ParametrizeCondition(condition, _Parameters)
	return condition
end

doc[numdoc] = [[Params: <code>ItemId = , Amount = 1, UpdateInterval = 60</code><br>Hat der Avatar (ohne Helden) das Item "ItemId" NICHT im inventory? ItemId wie aus der db.<br>UpdateInterval besagt wie häufig der Wert gepollt werden soll in GdSteps (10 GdSteps = 1 Sekunde). Der Default Wert ist 60 GdSteps (1 Minute) wenn UpdateInterval nicht angegeben wurde.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function Negated(_condition)
	assert2(_condition, "GDS: Negated(): MISSING PARAMETER: condition")
	_condition:ToggleNegated()
	return _condition
end

doc[numdoc] = [[Negiert die in Klammern angegebene condition, so das man z.b. abfragen kann ob ein Spieler ein bestimmtes item NICHT hat oder ob eine Figur tot ist. Das müsste man dann so schreiben:<br><code>
Negated(PlayerHasItem{NpcId = 123})<br>
Negated(FigureAlive{NpcId = 234})<br></code>Hauptsächlich intern für die Scriptbefehle verwendet. Es lässt sich übrigens mehrfach verwenden, ein doppeltes Negated würde dasselbe Ergebnis liefern wie kein Negated. Dieser Fall tritt aber nur beim AllClear export auf und man sollte ihn im normalen Script code nicht anwenden!]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function FigureInRange(params)
	local FuncName = "GDS: FigureInRange(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X = ")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y = ")
	params.NpcId = params.NpcId or NpcId
	params.Range = params.Range or 2
	--if params.UpdateInterval then
	--	print(FuncName .. "does not support UpdateInterval, ignored.")
	--end
	--params.UpdateInterval = nil
	if PlatformId >= 200 then
		params.UpdateInterval = params.UpdateInterval or 60
	else
		params.UpdateInterval = 10
	end
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureInRangeCircle:new(params.NpcId, params.X, params.Y, params.Range)
end

doc[numdoc] = [[Params: <code>X = , Y = , NpcId = self, Range = 2</code><br>Prüft, ob die angegebene Figur mit dieser NpcId in der Nähe des Zielpunkts ist. Dabei wird auf die Zielkoordinaten X,Y plus Range (in Tiles) geschaut und wenn die Figur in dem Radius gefunden wurde ist die Bedingung wahr.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function AvatarInRange(params)
	local FuncName = "GDS: AvatarInRange(): "
	params.NpcId = Avatar

	return FigureInRange(params)
end

doc[numdoc] = [[Params: <code>X = , Y = , Range = 2</code><br>Prüft, ob der Avatar in der Nähe des Zielpunkts ist. Verwendet intern einfach FigureInRange mit NpcId = Avatar.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function FigureJob(params)
	local FuncName = "GDS: FigureJob(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	if params.JobClass then 
		params.Job = params.JobClass
		params.JobClass = nil
	end
	params.Job = params.Job or JobIdle
	params.NpcId = params.NpcId or NpcId
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	return CGdsFigureJob:new(params.NpcId, params.Job)
end

doc[numdoc] = [[Params: <code>Job = JobIdle, NpcId = self</code><br>Prüft ob die Figur einem bestimmten Job nachgeht. Im Moment gibts nur <code>JobIdle</code> als Job.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function BuildingInRange(params)
	local FuncName = "GDS: BuildingInRange(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X = ")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y = ")
	if params.Radius then
		params.Range = params.Radius
		params.Radius = nil
	else
		params.Range = params.Range or 0
	end
	params.Owner = params.Owner or OwnerAll
	params.BuildingId = params.BuildingId or 0
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 6, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsBuildingInRangeCircle:new(params.X, params.Y, params.Range, params.Owner, params.BuildingId)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>X = , Y = , Range = 0, Owner = <code>OwnerAll</code> , BuildingId = 0 , UpdateInterval = 60</code><br>Prüft, ob ein bestimmtes oder überhaupt ein Gebäude (BuildingId == 0) sich in der angegebenen Area befindet. Als Owner kommen folgende in Frage:<br><code>OwnerAll, OwnerPlayer, OwnerNpc</code>]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function EnemyUnitInRange(params)
	local FuncName = "GDS: EnemyUnitInRange(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X = ")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y = ")
	if params.Radius then
		params.Range = params.Radius
		params.Radius = nil
	else
		params.Range = params.Range or 0
	end
	params.UnitId = params.UnitId or 0
	params.NpcId = params.NpcId or 0
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 6, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsEnemyUnitInRangeCircle:new(params.X, params.Y, params.Range, params.NpcId, params.UnitId)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>X = , Y = , NpcId = Avatar, Range = 0, UnitId = 0, UpdateInterval = 60</code><br>Prüft, ob sich eine gegnerische Unit mit der angegebenen UnitId (oder überhaupt eine gegnerische Unit wenn UnitId == 0 ist) in der angegebenen Area befindet. Ausgehend von der NpcId wird entschieden was Freund und was Feind ist. Per Default wird der Avatar (Spieler) benutzt, man kann aber auch beispielsweise die NpcId eines Orc angeben, und für diesen wären Enemy Units eben auch Player Units oder z.b. Skelette.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function PlayerUnitInRange(params)
	local FuncName = "GDS: PlayerUnitInRange(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X = ")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y = ")
	if params.Radius then
		params.Range = params.Radius
		params.Radius = nil
	else
		params.Range = params.Range or 0
	end
	params.FigureType = params.FigureType or FigureAll
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	if PlatformId > 200 and PlatformId <= 215 then
		if params.FigureType == FigureAvatar then
			params.FigureType = nil
			params.UpdateInterval = nil
			print("GDS: Re-routing PlayerUnitInRange(Type = Avatar) to AvatarInRange because it is faster.")
			return AvatarInRange(params)
		end
	end

	local condition = CGdsPlayerFigureInRangeCircle:new(params.X, params.Y, params.Range, params.FigureType)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>X = , Y = , Range = 0, FigureType = <code>FigureAll</code> , UpdateInterval = 60</code><br>Prüft, ob sich eine Spieler-Unit in der Area befindet. Es kann auf <code>FigureAvatar, FigureHero, FigureRest </code>(vom Spieler produzierte Einheiten) oder<code> FigureAll</code> geprüft werden.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function PlayerBuildingExists(params)
	local FuncName = "GDS: PlayerBuildingExists(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.BuildingId, FuncName .. "MISSING PARAMETER: BuildingId = ")
	params.Player = params.Player or 1
	params.Amount = params.Amount or 1
	params.OnlyWhenBuiltUp = params.OnlyWhenBuiltUp or TRUE
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsPlayerHasBuiltBuilding:new(params.Player, params.BuildingId, params.OnlyWhenBuiltUp, params.Amount)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>BuildingId = , Amount = 1, OnlyWhenBuiltUp = TRUE, Player = self, UpdateInterval = 60</code><br>Prüft ob der Spieler ein Gebäude der angegebenen BuildingId gebaut hat bzw. angefangen hat zu bauen. Wenn OnlyWhenBuiltUp = TRUE ist dann wird die Bedingung erst wahr, wenn das erbauen des Gebäude fertiggestellt ist. Ansonsten reicht schon der Bauauftrag.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function PlayerHasGood(params)
	local FuncName = "GDS: PlayerHasGood(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Good, FuncName .. "MISSING PARAMETER: Good = ")
	
	params.Side = params.Side or SideGood
	
	params.Amount = params.Amount or 1
	params.Player = params.Player or 1
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 5, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsPlayerHasResource:new(params.Player, params.Side, params.Good, params.Amount)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Good = , Amount = 1, Side = <code>SideAll</code> , Player = self , UpdateInterval = 60</code><br>Prüft ob der Spieler eine bestimmte Menge (Amount) einer bestimmten Ressource hat. Side bestimmt welcher Resourcen-Pool gecheckt werden soll: <code>SideLight</code> oder <code>SideDark</code>. Also ob die Goods der hellen, der dunklen oder beider Seiten geprüft werden sollen.<br>Folgende Goods (Ressourcen-Typen) gibt es:<br>
<code>GoodBoard<br>GoodStone<br>GoodMithril<br>GoodFood<br>GoodIron<br>GoodManaElixir<br>GoodManaHerb<br></code>]]
doc[numdoc] = nil
numdoc = numdoc + 1


-- **DOC** -----------------------------------------------------------
function PlayerHasMoney(params)
	local FuncName = "GDS: PlayerHasKnete(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.Copper = params.Copper or 0
	params.Silver = params.Silver or 0
	params.Gold = params.Gold or 0
	if params.Amount then params.Copper = params.Amount; params.Amount = nil; end
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local CopperPieces = params.Copper + params.Silver * 100 + params.Gold * 100 * 100
	print(FuncName .. "Gold = " .. params.Gold .. ", Silver = " .. params.Silver .. ", Copper = " .. params.Copper .. " -- Sum: " .. CopperPieces .. " Copper")

	local condition = CGdsPlayerCashRequest:new(CopperPieces)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Gold = 0, Silver = 0, Copper = 0, UpdateInterval = 60</code><br>Prüft ob der Spieler eine bestimmte Menge an Geld hat. Wenn nicht, verliert er sein Leben ...<br>Hinweis: der alte Parameter "Amount" ist gleichbedeutend mit Copper, d.h. an diesen Werten muss man nichts ändern.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsClanLevel(params)
	local FuncName = "GDS: IsClanLevel(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Clan, FuncName .. "MISSING PARAMETER: Clan = ")
	assert2(params.Level, FuncName .. "MISSING PARAMETER: Level = ")
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsClanLevel:new(params.Clan, params.Level)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Clan = , Level = , UpdateInterval = 60</code><br>Prüft ob der angegebene Clan ein Mindestlevel hat. Das Level ist in diesem Falle die Summe der Levels aller Units die zu diesem Clan gehören. Also wenn in einem Clan 10 Units mit Level 10 wären, hätten diese den "ClanLevel" 100 - ebenso wie 20 Clan-Units mit Level 5 oder 100 mit Level 1. Dies dient einer ungefähren Stärke-Einschätzung eines Clans.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsClanSize(params)
	local FuncName = "GDS: IsClanSize(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Clan, FuncName .. "MISSING PARAMETER: Clan = ")
	assert2(params.Size, FuncName .. "MISSING PARAMETER: Size = ")
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsClanMember:new(params.Clan, params.Size)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Clan = , Size = , UpdateInterval = 60</code><br>Prüft ob der angegebene Clan eine Mindestgrösse hat. Der Parameter Size ist in diesem Falle die Anzahl der Units die zu diesem Clan gehören. Also wenn in einem Clan 10 Units wären, hätte dieser den "ClanSize" 10, unabhängig vom Level. Dies dient vor allem zur Einheitenbegrenzung eines Clans.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function IsMonumentInUse(params)
	local FuncName = "GDS: IsMonumentInUse(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.X, FuncName .. "MISSING PARAMETER: X = ")
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y = ")
	params.Range = params.Range or 5
--if params.UpdateInterval then assert2(FuncName .. "UpdateInterval not supported due to an obscure bug ...") end
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsMonumentOccupied:new(params.X, params.Y, params.Range)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>X = , Y = , Range = 5, UpdateInterval = 60</code><br>Prüft ob an der angegebenen Stelle sich ein Monument befindet, das vom Spieler "benutzt" wird, also vom Spieler belegt worden ist. Das soll auch Bindstones beinhalten (untested), in jedem Fall aber Helden und Aufbaumonumente.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function FigureInRangeNpc(params)
	local FuncName = "GDS: FigureInRangeNpc(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	assert2(params.TargetNpcId, FuncName .. "MISSING PARAMETER: TargetNpcId = ")
	params.Range = params.Range or 5
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsFigureInRangeNpc:new(params.NpcId, params.TargetNpcId, params.Range)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>TargetNpcId = , NpcId = self, Range = 5, UpdateInterval = 60</code><br>Prüft ob sich der Npc mit der Id "NpcId" in range des Ziel Npc mit der Id "TargetNpcId" befindet. Also ein FigureInRange bezogen auf eine andere Figur statt einer festen Position.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function FigureHasAggro(params)
	local FuncName = "GDS: FigureHasAggro(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 2, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsFigureHasAggro:new(params.NpcId)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>NpcId = self, UpdateInterval = 60</code><br>Prüft ob der Npc mit der Id "NpcId" Aggro aufgebaut hat, also sich im Kampf bzw. auf dem Weg in den Kampf befindet, bzw. einfach nicht mehr nur neutral und 100% friedlich ist.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function FigureHasHealth(params)
	local FuncName = "GDS: FigureHasHealth(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	params.Percent = params.Percent or 100
	if params.Percent > 100 then params.Percent = 100 end
	if params.Percent <= 0 then params.Percent = 1 end
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsFigureHasHealth:new(params.NpcId, params.Percent)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Percent = 100, NpcId = self, UpdateInterval = 60</code><br>Prüft ob der Npc mit der Id "NpcId" höchstens (!) "Percent" Health hat (also in % von 1 bis 100).]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function FigureHasMana(params)
	local FuncName = "GDS: FigureHasMana(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.NpcId = params.NpcId or NpcId
	params.Percent = params.Percent or 100
	if params.Percent > 100 then params.Percent = 100 end
	if params.Percent <= 0 then params.Percent = 1 end
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsFigureHasMana:new(params.NpcId, params.Percent)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Percent = 100, NpcId = self, UpdateInterval = 60</code><br>Prüft ob der Npc mit der Id "NpcId" höchstens (!) "Percent" Mana hat (also in % von 1 bis 100).]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function ODER(condition1, condition2)
	local FuncName = "GDS: ODER(): "
	assert2(condition1, FuncName .. "MISSING PARAMETER #1: type CGdsCondition")
	assert2(condition2, FuncName .. "MISSING PARAMETER #2: type CGdsCondition")

	local condition = CGdsConditionLogicalOr:new(condition1, condition2)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>ODER( condition, condition )</code><br>Verknüpft 2 (exakt 2!) herkömmliche Conditions mit einer logischen ODER Operation. Diese darf auch negiert werden, aber nicht verschachtelt in weitere ODER oder UND! Die einzelnen Conditions können aber ebenfalls negiert sein ...]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function NICHT_ODER(condition1, condition2)
	local FuncName = "GDS: NICHT_ODER(): "
	assert2(condition1, FuncName .. "MISSING PARAMETER #1: type CGdsCondition")
	assert2(condition2, FuncName .. "MISSING PARAMETER #2: type CGdsCondition")

	local condition = CGdsConditionLogicalOr:new(condition1, condition2)
	ParametrizeCondition(condition, params)
	condition:SetNegated(1)
	return condition
end

doc[numdoc] = [[Params: <code>NICHT_ODER( condition, condition )</code><br>Verknüpft 2 (exakt 2!) herkömmliche Conditions mit einer logischen NICHT ODER Operation. Diese darf auch negiert werden (argl!), aber nicht verschachtelt in weitere ODER oder UND! Die einzelnen Conditions können aber ebenfalls negiert sein ...]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function UND(condition1, condition2)
	local FuncName = "GDS: UND(): "
	assert2(condition1, FuncName .. "MISSING PARAMETER #1: type CGdsCondition")
	assert2(condition2, FuncName .. "MISSING PARAMETER #2: type CGdsCondition")

	local condition = CGdsConditionLogicalAnd:new(condition1, condition2)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>UND( condition, condition )</code><br>Verknüpft 2 (exakt 2!) herkömmliche Conditions mit einer logischen UND Operation. Diese darf auch negiert werden, aber nicht verschachtelt in weitere ODER oder UND! Die einzelnen Conditions können aber ebenfalls negiert sein ...]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function NICHT_UND(condition1, condition2)
	local FuncName = "GDS: NICHT_UND(): "
	assert2(condition1, FuncName .. "MISSING PARAMETER #1: type CGdsCondition")
	assert2(condition2, FuncName .. "MISSING PARAMETER #2: type CGdsCondition")

	local condition = CGdsConditionLogicalAnd:new(condition1, condition2)
	ParametrizeCondition(condition, params)
	condition:SetNegated(1)
	return condition
end

doc[numdoc] = [[Params: <code>UND( condition, condition )</code><br>Verknüpft 2 (exakt 2!) herkömmliche Conditions mit einer logischen NICHT UND Operation. Diese darf auch negiert werden (Aaaargh!), aber nicht verschachtelt in weitere ODER oder UND! Die einzelnen Conditions können aber ebenfalls negiert sein ...]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function ODER9(params)
	local FuncName = "GDS: ODER9(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(getn(params) >= 2, FuncName .. "TOO FEW PARAMETERS, need at least 2 conditions to work with!")

	local condition = nil
	local NumCombinations = getn(params)
	local i, c1, c2, c3, c4, c5, c6, c7, c8, c9 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
	
	if NumCombinations == 2 then
		i, c1 = next(params, nil)
		i, c2 = next(params, i)
		condition = ODER(c1, c2)
	elseif NumCombinations == 3 then
		i, c1 = next(params, nil)
		i, c2 = next(params, i)
		i, c3 = next(params, i)
		condition = ODER(c1, ODER(c2, c3))
	elseif NumCombinations == 4 then
		i, c1 = next(params, nil)
		i, c2 = next(params, i)
		i, c3 = next(params, i)
		i, c4 = next(params, i)
		condition = ODER(c1, ODER(c2, ODER(c3, c4)))
	elseif NumCombinations == 5 then
		i, c1 = next(params, nil)
		i, c2 = next(params, i)
		i, c3 = next(params, i)
		i, c4 = next(params, i)
		i, c5 = next(params, i)
		condition = ODER(c1, ODER(c2, ODER(c3, ODER(c4, c5))))
	elseif NumCombinations == 6 then
		i, c1 = next(params, nil)
		i, c2 = next(params, i)
		i, c3 = next(params, i)
		i, c4 = next(params, i)
		i, c5 = next(params, i)
		i, c6 = next(params, i)
		condition = ODER(c1, ODER(c2, ODER(c3, ODER(c4, ODER(c5, c6)))))
	elseif NumCombinations == 7 then
		i, c1 = next(params, nil)
		i, c2 = next(params, i)
		i, c3 = next(params, i)
		i, c4 = next(params, i)
		i, c5 = next(params, i)
		i, c6 = next(params, i)
		i, c7 = next(params, i)
		condition = ODER(c1, ODER(c2, ODER(c3, ODER(c4, ODER(c5, ODER(c6, c7))))))
	elseif NumCombinations == 8 then
		i, c1 = next(params, nil)
		i, c2 = next(params, i)
		i, c3 = next(params, i)
		i, c4 = next(params, i)
		i, c5 = next(params, i)
		i, c6 = next(params, i)
		i, c7 = next(params, i)
		i, c8 = next(params, i)
		condition = ODER(c1, ODER(c2, ODER(c3, ODER(c4, ODER(c5, ODER(c6, ODER(c7, c8)))))))
	elseif NumCombinations == 9 then
		i, c1 = next(params, nil)
		i, c2 = next(params, i)
		i, c3 = next(params, i)
		i, c4 = next(params, i)
		i, c5 = next(params, i)
		i, c6 = next(params, i)
		i, c7 = next(params, i)
		i, c8 = next(params, i)
		i, c9 = next(params, i)
		condition = ODER(c1, ODER(c2, ODER(c3, ODER(c4, ODER(c5, ODER(c6, ODER(c7, ODER(c8, c9))))))))
	else
		assert2(nil, FuncName .. "TOO MANY CONDITIONS!")
	end

	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>ODER9{ c1, c2, c3, c4, c5, c6, c7, c8, c9 }</code><br>Verknüpft bis zu 9 herkömmliche Conditions mit einer logischen ODER Operation. Diese darf auch negiert werden, aber nicht verschachtelt in weitere ODER oder UND! Die einzelnen Conditions können aber ebenfalls negiert sein ...]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function UND9(params)
	local FuncName = "GDS: UND9(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")
	assert2(getn(params) >= 2, FuncName .. "TOO FEW PARAMETERS, need at least 2 conditions to work with!")

	local condition = nil
	local NumCombinations = getn(params)
	local i, c1, c2, c3, c4, c5, c6, c7, c8, c9 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
	
	if NumCombinations == 2 then
		i, c1 = next(params, nil)
		i, c2 = next(params, i)
		condition = UND(c1, c2)
	elseif NumCombinations == 3 then
		i, c1 = next(params, nil)
		i, c2 = next(params, i)
		i, c3 = next(params, i)
		condition = UND(c1, UND(c2, c3))
	elseif NumCombinations == 4 then
		i, c1 = next(params, nil)
		i, c2 = next(params, i)
		i, c3 = next(params, i)
		i, c4 = next(params, i)
		condition = UND(c1, UND(c2, UND(c3, c4)))
	elseif NumCombinations == 5 then
		i, c1 = next(params, nil)
		i, c2 = next(params, i)
		i, c3 = next(params, i)
		i, c4 = next(params, i)
		i, c5 = next(params, i)
		condition = UND(c1, UND(c2, UND(c3, UND(c4, c5))))
	elseif NumCombinations == 6 then
		i, c1 = next(params, nil)
		i, c2 = next(params, i)
		i, c3 = next(params, i)
		i, c4 = next(params, i)
		i, c5 = next(params, i)
		i, c6 = next(params, i)
		condition = UND(c1, UND(c2, UND(c3, UND(c4, UND(c5, c6)))))
	elseif NumCombinations == 7 then
		i, c1 = next(params, nil)
		i, c2 = next(params, i)
		i, c3 = next(params, i)
		i, c4 = next(params, i)
		i, c5 = next(params, i)
		i, c6 = next(params, i)
		i, c7 = next(params, i)
		condition = UND(c1, UND(c2, UND(c3, UND(c4, UND(c5, UND(c6, c7))))))
	elseif NumCombinations == 8 then
		i, c1 = next(params, nil)
		i, c2 = next(params, i)
		i, c3 = next(params, i)
		i, c4 = next(params, i)
		i, c5 = next(params, i)
		i, c6 = next(params, i)
		i, c7 = next(params, i)
		i, c8 = next(params, i)
		condition = UND(c1, UND(c2, UND(c3, UND(c4, UND(c5, UND(c6, UND(c7, c8)))))))
	elseif NumCombinations == 9 then
		i, c1 = next(params, nil)
		i, c2 = next(params, i)
		i, c3 = next(params, i)
		i, c4 = next(params, i)
		i, c5 = next(params, i)
		i, c6 = next(params, i)
		i, c7 = next(params, i)
		i, c8 = next(params, i)
		i, c9 = next(params, i)
		condition = UND(c1, UND(c2, UND(c3, UND(c4, UND(c5, UND(c6, UND(c7, UND(c8, c9))))))))
	else
		assert2(nil, FuncName .. "TOO MANY CONDITIONS!")
	end

	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>UND9{ c1, c2, c3, c4, c5, c6, c7, c8, c9 }</code><br>Verknüpft bis zu 9 herkömmliche Conditions mit einer logischen UND Operation. Diese darf auch negiert werden, aber nicht verschachtelt in weitere ODER oder UND! Die einzelnen Conditions können aber ebenfalls negiert sein ...]]
doc[numdoc] = nil
numdoc = numdoc + 1


function AvatarIsLevel(params)
	--print("NOTE: AvatarIsLevel{}: please use AvatarLevel{} instead. However, this function still works.")
	return AvatarLevel(params)
end
-- **DOC** -----------------------------------------------------------
function AvatarLevel(params)
	local FuncName = "GDS: AvatarLevel(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.Player = 1
	assert2(params.Level, FuncName .. "MISSING PARAMETER: Level = ")
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsAvatarHasLevel:new(params.Player, params.Level)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Level = , UpdateInterval = 60</code><br>Prüft ob der Avatar in einem bestimmten (Mindest) Level ist. Also z.b. mind. Level 15. Die Abfrage benutzt immer den Operator "grösser gleich". Das heisst bei Level = 15 wäre die condition immer wahr wenn der Avatar Level 15 oder höher erreicht hat.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function AvatarStat(params)
	local FuncName = "GDS: AvatarStat(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.BaseStatOnly = params.BaseStatOnly or TRUE
	assert2(params.Stat, FuncName .. "MISSING PARAMETER: Stat = ")
	assert2(params.Value, FuncName .. "MISSING PARAMETER: Value = ")
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsPlayerHasAttrib:new(params.Stat, params.Value, params.BaseStatOnly)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Stat = , Value = , BaseStatOnly = TRUE, UpdateInterval = 60</code><br>Prüft ob der Spieler eine bestimmte Anzahl Statpunkte in einem Stat hat. Wenn BaseStatOnly = TRUE wird nur der Basiswert geprüft, d.h. sonstige zusätzliche Statsteigerungen durch Items etc. werden nicht berücksichtigt.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function AvatarSkill(params)
	local FuncName = "GDS: AvatarSkill(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.Skill, FuncName .. "MISSING PARAMETER: Skill = ")
	assert2(type(params.Skill) == "table", FuncName .. "INVALID PARAMETER: Skill = is not a table!")
	assert2(params.Level, FuncName .. "MISSING PARAMETER: Level = ")
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsPlayerHasSkill:new(params.Skill.Skill, params.Skill.Spec, params.Level)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>Skill = , Level = , UpdateInterval = 60</code><br>Prüft ob der Spieler einen bestimmten Skill in einem bestimmten Mindestlevel hat. Es gibt folgende gültige Skills:<br>
-- Hauptskills<code><br>
LeichteKriegskunst<br>
SchwereKriegskunst<br>
Fernkampf<br>
WeisseMagie<br>
ElementarMagie<br>
MentalMagie<br>
SchwarzeMagie<br>
</code>-- leichte kriegskunst<br><code>
Stichwaffen<br>
KleineSchwerter<br>
KleineSchlagwaffen<br>
LeichteRuestungen<br>
</code>-- schwere kriegskunst<br><code>
GrosseSchwerter<br>
GrosseSchlagwaffen<br>
SchwereRuestungen<br>
Schilde<br>
</code>-- fernkampf<br><code>
Bogen<br>
Armbrust<br>
</code>-- weisse magie<br><code>
Leben<br>
Natur<br>
Segnung<br>
</code>-- elementarmagie<br><code>
Feuer<br>
Eis<br>
Erde<br>
</code>-- mentalmagie<br><code>
Verzauberung<br>
Offensiv<br>
Defensiv<br>
</code>-- schwarze magie<br><code>
Tod<br>
Nekromantie<br>
Fluch<br></code>]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -----------------------------------------------------------
function PlayerUnitExists(params)
	local FuncName = "GDS: PlayerUnitExists(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	params.UnitId = params.UnitId or 0
	params.Amount = params.Amount or 1
	params.NoWorkers = params.NoWorkers or TRUE
	params.UpdateInterval = params.UpdateInterval or 60
	assert2(getn(tkeys(params)) == 4, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsRTSUnitExists:new(params.UnitId, params.Amount, params.NoWorkers)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>UnitId = 0, Amount = 1, NoWorkers = TRUE, UpdateInterval = 60</code><br>Prüft ob der Spieler eine RTS Aufbaueinheit (am Monument oder grossen Haupthaus) erzeugt hat, und wieviele davon. Wenn UnitId = 0 ist dann wird auf alle RTS Spieler-Einheiten geprüft, mit Ausnahme von Helden und Avatar.]]
doc[numdoc] = nil
numdoc = numdoc + 1



-- **DOC** -----------------------------------------------------------
function ObjectExists(params)
	local FuncName = "GDS: ObjectExists(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE, like this: { Name = \"bla\", Value = 20, Whatever = 1 }")
	assert2(params.ObjectId, FuncName .. "MISSING PARAMETER: ObjectId = ") 
	assert2(params.X, FuncName .. "MISSING PARAMETER: X = ") 
	assert2(params.Y, FuncName .. "MISSING PARAMETER: Y = ")
	assert2(getn(tkeys(params)) == 3, FuncName .. "INCORRECT ARGUMENT FOUND, probably mistyped a parameter?")

	local condition = CGdsObjectExistXY:new(params.X, params.Y, params.ObjectId)
	ParametrizeCondition(condition, params)
	return condition
end

doc[numdoc] = [[Params: <code>X = , Y = , ObjectId =  </code><br>Prüft ob sich ein Object mit der Id ObjectId" auf Punkt X/Y befindet. ]]
doc[numdoc] = nil
numdoc = numdoc + 1
----------------------------------------------------------------------