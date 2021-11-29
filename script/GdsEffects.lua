-- You Are Currently Editing: 
-----------------------------
--		GdsEffects.lua
-----------------------------


-- GdsCreateDoc HTML doc generator needs these:
numdoc = 1
doc = {}

Always = 1

-- **DOC** ----------------------------------------------------------
function Lagerfeuer(params)
	local FuncName = "GDS: Lagerfeuer(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")

	local keys = tkeys(params)

	for i = 1, getn(keys) do
		local fx = params[keys[i]]
		assert2(fx.X, FuncName .. "MISSING PARAMETER: X =  in entry " .. keys[i])
		assert2(fx.Y, FuncName .. "MISSING PARAMETER: X =  in entry " .. keys[i])

		fx.fx = "Campfire"

		if fx.When == nil then
			OnToggleEvent
			{
				UpdateInterval = 60,
				OnConditions = { TimeNightExtended() },
				OnActions = { SetEffect{Effect = fx.fx, X = fx.X, Y = fx.Y} },
				OffConditions = { TimeDay() },
				OffActions = { StopEffect{X = fx.X, Y = fx.Y} },
			}
		else
			OneTimeInitAction( SetEffect{Effect = fx.fx, X = fx.X, Y = fx.Y} )
		end
	end
end

doc[numdoc] = [[Syntax: <code>Lagerfeuer<br>{<br>OrcCamp1 = { X = 200, Y = 300, When = NightOnly },<br>OrcCamp2 = { X = 200, Y = 300, When = NightOnly },<br>OrcCamp3 = { X = 200, Y = 300, When = NightOnly },<br>Goblins = { X = 200, Y = 300, When = Always },<br>}<br></code><br>Lagerfeuer Effekte setzen an X, Y Position. When = NightOnly heisst der Effekt ist nur nachts zu sehen, das ist auch default wenn man When = weglässt. Mit When = Always brennt das Feuer Tag & Nacht.]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** ----------------------------------------------------------
function Fackelfeuer(params)
	local FuncName = "GDS: Fackelfeuer(): "
	assert2(type(params) == "table", FuncName .. "PARAMETERS MUST BE PASSED AS A TABLE!")

	local keys = tkeys(params)

	for i = 1, getn(keys) do
		local fx = params[keys[i]]
		assert2(fx.X, FuncName .. "MISSING PARAMETER: X =  in entry " .. keys[i])
		assert2(fx.Y, FuncName .. "MISSING PARAMETER: X =  in entry " .. keys[i])

		fx.fx = "Torch"
		fx.fxOff = "TorchOff"

		if fx.When == nil then
			OnToggleEvent
			{
				UpdateInterval = 60,
				OnConditions = { TimeNightExtended() },
				OnActions = { SetEffect{Effect = fx.fx, X = fx.X, Y = fx.Y} },
				OffConditions = { TimeDay() },
				OffActions = { StopEffect{X = fx.X, Y = fx.Y}, SetEffect{Effect = fx.fxOff, X = fx.X, Y = fx.Y, Length = 5000} },
			}
		else
			OneTimeInitAction( SetEffect{Effect = fx.fx, X = fx.X, Y = fx.Y} )
		end
	end
end

doc[numdoc] = [[Syntax: <code>Fackelfeuer<br>{<br>OrcCamp1 = { X = 200, Y = 300, When = NightOnly },<br>OrcCamp2 = { X = 200, Y = 300, When = NightOnly },<br>OrcCamp3 = { X = 200, Y = 300, When = NightOnly },<br>Goblins = { X = 200, Y = 300, When = Always },<br>}<br></code><br>Fackelfeuer Effekte setzen an X, Y Position. When = NightOnly heisst der Effekt ist nur nachts zu sehen, das ist auch default wenn man When = weglässt. Mit When = Always brennt das Feuer Tag & Nacht.]]
doc[numdoc] = nil
numdoc = numdoc + 1

------------------------------------------------------------------------

REM = [[
Lagerfeuer
{
 OrcCamp1 = { X = 200, Y = 300, When = NightOnly },
 OrcCamp2 = { X = 200, Y = 300, When = NightOnly },
 OrcCamp3 = { X = 200, Y = 300, When = NightOnly },
 Goblins = { X = 200, Y = 300, When = Always },
}


-- allgemeine effekte, das ganze dann auch mit conditions erweitert damit man 
damit auch OneTimeEvents usw. erzeugen kann
Effects
{
 LavaBlubber1 = { Effect = "Blubb", X = 245, Y = 543, When = Always },
 Thingy = { Effect = "Thingy", X = 455, Y = 234, When = NightOnly, Duration = 
5000, Conditions = {...} },
}


]]
