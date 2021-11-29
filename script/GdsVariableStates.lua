-- You Are Currently Editing: 
-----------------------------
--		GdsVariableStates.lua
-----------------------------

-- dieses script muss von n0.lua ausgef�hrt werden...

-- hier werden Variablen States definiert...
-- das sind einfach strings denen automatisch eindeutige Werte zugewiesen werden
-- wobei die Werte unwichtig sind, nur der State an sich interessiert
-- hier sollten nur states rein die h�ufig benutzt werden bzw. immer wieder vorkommen, z.b. f�r dialoge
-- eigene (lokale) states kann man sich auch in den Npc bzw. Plattform script selber hinzuf�gen
-- am besten dann in ein eigenes file im \script\p# ordner und per doscript ausf�hren

VarStates = {}

function AddVarState(VarState)
	if not tfind(VarStates, VarState) then
		tinsert(VarStates, VarState)
	else
		print("GDS: Warning: Duplicate State \"" .. VarState .. "\" in Npc Script " .. tostring(NpcId) .. ".")
	end
end



-- Welt states
AddVarState("Tutorial")
AddVarState("JourneyOne")
AddVarState("JourneyTwo")
AddVarState("JourneyThree")
AddVarState("JourneyFour")

--------------------------------------------------------

