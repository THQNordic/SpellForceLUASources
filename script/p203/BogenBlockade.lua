function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)



BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- Die Bogenschützen bleiben stehn bis der Spieler sehr nah ist, damit der Eingang zur Schlucht nicht direkt freigegeben wird
--OnOneTimeEvent
--{
--	Actions =
--	{
--		HoldPosition {},
--	}	
--}

-- Ist die Verfolgung erledigt wird wieder zurück gegenagen
OnIdleGoHome
{
	X = _X, Y = _Y, WalkMode = Run, Direction = 6,
	Actions =
	{
	}
}

-- Mit der Wiederaufnahme von HoldPosition gibt es einige Problme, so dass es erst mal auskommentiert ist

---- Hold Position aufgeben, wenn der Spieler nah genug ist und einen Timer setzen zum späteren wiederaufnehmen der Blockade
--OnEvent
--{
--	Conditions =
--	{
--		ODER
--		(
--			PlayerUnitInRange {X = 402, Y = 355, Range = 0, UpdateInterval = 10},
--			ODER
--			(
--				PlayerUnitInRange {X = 403, Y = 355, Range = 0, UpdateInterval = 10},
--				ODER
--				(
--					PlayerUnitInRange {X = 404, Y = 355, Range = 0, UpdateInterval = 10},
--					ODER
--					(
--						PlayerUnitInRange {X = 405, Y = 355, Range = 0, UpdateInterval = 10},
--						ODER
--						(
--							PlayerUnitInRange {X = 406, Y = 355, Range = 0, UpdateInterval = 10},
--							ODER
--							(
--								PlayerUnitInRange {X = 407, Y = 355, Range = 0, UpdateInterval = 10},
--								PlayerUnitInRange {X = 408, Y = 355, Range = 0, UpdateInterval = 10},
--							)
--						)
--					)
--				)
--			)
--		)
--					
--	},
--	Actions =
--	{
--		HoldPosition {FreeWill = TRUE},
--	}	
--}

EndDefinition()

end
