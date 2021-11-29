function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- search for: FIXME, REMOVE

-- um die states durchzuzählen, DO NOT MODIFY!
TutorialStateNum = 0

-- Dummy effekt um nicht vorh. cond. anzuzeigen
MissingConditionEffect = "BuildingFire"
MissingConditionLength = 3333

-- max. entfernung zu monument um es benutzen zu können
TutorialDefaultRange = 10

-- delay für die beiden untoten tore, spielwiese geht zuerst auf, das andere nach x sekunden:
UntotenTorDelay = 3

--woker limit
UnitLimitAfterUpgrade = 20

-- wir haben hier einen (fast) rein linearen ablauf, von daher ist es am günstigsten, einfach
-- linear zusammenhängende states zu erzeugen, anstatt globale events zu benutzen....



------------------------------------------------------------------------------------------------------------------------
-- Tutorial: The Beginning, set initial Quest States, erste Erzählungen des Offsprechers...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "TutorialIntroCutSceneIsOver", UpdateInterval = 5},
	},
	Actions = {
		QuestBegin{QuestId = 473},
		QuestBegin{QuestId = 474},
		--SetInfoText{Tag = "TutInfo001", String = "Selektieren Sie den Seelenfels und aktivieren Sie ihn unten in der Aktionsleiste. Falls Sie sterben, müssen Sie jetzt nicht mehr den ganzen Weg bis zu diesem Ort laufen."   , Color = ColorYellow},
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo002", String = "Willkommen in der Welt von Spellforce!"   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo003", String ="In diesem Prolog wird Ihnen das Spiel erklärt. Beginnen wir mit einigen allgemeinen Informationen:"    , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo004", String = "Ihr Hauptcharakter im Prolog heißt 'Tahira'. Sie ist eine Mischung aus Kämpferin und Magierin. Wir nennen den Hauptcharakter zukünftig 'Avatar'."   , Color = ColorWhite} },
		[4] = { SetInfoText{Tag = "TutInfo005", String = "Wenn Sie den Prolog gelöst haben, wird das Spiel mit dem von Ihnen vor dem Spielstart erstellten Avatar fortgesetzt."   , Color = ColorWhite} },
		[5] = { SetInfoText{Tag = "TutInfo006", String = "Immer, wenn Sie den Mauszeiger über eine Schaltfläche oder ein Objekt halten, erscheint ein Hilfe-Fenster unten links mit näheren Informationen."   , Color = ColorWhite} },
		[6] = { SetInfoText{Tag = "TutInfo007", String =  "Immer, wenn Sie aufgefordert werden, auf etwas zu klicken, ist ein Klick mit der linken Maustaste gemeint. Auf die rechte Maustaste wird bei Bedarf konkret hingewiesen."  , Color = ColorWhite} },
		[7] = { SetInfoText{Tag = "TutInfo267", String =  "Wenn Sie auf die Schaltfläche 'Menü' oben rechts klicken, können Sie das Spiel jederzeit speichern oder Spieleinstellungen verändern."  , Color = ColorWhite} },

		[8] = { SetInfoText{Tag = "TutInfo011", String = "Selektieren Sie Ihren Avatar indem Sie mit der linken Maustaste in der Spielwelt auf 'Tahira' klicken."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #1.a SELEKTION des Avatar
------------------------------------------------------------------------------------------------------------------------
local cond = CGdsIsNpcSelected:new(Avatar)
cond:SetUpdateInterval(1)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}


TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo012", String = "Sehr gut. Sie können den sichtbaren Bildausschnitt mit den Cursortasten oder mit gedrückter rechter Maustaste verschieben. Sie können den Bildausschnitt ebenfalls verschieben, indem sie den Mauszeiger zum jeweiligen Bildschirmrand bewegen."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo013", String = "Eine selektierte Einheit wird durch einen farbigen Ring markiert. Eigene Einheiten erhalten einen grünen Ring, feindliche Einheiten einen roten Ring und neutrale oder verbündete Einheiten einen blauen Ring."   , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo014", String = "Unten links sehen Sie die aktuell selektierten Einheiten und einige zusätzliche Informationen wie Name, Gesundheitszustand und Manamenge."   , Color = ColorWhite} },
		[4] = { SetInfoText{Tag = "TutInfo015", String = "Mit einem Mausklick auf den Porträt-Button oben links können Sie jederzeit Ihren Avatar selektieren. Wenn Sie auf dem Porträt-Button die rechte Maustaste klicken, dann wird der Bildausschnitt zu der entsprechenden Einheit bewegt."   , Color = ColorWhite} },

		[5] = { SetInfoText{Tag = "TutInfo016", String = "Bewegen Sie 'Tahira' durch einen Klick mit der rechten Maustaste nach Osten den Weg entlang durch das offene Steintor bis zu dem 'Seelenfels', einem grossen Steinbrocken."   , Color = ColorYellow},
				SetGlobalFlagTrue{Name = "OpenDoor3276"},
		},
}}

------------------------------------------------------------------------------------------------------------------------
-- #2.a NAHE BEIM SEELENFELS / BINDSTONE ... ist das zufall das "Seelenfels" sich so anhört wie "Celen Fell" ?? :)
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "PlayerInRangeBindstone", UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo017", String = "Der Seelenfels bietet einem Avatar die Möglichkeit, seine Rune mit diesem Ort zu verbinden. Falls Sie sterben, erscheinen Sie an dem zuletzt verwendeten Seelenfels. Feinde können allerdings Ihre Verbindung zu einem Seelenfels unterbrechen, wodurch Sie einen aktivierten Seelenfels auch wieder verlieren können."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo018", String = "Selektieren Sie den Seelenfels mit einem Klick."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #2.b SEELENFELS SELEKTIERT ...
------------------------------------------------------------------------------------------------------------------------
local cond = CGdsIsMonumentSelected:new(183, 443, 1)
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo019", String = "Am unteren Bildrand befindet sich die 'Aktionsleiste'. Hier ist nun ein neues Symbol für 'Seelenfels aktivieren' erschienen. Klicken Sie auf das Symbol."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #2.c AN SEELENFELS GEBUNDEN ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsMonumentInUse{X = 183, Y = 442, Range = 1, UpdateInterval = 2},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo020", String = "Der Seelenfels leuchtet auf und ist nun aktiv. Sie sind nun mit diesem Seelenfels verbunden."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo021", String = "Unten rechts befindet sich die Übersichtskarte. Schwarze Bereiche sind noch unerforscht und werden automatisch aufgedeckt, wenn Sie mit Einheiten in der Nähe sind. Ihr Avatar hat dabei einen besonders großen Sichtradius."   , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo022", String = "Die Punkte in der Übersichtskarte haben unterschiedliche Farben. Grün steht für Ihre eigenen, rot für feindliche und blau für neutrale oder verbündete Einheiten und Gebäude. Einige besondere Objekte wie Monumente sind gelb markiert."   , Color = ColorWhite} },

		[4] = { SetInfoText{Tag = "TutInfo023", String = "Gehen Sie den Weg weiter nach Osten."   , Color = ColorYellow},
				SetGlobalFlagTrue{Name = "OpenDoor3277"},
		},
}}

------------------------------------------------------------------------------------------------------------------------
-- #3.a SPIELER IM 3RD PERSON BEREICH ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "PlayerInRange3rdPersonArea", UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo024", String = "SpellForce bietet die Möglichkeit, das Spielgeschehen auch aus verschiedenen Ansichten und sogar der 'Verfolgerperspektive', d.h. einer Perspektive direkt hinter Ihrem Avatar, zu erleben."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo025", String = "Zur Veränderung der Perspektive drücken Sie die Tasten 'Bild hoch', um hineinzuzoomen und 'Bild runter', um herauszuzoomen. Oder sie drehen einfach das Mausrad."   , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo026", String = "Wenn Sie das Mausrad nach unten bewegen oder 'Bild runter' drücken, geht die Kamera in eine fast senkrechte Perspektive."   , Color = ColorWhite} },
		[4] = { SetInfoText{Tag = "TutInfo027", String = "Wenn Sie nun das Mausrad nach oben drehen oder 'Bild hoch' drücken, sehen Sie die normalen isometrischen Ansichten aus unterschiedlichen Entfernungen."   , Color = ColorWhite} },

		[5] = { SetInfoText{Tag = "TutInfo028", String = "Wechseln Sie nun in die Verfolgerperspektive, indem Sie noch weiter heranzoomen. Dies ist nur möglich, wenn sich Ihr Avatar im Bildausschnitt befindet."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #3.b PERSPEKTIVE IN 3RD PERSON GEWECHSELT ...
------------------------------------------------------------------------------------------------------------------------
local cond = Negated(CGdsIsIsoView:new())
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo029", String = "In der Verfolgerperspektive steuern Sie direkt Ihren Avatar mit den Cursortasten oder mit den Tasten 'ADSW'."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo030", String = "Wenn Sie die rechte Maustaste gedrückt halten, können Sie die Blickrichtung verändern. Ansonsten ist die Bedienung von SpellForce in dieser Perspektive identisch mit der isometrischen Ansicht."   , Color = ColorWhite} },

		[3] = { SetInfoText{Tag = "TutInfo031", String = "Folgen Sie in der Verfolgerperspektive dem Weg nach Osten bis zum nächsten Steintor."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #3.c AM ENDE DES 3RD PERSON BEREICHS ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "PlayerInRange3rdPersonEndArea", UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo032", String = "Sie können im Spiel jederzeit in die Verfolgerperspektive wechseln, die Bedienungserklärungen gehen aber davon aus, dass Sie die isometrische Ansicht verwenden."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo033", String = "Wechseln Sie mit dem Mausrad wieder in die normale isometrische Ansicht."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #3.d SPIELER WIEDER IN ISO PERSPEKTIVE ...
------------------------------------------------------------------------------------------------------------------------
local cond = CGdsIsIsoView:new()
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo034", String = "Hinter der nächste Ecke lauert ein feindlicher 'Goblin'. Er stellt keine große Gefahr dar. Wenn Sie den Mauszeiger über ihn halten, zeigt Ihnen ein Balken seinen Gesundheitszustand."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo035", String = "Selektieren Sie Ihren Avatar und klicken Sie mit der rechten Maustaste auf den 'Goblin'. Ihr Avatar greift den 'Goblin' an. Sobald er besiegt ist, geht es weiter."   , Color = ColorYellow} ,
				SetGlobalFlagTrue{Name = "OpenDoor3280"},
		},
}}


------------------------------------------------------------------------------------------------------------------------
-- #4.a ERSTEN GEGNER (DER MIT SCHILD) GETÖTET ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		FigureDead{NpcId = 3440},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo036", String = "Die Leiche des 'Goblins' leuchtet, wodurch gekennzeichnet wird, dass er einen Gegenstand dabei hat. Diesen Gegenstand können Sie an sich nehmen."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo037", String = "Stellen Sie sich in die Nähe des toten Goblins und klicken Sie mit der rechten Maustaste auf die Leiche. Am linken Bildrand sehen Sie dann, welche Gegenstände der Goblin bei sich trug. Nehmen Sie den Schild durch einen Klick mit, er wird automatisch in Ihr Inventar einsortiert."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #4.b SCHILD GELOOTET ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "PlayerHasHadGoblinShield", UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo038", String = "Der Schild erhöht die Rüstungsklasse Ihres Avatars, wenn Sie ihn tragen. Mit einer höheren Rüstungsklasse verlieren Sie weniger Lebenspunkte, wenn ein Gegner Sie mit einer Waffe trifft."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo039", String = "Um Ihr Inventar zu öffnen, klicken Sie den Rucksack unten in der Aktionsleiste oder die 'I'-Taste. Ein Fenster öffnet sich und links sind nun verschiedene Rubriken Ihres Inventars anwählbar. Klicken Sie auf das 'Ring'-Symbol, er steht für Ausrüstungsgegenstände."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #4.c IM INVENTORY ...
------------------------------------------------------------------------------------------------------------------------
local cond = CGdsIsInventoryOpen:new(0)
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo040", String = "Links sehen Sie nun unbenutzte Ausrüstungsgegenstände, in der Mitte die von Ihrem Avatar aktuell verwendeten Gegenstände und rechts die aktuellen Daten Ihres Charakters, mit denen wir uns erst später beschäftigen."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo041", String = "Um den Schild anziehen zu können, müssen Sie ihn zunächst an die Maus nehmen. Klicken Sie dazu auf den Schild und klicken Sie dann auf das noch freie Fach für die linke Hand neben dem Oberkörper."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #4.d SPIELER HAT SCHILD ANGEZOGEN ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		AvatarHasItem{ItemId = 701, UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo042", String = "Schließen Sie nun das Inventar mit einem Klick auf den Haken unten rechts im Fenster oder auf den Rucksack oder durch erneutes Drücken von 'I'."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #4.e SPIELER HAT INVENTORY WIEDER VERLASSEN ...
------------------------------------------------------------------------------------------------------------------------
local cond = Negated(CGdsIsInventoryOpen:new(8))
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo008", String = "In der oberen linken Ecke sehen Sie ein Porträt des Avatars. Schaltflächen dieser Art nennen wir Porträt-Buttons."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo009", String = "Der grüne Balken im Porträt zeigt den Gesundheitszustand an. Wenn die Figur verwundet ist, verfärbt er sich je nach Schwere der Verletzung über gelb nach rot. Wenn die Figur keine Lebenspunkte mehr hat, stirbt sie. Ihr Avatar regeneriert seine Lebenspunkte mit der Zeit wieder."   , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo010", String = "Der blaue Balken stellt Mana dar -  die magische Energie. Wenn eine Figur kein Mana mehr hat, kann sie keine Zaubersprüche mehr ausführen. Mana füllt sich ebenfalls mit der Zeit wieder auf."   , Color = ColorWhite} },

		[4] = { SetInfoText{Tag = "TutInfo043", String = "Folgen Sie dem Weg durch das nächste Steintor, bis Sie auf den verletzten 'Lev' treffen."   , Color = ColorYellow},
				SetGlobalFlagTrue{Name = "OpenDoor3281"},
		},
}}


------------------------------------------------------------------------------------------------------------------------
-- #5.a LEV ERREICHT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "PlayerInRangeLev", UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo044", String = "Wenn Ihnen jemand einen Dialog anbietet, schwebt über der Figur ein Symbol. Wenn diese Person für die Hauptqueste relevant ist, handelt es sich um ein Ausrufezeichen. Falls die Person nur für optionale Nebenquesten relevant ist, handelt es sich um ein Fragezeichen."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo045", String = "Selektieren Sie Ihren Avatar, gehen Sie in die Nähe von 'Lev' und klicken Sie ihn mit der rechten Maustaste an, um einen Dialog zu beginnen."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #5.b MIT LEV ERSTMALIG GEREDET, LEV BITTET UM HEILUNG ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "Q473LevBeggedForHeal", UpdateInterval = 5},
		IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking", UpdateInterval = 5},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo046", String = "Sie verfügen über einen Heilspruch. Wenn Sie einen Zauberspruch auf ein Ziel auslösen wollen, gibt es 2 Möglichkeiten:"   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo047", String = "Die einfachste Möglichkeit bietet das 'Click&Fight'-System. Selektieren Sie dazu 'Lev'. Unter dem Porträt-Button Ihres Avatars erscheinen nun alle sinnvollen Aktionen für dieses Ziel. Die blaue Hand ist das Symbol für den Heilspruch. Klicken Sie auf das Symbol, um 'Lev' zu heilen."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #5.c DEN LEV GEHEILT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		Negated(FigureHasHealth{Percent = 25, NpcId = 3326, UpdateInterval = 1}),
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
		QuestSolve{QuestId = 474},
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo048", String = "Mit dem 'Click&Fight'-System können Sie natürlich auch Zaubersprüche auf gegnerische Einheiten auslösen oder Angriffskommandos geben. Wenn Sie eine feindliche Einheit selektieren, werden automatisch nur gegen Feinde sinnvolle Aktionen angeboten."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo049", String = "Alternativ dazu gibt es die klassische Methode. Selektieren Sie Ihren Avatar, klicken Sie danach in der Aktionsleiste den Heilspruch an und klicken Sie anschließend in der Spielwelt auf den verwundeten 'Lev'. Wenn Sie den Zauberspruch auslösen können, erscheint ein grüner Pfeil am Mauszeiger."   , Color = ColorWhite} },

		[3] = { SetInfoText{Tag = "TutInfo050", String = "Sprechen Sie 'Lev' noch einmal an."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #5.d ERNEUT MIT LEV GEREDET, BELOHNUNG ABGEHOLT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		QuestState{QuestId = 475, State = StateActive, UpdateInterval = 5},
		IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking", UpdateInterval = 5},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo051", String = "Sie haben als Belohnung zusätzliche Erfahrungspunkte gewonnen und von dem Soldaten eine Zauberspruchrolle für den Spruch 'Feuerball' erhalten."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo052", String =  "Wenn Sie eine bestimmte Menge an Erfahrungspunkten gesammelt haben, steigt Ihr Avatar eine Stufe auf, wird stärker und kann neue Fähigkeiten erlernen. Sie erhalten Erfahrungspunkte durch das Besiegen von Gegnern und das Lösen von Questen."  , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo266", String =  "Wenn Sie sterben, verlieren Sie jedesmal eine geringe Menge Erfahrungspunkte."  , Color = ColorWhite} },
		[4] = { SetInfoText{Tag = "TutInfo053", String = "Als nächstes soll Ihr Avatar den Zauberspruch, den Sie gerade erhalten haben, erlernen."   , Color = ColorWhite} },

		[5] = { SetInfoText{Tag = "TutInfo054", String = "Öffnen Sie Ihr Inventar und klicken Sie links im Fenster das Symbol für Zauberbuch an."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #5.e SPELLBOOK OFFEN ...
------------------------------------------------------------------------------------------------------------------------
local cond = CGdsIsInventoryOpen:new(1)
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo055", String = "Links sehen Sie nun das Inventar für Zauberspruchrollen, rechts Ihr Zauberbuch und darüber das sogenannte Zauber-Gedächtnis, momentan mit 9 freien Fächern."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo056", String = "Klicken Sie auf die Zauberspruchrolle im Inventar, um sie an den Mauszeiger zu nehmen. Klicken Sie dann auf ein beliebiges freies Feld in Ihrem Zauberbuch."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #5.f FEUERBALL SPRUCH IM ZAUBERBUCH ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		Negated(PlayerHasItem{ItemId = 1984, UpdateInterval = 1}),
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo057", String = "Sie haben nun einen neuen Zauberspruch in Ihr Zauberbuch übertragen. Im Zauberbuch können Sie unzählige davon eintragen. Sie können aber nur maximal 10 Zaubersprüche gleichzeitig im Zauber-Gedächtnis auswendig lernen und benutzen."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo058", String = "Lernen Sie den Zauberspruch 'Feuerball', indem Sie auf das Feuerball-Symbol in Ihrem Zauberbuch und danach in ein beliebiges freies Feld in Ihrem Zauber-Gedächtnis klicken."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #5.g FEUERBALL GELERNT (IM ZAUBERGEDÄCHTNIS) ...
------------------------------------------------------------------------------------------------------------------------
local cond = CGdsIsSpellMemorized:new(1973)
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo059", String = "Schließen Sie nun Ihr Inventar."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #5.h INVENTAR GESCHLOSSEN ...
------------------------------------------------------------------------------------------------------------------------
local cond = Negated(CGdsIsInventoryOpen:new(8))
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo060", String = "Folgen Sie dem Weg, bis Sie den 'Minotaurus' sehen."   , Color = ColorYellow},
				SetGlobalFlagTrue{Name = "OpenDoor3283"},
		},
}}


------------------------------------------------------------------------------------------------------------------------
-- #6.a BEIM MINOTAUREN DORT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "PlayerInRangeMinotaurus", UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo061", String = "Benutzen Sie den Zauberspruch 'Feuerball', um den Minotauren zu besiegen."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #6.b MINOTAURUS TOT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		FigureDead{NpcId = 3441},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo062", String = "Manche Wesen sind teilweise oder ganz resistent gegen bestimmte Magiearten. Auch Ihr Avatar kann sich mit seltenen Gegenständen, die er im Laufe des Spiels finden wird, besser gegen magische Angriffe schützen."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo063", String =  "Hinter dem nächsten Tor wartet ein Feuer-Elementarwesen auf Sie, welches völlig resistent gegen Feuermagie ist. Folgen Sie dem Weg."  , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #6.c SPIELER BEIM MINOTAURUS TOR ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		FigureInRange{NpcId = Avatar, X = 300, Y = 351, Range = 8},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo064", String = "Versuchen Sie Ihren Zauberspruch Feuerball gegen das Feuer-Elementar einzusetzen. Wenn ein Wesen einem Zauberspruch widerstanden hat, sehen Sie weiße abprallende Funken. Besiegen Sie danach das Feuer-Elementar im Nahkampf."   , Color = ColorYellow} ,
				SetGlobalFlagTrue{Name = "OpenDoor3292"},
		},
}}


------------------------------------------------------------------------------------------------------------------------
-- #7.a FEUERWESEN TOT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		FigureDead{NpcId = 3442},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
		SetGlobalFlagTrue{Name = "FireElementalDead"},
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo065", String = "Das Feuer-Elementar hatte eine Helden-Rune und 4 Gegenstände dabei. Nehmen Sie diese an sich."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #7.b ALLE ITEMS DES FEUERWESEN GELOOTET ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		-- counter in n0.lua der jedes einzelne item abfrägt, zur sicherheit falls spieler items einzeln lootet ...
		IsGlobalCounter{Name = "FeuerwesenItemCounter", Operator = IsEqual, Value = 5, UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo066", String = "Neben Ihrem Hauptcharakter stehen Ihnen bis zu fünf Helden gleichzeitig zur Verfügung. Die Helden sind Ihre stärksten Verbündeten und können auch über magische Fähigkeiten verfügen."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo067", String = "Die gerade von Ihnen gefundene Helden-Rune steht für einen geschickten Fernkämpfer. Die Rune legt die Eigenschaften und Fähigkeiten des Helden fest. Im Spielverlauf werden Sie mit der Zeit weitere Runen finden und teilweise ältere Runen ersetzen."   , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo068", String = "Um einen Helden herbeizurufen, müssen Sie die Rune des Helden in Ihrer Runentafel, die Sie immer bei sich haben, einsetzen und ein Helden-Monument für die Herbeirufung finden."   , Color = ColorWhite} },

		[4] = { SetInfoText{Tag = "TutInfo069", String = "Öffnen Sie Ihr Inventar und gehen Sie in die Rubrik 'Runentafel'."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #7.c RUNEBOARD OFFEN ...
------------------------------------------------------------------------------------------------------------------------
local cond = CGdsIsInventoryOpen:new(2)
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo070", String = "Links sehen Sie Ihre momentan nicht verwendeten Runen und rechts die in der 'Runentafel' eingesetzten Runen. Auf der oberen Hälfte der Runentafel befinden sich die Felder für die Helden-Runen und unten die Felder für die Arbeiter-Runen, unterteilt in helle und dunkle Rassen."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo071", String = "Je nachdem welche Stufe Ihr Avatar hat, können Sie bis zu fünf Runen gleichzeitig verwenden. Klicken Sie auf die Rune des Helden und setzen Sie sie in eines der freien Felder oben in der Runentafel ein."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #7.d HERO RUNE NICHT MEHR IM INVENTAR ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		Negated(PlayerHasItem{ItemId = 3231, UpdateInterval = 1}),
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo072", String = "Nun müssen Sie den Helden noch ausrüsten. Sie haben einen Bogen, einen Dolch und zwei Rüstungsteile erhalten. Gehen Sie in das Inventar und wählen Sie die Rubrik 'Ausrüstung'."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #7.e EQUIPMENT MENÜ OFFEN ...
------------------------------------------------------------------------------------------------------------------------
local cond = CGdsIsInventoryOpen:new(0)
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo073", String = "Auf der rechten Seite des Fensters sehen Sie nun 2 Porträts. Wählen Sie das untere Porträt für Ihren Helden und geben Sie ihm die vier neuen Gegenstände links in Ihrem Inventar. Der Bogen muss in die linke Hand, das ist das Fach auf der rechten Seite."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #7.f NEUE AUSRÜSTUNG DEM HELDEN GEGEBEN ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerHasItem{ItemId = 693, Equipment = EquipmentHero, UpdateInterval = 1},
		PlayerHasItem{ItemId = 2325, Equipment = EquipmentHero, UpdateInterval = 1},
		PlayerHasItem{ItemId = 3265, Equipment = EquipmentHero, UpdateInterval = 1},
		PlayerHasItem{ItemId = 3266, Equipment = EquipmentHero, UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo074", String = "Wenn Ihr Avatar oder ein Held einen Gegenstand nicht benutzen kann, so wird dieser mit einem roten Hintergrund markiert. Schließen Sie Ihr Inventar."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #7.g INVENTAR GESCHLOSSEN ...
------------------------------------------------------------------------------------------------------------------------
local cond = Negated(CGdsIsInventoryOpen:new(8))
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo075", String = "Folgen Sie dem Weg bis zu dem großen Monument. Es handelt sich dabei um ein Helden-Monument."   , Color = ColorYellow},
				SetGlobalFlagTrue{Name = "OpenDoor3289"},
		},
}}


------------------------------------------------------------------------------------------------------------------------
-- #8.a BEIM HELDENMONUMENT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "PlayerInRangeHeroMonument", UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo076", String = "Gehen Sie dicht an das Helden-Monument, selektieren Sie es und klicken Sie auf das 'Runensymbol' unten in der Aktionsleiste."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #8.b HELDENMONUMENT ÜBERNOMMEN ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsMonumentInUse{X = 342, Y = 315, Range = 1 , UpdateInterval = 2},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo268", String = "Unten links im Selektionsfenster erscheint außer dem Helden-Monument ein Symbol mit einer Hand. Dort können Sie die Runenkraft Ihres Avatars ablesen."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo269", String = "Jedesmal, wenn Sie einen Helden oder später auch Arbeiter herbeirufen, verlieren Sie etwas Runenkraft und die Herbeirufungen dauern länger. Die Runenkraft regeneriert sich mit der Zeit automatisch."   , Color = ColorWhite} },

		[3] = { SetInfoText{Tag = "TutInfo077", String = "Nun können Sie die Herbeirufung des Helden auslösen. Selektieren Sie das Monument und klicken Sie unten in der Aktionsleiste auf das Symbol für den Helden. Es dauert dann einige Sekunden, bis der Held erscheint."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #8.c HELD ERSCHEINT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "PlayerHasCalledHeroToAction", UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo078", String = "Oben links ist nun ein zweiter 'Porträt-Button' für Ihren neuen Helden erschienen. Sie können den Helden nun kommandieren."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo079", String = "Um mehrere Einheiten gleichzeitig zu selektieren, können Sie in der Spielwelt die linke Maustaste gedrückt halten und einen Rahmen um beide Figuren ziehen. Sobald Sie die linke Maustaste loslassen, wird die Selektion festgelegt."   , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo184", String = "Sie können Kampfeinheiten auch zu Gruppen zusammenschließen. Dazu selektieren Sie zunächst die Einheiten. Klicken Sie dann auf eine der kleinen Schaltflächen in der Mitte des oberen Bildschirmrandes. Sie können auch die Taste STRG gedrückt halten und eine Zifferntaste von 1-6 für die entsprechende Gruppe wählen." , Color = ColorWhite} },
		[4] = { SetInfoText{Tag = "TutInfo185", String = "Wenn Sie eine Gruppe definiert haben, erscheint ein 'Porträt-Button' am oberen Bildrand mit der Anzahl der Einheiten in der Gruppe. Die Funktionalität des 'Porträt-Buttons' ist mit der Ihres Avatars identisch." , Color = ColorWhite} },
		[5] = { SetInfoText{Tag = "TutInfo186", String = "Sie können dann sehr schnell eine Gruppe selektieren, indem Sie den entsprechenden Porträt-Button anklicken oder eine Zifferntaste von 1-6 drücken." , Color = ColorWhite} },

		[6] = { SetInfoText{Tag = "TutInfo080", String = "Folgen Sie dem Weg weiter nach Süden."   , Color = ColorYellow} ,
				SetGlobalFlagTrue{Name = "OpenDoor3290"},
		},
}}


------------------------------------------------------------------------------------------------------------------------
-- #9.a BEI DEN UNTOTEN ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "PlayerInRangeUndeadCity", UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo081", String = "Es steht Ihnen ein Kampf mit 'Untoten' bevor. Gemeinsam mit Ihrem Helden können Sie diesen Kampf gewinnen."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo082", String = "Setzen Sie Ihre Magie ein und besiegen Sie die 'Untoten'."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #9.b ALLE UNTOTEN SIND ENDGÜLTIG TOT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		FigureDead{NpcId = 3443},
		FigureDead{NpcId = 3652},
		FigureDead{NpcId = 3655},
		FigureDead{NpcId = 3651},
		FigureDead{NpcId = 3654},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo083", String = "Sehr gut! Einer der 'Untoten' hat einen wertvollen Edelstein dabei. Nehmen Sie ihn mit."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #9.c EDELSTEIN GELOOTET ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerHasItem{ItemId = 2472, UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo084", String = "Falls Sie noch einige weitere Testkämpfe durchführen wollen, biegen Sie hier nach Norden ab. Ansonsten folgen Sie dem Weg weiter nach Süden."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #9.d BEI DEN BEIDEN TOREN ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		FigureInRange{NpcId = Avatar, X = 247, Y = 286, Range = 15},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
		SetGlobalFlagTrue{Name = "OpenDoor3306"},
		SetNpcTimeStamp{Name = "UntotenTorTimer"},
	},
}
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsNpcTimeElapsed{Name = "UntotenTorTimer", Seconds = UntotenTorDelay, UpdateInterval = 5},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
		SetGlobalFlagTrue{Name = "OpenDoor3305"},
	},
}
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "PlayerInRangeCloseToMerchant", UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo085", String = "Folgen Sie dem Weg bis zu dem Händler. Händler sind durch eine sich drehende Münze über dem Kopf hervorgehoben."   , Color = ColorYellow} ,
		},
}}


------------------------------------------------------------------------------------------------------------------------
-- #10.a BEIM HÄNDLER ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "PlayerInRangeMerchant", UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo086", String = "Bei einem Händler können Sie Gegenstände jeder Art kaufen und verkaufen."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo087", String = "Gehen Sie in die Nähe des Händlers und sprechen Sie den Händler an, indem Sie ihn mit der rechten Maustaste anklicken. Es erscheint ein Fenster mit dem Händlermenü."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #10.b HANDELSMENÜ OFFEN ...
------------------------------------------------------------------------------------------------------------------------
local cond = CGdsIsInventoryOpen:new(5)
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo088", String = "Im Fenster links sehen Sie Ihre Gegenstände und rechts die Gegenstände des Händlers. In der Mitte ist das verfügbare Geld und der Preis der ausgewählten Gegenstände zu sehen."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo089", String = "100 Kupferstücke entsprechen einem Silberstück und 100 Silberstücke wiederum entsprechen einem Goldstück."   , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo090", String = "Alle Gegenstände sind in SpellForce in 5 Kategorien eingeteilt. Die 5 Symbole neben Ihrem Inventar und dem Inventar des Händlers sind abgedunkelt, falls Sie oder der Händler in dieser Kategorie über keinen Gegenstand verfügen."   , Color = ColorWhite} },
		[4] = { SetInfoText{Tag = "TutInfo091", String = "Sie wollen nun den Edelstein verkaufen, um Geld für den Einkauf zu erhalten."   , Color = ColorWhite} },

		[5] = { SetInfoText{Tag = "TutInfo092", String = "Wählen Sie das unterste Symbol für die Kategorie 'Quest- und Wertgegenstände'. Klicken Sie auf den Edelstein. Der angebotene Gegenstand wird grün markiert und in der Mitte sehen Sie den Preis, den der Händler bezahlen will. Klicken Sie auf 'Verkaufen'."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #10.c EDELSTEIN VERKAUFT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		Negated(PlayerHasItem{ItemId = 2472, UpdateInterval = 1}),
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo093", String = "Mit dem Geld wollen Sie sich nun etwas anderes kaufen. Klicken Sie auf die Rubrik 'Runen' und erwerben Sie die 'Menschen-Arbeiter-Rune'."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #10.d MENSCHEN ARBEITER RUNE GEKAUFT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerHasItem{ItemId = 783, UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo094", String = "Beenden Sie den Handel durch einen Klick auf den Haken unten rechts im Fenster oder die 'ESC'-Taste."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #10.e HANDELSMENÜ GESCHLOSSEN ...
------------------------------------------------------------------------------------------------------------------------
local cond = Negated(CGdsIsInventoryOpen:new(5))
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo095", String = "Öffnen Sie Ihr Inventar, wählen Sie links die Rubrik 'Runentafel' aus und legen Sie die gerade erworbene Menschen-Arbeiter-Rune in das Fach mit dem Menschen-Porträt unten links in der Runentafel."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #10.f MENSCHENRUNE INS RUNEBOARD GELEGT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		Negated(PlayerHasItem{ItemId = 783, UpdateInterval = 1}),
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo096", String = "Schließen Sie nun Ihr Inventar."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #10.g INVENTAR GESCHLOSSEN ...
------------------------------------------------------------------------------------------------------------------------
local cond = Negated(CGdsIsInventoryOpen:new(8))
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo097", String = "Folgen Sie dem Weg bis zum Seelenfels."   , Color = ColorYellow} ,
				SetGlobalFlagTrue{Name = "OpenDoor3307"},
		},
}}

------------------------------------------------------------------------------------------------------------------------
-- #11.a AM ZWEITEN SEELENFELS ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "PlayerInRangeSecondBindstone", UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo098", String = "Selektieren Sie den Seelenfels und aktivieren Sie ihn unten in der Aktionsleiste. Falls Sie sterben, müssen Sie jetzt nicht mehr den ganzen Weg bis zu diesem Ort laufen."   , Color = ColorYellow} ,
				SetGlobalFlagTrue{Name = "OpenDoor3307"},
		},
}}

------------------------------------------------------------------------------------------------------------------------
-- #11.b SPIELER GEBUNDEN AM ZWEITEN SEELENFELS ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsMonumentInUse{X = 179, Y = 217, Range = 1 , UpdateInterval = 2},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
		EnableDialog{NpcId = 3325},
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo099", String = "Von einem Seelenfels können Sie zu jedem anderen Seelenfels reisen, den Sie bereits aktiviert haben. Dazu selektieren Sie Ihren Avatar und gehen zum Seelenfels, klicken mit der rechten Maustaste auf den Seelenfels und wählen den Zielort."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo100", String = "Wenn Sie möchten, können Sie dies jetzt ausprobieren, ansonsten folgen Sie dem Weg weiter bis zu dem Menschen-Monument."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #11.c BEI JOSHUA & DEM MENSCHEN MONUMENT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "PlayerInRangeJoshua", UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
--		[1] = { SetInfoText{Tag = "TutInfo101", String = "Wenn Sie sterben, erstehen Sie am zuletzt verwendeten Seelenfels wieder auf. Feinde können allerdings Ihre Verbindung zu einem Seelenfels unterbrechen, wodurch Sie einen aktivierten Seelenfels auch wieder verlieren können."   , Color = ColorWhite} },

		[1] = { SetInfoText{Tag = "TutInfo102", String = "Reden Sie mit 'Joshua', dem Mann direkt neben dem Monument."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #11.d MIT JOSHUA GEREDET ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		QuestState{QuestId = 475, State = StateSolved, UpdateInterval = 5},
		IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking", UpdateInterval = 5},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo103", String = "Sie haben nun einen neuen Auftrag erhalten. Öffnen Sie Ihr Inventar und wählen sie die Seite 'Questbuch'."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #11.e QUESTBOOK OFFEN ...
------------------------------------------------------------------------------------------------------------------------
local cond = CGdsIsInventoryOpen:new(4)
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo104", String = "In der Mitte des Fensters sehen Sie alle Ihre aktuellen noch nicht abgeschlossenen Questen und rechts eine Detailansicht der momentan angewählten Queste."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo105", String = "Sie haben die Queste 'Die verschollene Rune' erhalten. Wenn Sie die Queste anklicken, erscheinen rechts die einzelnen Schritte dieser Queste. Bereits gelöste Schritte werden abgedunkelt angezeigt."   , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo106", String = "Wenn Sie den Mauszeiger über einen dieser einzelnen Schritte halten, erscheint zusätzlich unten links ein Hilfe-Fenster mit Informationen, falls Sie etwas vergessen haben sollten."   , Color = ColorWhite} },

		[4] = { SetInfoText{Tag = "TutInfo107", String = "Schließen Sie Ihr Inventar."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #11.f INVENTAR & QUESTBOOK WIEDER ZU ...
------------------------------------------------------------------------------------------------------------------------
local cond = Negated(CGdsIsInventoryOpen:new(8))
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo108", String = "Gehen Sie in die Nähe des Monuments, selektieren Sie das Monument und klicken Sie auf das 'Runensymbol' unten in der Aktionsleiste."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #11.g MENSCHEN MONUMENT GECLAIMED ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsMonumentInUse{X = 206, Y = 214, Range = 1 , UpdateInterval = 2},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo109", String = "In dem Augenblick, in dem Sie ein Arbeiter-Monument belegen, wird es ernst. Wenn Feinde Ihre neu entstehenden Siedlungen entdecken, werden sie alles daransetzen, sie möglichst schnell zu zerstören. Auf dieser Karte können Sie sich aber Zeit lassen."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo110", String = "Nun können Sie die Herbeirufung von menschlichen Arbeitern auslösen. Selektieren Sie das Monument und klicken Sie unten in der Aktionsleiste auf das Symbol für Arbeiter."   , Color = ColorWhite} },

		[3] = { SetInfoText{Tag = "TutInfo111", String = "Der Arbeiter erscheint nach einigen Sekunden. Sie können das Symbol auch mehrfach anklicken, um weitere Arbeiter in Auftrag zu geben. Produzieren Sie wenigstens 5 Arbeiter."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #11.h FÜNF ARBEITER(INNEN) HERBEIGERUFEN ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerUnitExists{UnitId = 0, Amount = 5, UpdateInterval = 5, NoWorkers = FALSE},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo112", String = "Wenn Sie das Monument selektiert haben, sehen Sie unten links Zahlen für Ihre Bevölkerungsbegrenzung. Die oberen Zahlen geben an, wie viele Arbeiter dieser Rasse Sie momentan haben und maximal haben können."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo113", String = "Sie können momentan bis zu 20 Arbeiter produzieren. Die Anzahl der maximalen Arbeiter erhöht sich, wenn Sie größere Haupthäuser bauen."   , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo114", String = "Oben rechts befindet sich nun ein Porträt-Button für menschliche Arbeiter. Die Zahl gibt an, wie viele menschliche Arbeiter momentan keiner Arbeit nachgehen. Mit einem Klick auf den Porträt-Button können Sie einen freien Arbeiter selektieren."   , Color = ColorWhite} },
		[4] = { SetInfoText{Tag = "TutInfo115", String = "Die Arbeiter können, je nach Rasse, verschiedene Rohstoffe abbauen. Menschliche Arbeiter können Bäume fällen, im Steinbruch arbeiten oder Eisenerz abbauen."   , Color = ColorWhite} },
		[5] = { SetInfoText{Tag = "TutInfo116", String = "Links neben dem Monument befindet sich ein Steinbruch und rechts daneben ein Erzvorkommen. Der nächste Wald befindet sich westlich."   , Color = ColorWhite} },
		[6] = { SetInfoText{Tag = "TutInfo117", String = "Um Arbeiter einen Rohstoff abbauen zu lassen, selektieren Sie einen oder mehrere Arbeiter und klicken dann mit der rechten Maustaste direkt auf den Baum, Felsen oder das Erzvorkommen. Dazu dürfen ausschließlich Arbeiter in der Selektion sein."   , Color = ColorWhite} },
		[7] = { SetInfoText{Tag = "TutInfo118", String = "Am oberen Bildschirmrand sehen Sie, welche Menge an Rohstoffen Sie bereits abgebaut haben. Mit Rohstoffen können Sie Gebäude errichten lassen oder Kampf-Einheiten an einem Monument herbeirufen."   , Color = ColorWhite} },

		[8] = { SetInfoText{Tag = "TutInfo119", String = "Selektieren Sie Arbeiter und schicken Sie sie mit der rechten Maustaste zum Baumfällen. Lassen Sie sie Steine und Erz abbauen, bis Sie wenigstens 50 Einheiten von jedem der drei Rohstoffe haben."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #11.i MINDESTMENGE HOLZ, STEIN & EISEN ABGEBAUT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerHasGood{Good = GoodBoard, Amount = 50, Side = SideLight, UpdateInterval = 10},
		PlayerHasGood{Good = GoodStone, Amount = 50, Side = SideLight, UpdateInterval = 10},
		PlayerHasGood{Good = GoodIron, Amount = 50, Side = SideLight, UpdateInterval = 10},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo120", String = "Sehr gut! Sie haben jetzt genug Rohstoffe, um erste Gebäude zu errichten."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo121", String = "Selektieren Sie einen beliebigen Arbeiter und klicken Sie auf das Bau-Symbol unten in der Aktionsleiste. Es erscheint eine Auswahl von Gebäuden. Klicken Sie die 'Holzfällerhütte' an und wählen Sie in der Spielwelt einen Standort in der Nähe des Waldes."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #11.j HOLZFÄLLER GEBÄUDE WIRD GEBAUT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerBuildingExists{BuildingId = 4, OnlyWhenBuiltUp = FALSE, UpdateInterval = 5},		-- Holzfäller
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo122", String = "Der gewählte Arbeiter beginnt nun, das Gebäude zu errichten. Sie können weitere Arbeiter selektieren und mit einem Rechtsklick zusätzlich zu der Baustelle schicken, falls Sie das Gebäude schneller errichten lassen wollen."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo123", String = "Wählen Sie nun andere Arbeiter aus und bauen Sie außerdem noch einen Steinbruch in der Nähe der Felsen und eine Mine bei dem Erzvorkommen."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #11.k STEINBRUCH UND MINE WERDEN ERRICHTET ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerBuildingExists{BuildingId = 7, OnlyWhenBuiltUp = FALSE, UpdateInterval = 10},		-- Steinbruch
		PlayerBuildingExists{BuildingId = 14, OnlyWhenBuiltUp = FALSE, UpdateInterval = 10},	-- Mine
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo124", String = "In jedem dieser Rohstoff-Gebäude können bis zu 5 Arbeiter zu sogenannten Handwerkern aufsteigen. Handwerker haben andere Kleidung und spezielles Werkzeug und sind doppelt so effizient wie einfache Arbeiter."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo125", String = "Wenn Sie ein fertiges Gebäude selektieren, dann können Sie unten links im Selektionsfenster sehen, wie viele Handwerker bereits diesem Gebäude zugeordnet sind. Wenn Sie ein leeres Symbol anklicken und noch ein freier Arbeiter verfügbar ist, wird er dem Gebäude zugewiesen. Wenn Sie auf ein belegtes Symbol klicken, wird ein Arbeiter freigesetzt."   , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo126", String = "Arbeiter, die das Gebäude errichtet haben, übernehmen automatisch die freien Arbeitsplätze des Gebäudes soweit verfügbar."  , Color = ColorWhite} },
		[4] = { SetInfoText{Tag = "TutInfo127", String = "Wenn Sie einen selektierten Arbeiter mit der rechten Maustaste zu einem Gebäude schicken, können Sie freie Arbeitsplätze belegen. So suchen Arbeiter, die z.B. Bäume fällen, automatisch nach freien Plätzen in Holzfällergebäuden und besetzen diese nach kurzer Zeit."   , Color = ColorWhite} },

		[5] = { SetInfoText{Tag = "TutInfo128", String = "Warten Sie, bis alle drei Gebäude fertiggestellt sind. Falls ein Gebäude nicht mehr weitergebaut wird, haben Sie versehentlich alle Arbeiter von der Baustelle abgezogen."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #11.l HOLZFÄLLER, STEINBRUCH UND MINE EXISTIEREN ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerBuildingExists{BuildingId = 4, OnlyWhenBuiltUp = TRUE, UpdateInterval = 10},	-- Holzfäller
		PlayerBuildingExists{BuildingId = 7, OnlyWhenBuiltUp = TRUE, UpdateInterval = 10},	-- Steinbruch
		PlayerBuildingExists{BuildingId = 14, OnlyWhenBuiltUp = TRUE, UpdateInterval = 10},	-- Mine
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo129", String = "Nun sollten Ihre Rohstoffe wesentlich schneller ansteigen. Behalten Sie die einzelnen Lagerbestände im Auge und weisen Sie bei Bedarf Arbeitern eine andere Tätigkeit zu."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo130", String = "Wenn Sie eine größere Armee rekrutieren wollen, benötigen Sie Nahrungsmittel. Die Menschen sind sehr flexibel und können Fische fangen, Tiere jagen oder züchten und Getreide anbauen."   , Color = ColorWhite} },

		[3] = { SetInfoText{Tag = "TutInfo131", String = "In der Umgebung Ihrer Basis befinden sich zahlreiche Tiere. Bauen Sie ein Jagdhaus, um sich Nahrungsmittel zu beschaffen. Lassen Sie außerdem das kleine Haupthaus errichten, damit Sie über bis zu 30 Arbeiter verfügen."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #11.m JAGDHÜTTE UND KLEINES HAUPTHAUS EXISTIEREN ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerBuildingExists{BuildingId = 2, OnlyWhenBuiltUp = TRUE, UpdateInterval = 10},	-- Kleines Haupthaus
		PlayerBuildingExists{BuildingId = 9, OnlyWhenBuiltUp = TRUE, UpdateInterval = 10},	-- Jägerhütte
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo132", String = "Sie können bis zu 5 Arbeiter in das Jagdhaus schicken, um schneller Nahrungsmittel zu erhalten. Die Menge Ihrer gelagerten Nahrungsmittel bestimmt die maximale Größe Ihrer Armee."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo265", String = "Durch die Fahnen an den Gebäuden erkennt man, welchem Spieler die Gebäude gehören und ob gegenwärtig Arbeiter in diesem Gebäude arbeiten."   , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo133", String = "Wenn Sie genau hinsehen, können Sie in dem See hinter dem Menschen-Monument die Fischvorkommen entdecken. Am Seeufer stehen einige Beerenbüsche, diese dienen allerdings nur als Nahrung für Elfen."   , Color = ColorWhite} },

		[4] = { SetInfoText{Tag = "TutInfo134", String = "Nun sollten Sie etwas für die Verteidigung Ihrer Siedlung tun. Errichten Sie zwei Türme in dem durch Steinplatten markierten Bereich in der Nähe des Erzvorkommens, da Feinde vermutlich aus dieser Richtung angreifen werden."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #11.n ZWEI TÜRME BEI DEN GOBLINS BAUEN ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerBuildingExists{BuildingId = 13, OnlyWhenBuiltUp = TRUE, Amount = 2, UpdateInterval = 10},	-- 2 Schützentürme
		BuildingInRange{X = 224, Y = 189, Range = 15, Owner = OwnerPlayer, BuildingId = 13, UpdateInterval = 10},
		--BuildingInRange{X = 222, Y = 183, Range = 6, Owner = OwnerPlayer, BuildingId = 13, UpdateInterval = 20},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo135", String = "Einige 'Goblins' greifen Ihre Siedlung an. Sie werden gleich ein Alarmsignal hören. Zusätzlich weist ein rotes Symbol in der Übersichtskarte auf den Ort des Angriffs hin. Verteidigen Sie Ihre Stadt mit dem Avatar und dem Helden."   , Color = ColorYellow} ,
				SetGlobalFlagTrue{Name = "OpenDoor3334"},
		},
}}


------------------------------------------------------------------------------------------------------------------------
-- #12.a GOBLINS ANGRIFF KOMMANDO GEBEN ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "Door3334NowOpen", UpdateInterval = 10},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
		Goto{X = 204, Y = 208, NpcId = 3659, Range = 15, WalkMode = Run, GotoMode = GotoContinous},
		Goto{X = 205, Y = 208, NpcId = 3660, Range = 15, WalkMode = Run, GotoMode = GotoContinous},
		Goto{X = 205, Y = 209, NpcId = 3661, Range = 15, WalkMode = Run, GotoMode = GotoContinous},
		Goto{X = 203, Y = 208, NpcId = 3662, Range = 15, WalkMode = Run, GotoMode = GotoContinous},
		Goto{X = 204, Y = 207, NpcId = 3663, Range = 15, WalkMode = Run, GotoMode = GotoContinous},
		Goto{X = 204, Y = 208, NpcId = 3664, Range = 15, WalkMode = Run, GotoMode = GotoContinous},
		Goto{X = 204, Y = 209, NpcId = 3665, Range = 15, WalkMode = Run, GotoMode = GotoContinous},
		Goto{X = 205, Y = 207, NpcId = 3666, Range = 15, WalkMode = Run, GotoMode = GotoContinous},
	},
}

------------------------------------------------------------------------------------------------------------------------
-- #12.b GOBLIN ANGREIFER TOT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		FigureDead{NpcId = 3659},
		FigureDead{NpcId = 3660},
		FigureDead{NpcId = 3661},
		FigureDead{NpcId = 3662},
		FigureDead{NpcId = 3663},
		FigureDead{NpcId = 3664},
		FigureDead{NpcId = 3665},
		FigureDead{NpcId = 3666},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo136", String = "Sehr gut, die Angreifer sind geschlagen. Sie können übrigens immer wenn ein Alarmsignal ertönt durch Drücken der 'SPACE'-Taste (Leertaste) sofort zum Ort des Geschehens wechseln."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo137", String = "Falls Ihre Türme beschädigt sind, können Sie diese wieder reparieren lassen. Selektieren Sie dazu einen oder mehrere Arbeiter und klicken Sie mit der rechten Maustaste auf das beschädigte Gebäude."   , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo138", String = "An einem Menschen-Monument können Sie nicht nur Arbeiter, sondern auch menschliche Krieger und Magier herbeirufen."   , Color = ColorWhite} },
		[4] = { SetInfoText{Tag = "TutInfo139", String = "Die an den Monumenten herbeigerufenen Krieger sind zwar alleine nicht so stark wie Ihr Avatar oder Ihre Helden, Sie können mit ausreichend Rohstoffen dafür aber ganze Armeen produzieren."   , Color = ColorWhite} },

		[5] = { SetInfoText{Tag = "TutInfo140", String = "Es ist an der Zeit, eine Armee aufzustellen. Errichten Sie eine Schmiede."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #12.c SCHMIEDE ERRICHTET ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerBuildingExists{BuildingId = 75, OnlyWhenBuiltUp = TRUE, UpdateInterval = 10},	-- Schmiede
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo141", String = "In der Schmiede werden automatisch Waffen und Rüstungen für Kampfeinheiten hergestellt. Wenn Sie über mehrere Schmieden verfügen, können Sie schneller Kampfeinheiten produzieren."   , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo142", String = "Auch Kampfeinheiten werden am Menschen-Monument herbeigerufen. Wenn Sie einen Sammelpunkt für neue Einheiten festlegen möchten, selektieren Sie das Menschen-Monument und klicken Sie mit der rechten Maustaste auf den Zielort. Das Erscheinen einer kleinen Fahne zeigt an, dass produzierte Kampfeinheiten sich an diesem Punkt sammeln werden."   , Color = ColorWhite} },
--		[3] = { SetInfoText{Tag = "TutInfo143", String = "ALTENATIVE"   , Color = ColorWhite} },
--		[4] = { SetInfoText{Tag = "TutInfo144", String = "Auch Kampfeinheiten werden am Menschen-Monument herbeigerufen. Wenn Sie einen Sammelpunkt für neue Einheiten festlegen möchten, selektieren Sie das Menschen-Monument, klicken Sie unten links im Selektionsfenster auf das Symbol für 'Sammelpunkt' und klicken Sie in der Spielwelt auf den Zielort."   , Color = ColorWhite} },

		[3] = { SetInfoText{Tag = "TutInfo145", String = "Selektieren Sie nun das Menschen-Monument und produzieren Sie wenigstens 3 Rekruten und 3 Späher. Falls Sie eine Einheit nicht produzieren können, finden Sie im Hilfe-Fenster einen rot markierten Text als Hinweis auf die Ursache, z.B. ein fehlendes oder nicht besetztes Gebäude oder zu wenig Rohstoffe."   , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #12.d JE DREI SCOUTS & REKRUTEN ERSCHAFFEN ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerUnitExists{UnitId = 543, Amount = 3 , UpdateInterval = 10},	-- Rekruten
		PlayerUnitExists{UnitId = 544, Amount = 3 , UpdateInterval = 10},	-- Scouts
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo146", String = "Die Orks verfügen über eigene Patrouillen, die nach Feinden suchen. Wenn eine solche Patrouille Ihre Siedlung oder Krieger von Ihnen entdeckt, geht sie nach kurzer Zeit zurück in das feindliche Hauptlager und schlägt Alarm."   , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo147", String = "Gleich wird eine Patrouille Ihre Siedlung entdecken. Ein gelbes Symbol erscheint in diesem Moment auf der Übersichtskarte. Vernichten Sie die Gegner, bevor sie entkommen."   , Color = ColorYellow},
				SetGlobalFlagTrue{Name = "OpenDoor3331"},
		},
}}


------------------------------------------------------------------------------------------------------------------------
-- #13.a SCOUTGRUPPE TOT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		FigureDead{NpcId = 3613},
		FigureDead{NpcId = 3614},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo148", String = "Jetzt werden Sie zwar nicht direkt angegriffen, nach einiger Zeit wird das Hauptlager aber die Patrouille vermissen und nach ihr suchen lassen. Sie haben aber Zeit gewonnen und sollten nun schnell weitere Späher und Rekruten produzieren." , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo149", String = "Es ist wichtig, dass Sie die Gebäude in feindlichen Lagern möglichst schnell zerstören, denn dort werden immer wieder neue Gegner rekrutiert." , Color = ColorWhite} },

		[3] = { SetInfoText{Tag = "TutInfo150", String = "Um eine größere Armee zu produzieren, benötigen Sie mehr Nahrungsmittel. Selektieren Sie Ihr Menschen-Monument." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #13.b MENSCHEN MONUMENT SELEKTIERT ...
------------------------------------------------------------------------------------------------------------------------
local cond = CGdsIsMonumentSelected:new(206, 214, 1)
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo151", String = "Die unteren Zahlen in dem Selektionsfenster unten links geben an, wie viele Kampfeinheiten Sie haben und maximal haben können. Der Maximalwert ist momentan 10." , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo152", String = "In Haupthäusern können Sie die maximale Armeegröße erhöhen. Dies kostet Nahrungsmittel. Selektieren Sie Ihr kleines Haupthaus." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #13.c KLEINES HAUPTHAUS SELEKTIERT ...
------------------------------------------------------------------------------------------------------------------------
local cond = CGdsIsBuildingSelected:new(2, 0, 0, 1)
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerBuildingExists{BuildingId = 2, OnlyWhenBuiltUp = TRUE, UpdateInterval = 10},	-- Kleines Haupthaus
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo153", String = "Unten in der Aktionsleiste sehen Sie nun ein Symbol für Nahrungsmittel. Wenn Sie den Mauszeiger darüber halten, werden die Kosten für diese Aufwertung im Hilfe-Fenster angezeigt." , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo154", String = "Wenn Sie das Symbol einmal anklicken erhöht sich für 100 Nahrungsmitteleinheiten die maximale Anzahl der Kampfeinheiten von 10 auf 15. Die Erhöhung von 15 auf 20 Einheiten kostet bereits 200 Nahrungsmitteleinheiten." , Color = ColorWhite} },

		[3] = { SetInfoText{Tag = "TutInfo155", String = "Erhöhen Sie nun die maximale Anzahl Ihrer Kampfeinheiten auf wenigstens 20 Einheiten, indem Sie das Symbol zweimal anklicken. Falls das Symbol abgedunkelt ist, haben Ihre Jäger noch nicht ausreichend Nahrungsmittel beschafft und Sie müssen etwas warten." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #13.d EINHEITENLIMIT AUF 20 ERHÖHT ...
------------------------------------------------------------------------------------------------------------------------
local cond = CGdsIsUnitLimit:new(1, UnitLimitAfterUpgrade, 0)
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo156", String = "Mit dem kleinen Haupthaus können Sie den Maximalwert auf bis zu 30 Kampfeinheiten erhöhen. Mit dem mittleren und großen Haupthaus erhalten Sie später weitere Möglichkeiten, den Maximalwert zu erhöhen." , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo157", String = "Wenn Sie später einmal zwei verbündete Rassen gleichzeitig spielen, so gilt der Maximalwert der Kampfeinheiten für die gemeinsame Armee, dafür teilen die Rassen aber auch ihre Nahrungsmittel." , Color = ColorWhite} },

		[3] = { SetInfoText{Tag = "TutInfo158", String = "Produzieren Sie weitere Späher und Rekruten und zerstören Sie das Ork-Lager im Osten. Bauen Sie weitere Rohstoffe ab und sorgen Sie für ausreichend Nahrung." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #13.e ORK LAGER ZERSTÖRT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "OrcCamp1Destroyed", UpdateInterval = 2},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
		QuestSolve{QuestId = 476},
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo264", String = "Sie können Leichen und Truhen nicht durchsuchen, wenn in der Nähe noch ein Feind ist." , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo159", String = "In dem Ork-Lager steht eine Kiste. Wenn Sie mit einer eigenen Figur in der Nähe stehen, können Sie die Kiste durch einen Klick mit der rechten Maustaste öffnen. Nehmen Sie die beiden Pläne darin an sich." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #13.f TEMPEL UND KLERIKER PLÄNE GELOOTET ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalCounter{Name = "OrkCampItemCounter", Operator = IsEqual, Value = 2, UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo160", String = "Sie haben gerade den Konstruktionsplan für ein neues Gebäude und den Einheitenplan für die menschliche Einheit 'Kleriker' gefunden." , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo161", String = "Öffnen Sie Ihr Inventar und gehen Sie auf die Seite 'Pläne'." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #13.g IM INVENTAR BEI DEN PLÄNEN ...
------------------------------------------------------------------------------------------------------------------------
local cond = CGdsIsInventoryOpen:new(3)
cond:SetUpdateInterval(1)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo162", String = "Hier haben Sie die Übersicht, über welche Gebäude- und Einheitenpläne Sie von allen sechs Aufbaurassen verfügen. Auf der rechten Seite im Fenster können Sie die Rasse wählen. Wählen Sie, falls nicht bereits aktiv, die Menschen." , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo163", String = "Legen Sie den Einheitenplan in ein freies Fach bei den Einheiten in der unteren Zeile." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #13.h KLERIKER PLAN WEG ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		Negated(PlayerHasItem{ItemId = 1261, UpdateInterval = 1}),
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo164", String = "Diese Einheit können Sie ab jetzt an Ihren Menschen-Monumenten produzieren, vorausgesetzt Sie verfügen über die erforderlichen Gebäude und Rohstoffe." , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo165", String = "Legen Sie den Gebäudeplan in ein freies Fach bei den Gebäuden in der oberen Zeile. Da die erste Zeile komplett belegt ist, müssen Sie zunächst den Pfeil nach rechts klicken." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #13.i TPEMEL PALN BZNTEUT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		Negated(PlayerHasItem{ItemId = 255, UpdateInterval = 1}),
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo166", String = "Ab jetzt können Ihre menschlichen Arbeiter auch den 'Tempel' errichten. Schließen Sie Ihr Inventar." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #13.j INVENTAR GESCHLOSSEN ...
------------------------------------------------------------------------------------------------------------------------
local cond = Negated(CGdsIsInventoryOpen:new(8))
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo167", String = "Wenn Sie menschliche Einheiten mit magischen Fähigkeiten herbeirufen wollen, benötigen Sie 'Aria' eine magische Flüssigkeit. In der Nähe des Ork-Lagers finden Sie eine Aria-Quelle." , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo168", String = "Einfache Arbeiter sind nicht in der Lage, Aria zu fördern. Sie benötigen dafür ein spezielles Gebäude." , Color = ColorWhite} },

		[3] = { SetInfoText{Tag = "TutInfo169", String = "Errichten Sie in der Nähe der Aria-Quelle einen 'Ariaschrein' und in Ihrer Hauptsiedlung den Tempel des Lichts. Um diese Gebäude auswählen zu können, müssen Sie bei der Gebäudeauswahl den Pfeil nach rechts anklicken." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #13.k SCHREIN UND TEMPEL AUFGEBAUT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerBuildingExists{BuildingId = 16, OnlyWhenBuiltUp = TRUE, UpdateInterval = 10},	-- Aria Schrein
		PlayerBuildingExists{BuildingId = 17, OnlyWhenBuiltUp = TRUE, UpdateInterval = 10},	-- Tempel
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo170", String = "Bis zu 5 Handwerker können in dem 'Ariaschrein' arbeiten und Aria fördern." , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo171", String = "Der 'Tempel des Lichts' dient der Beschwörung von Einheiten mit magischen Fähigkeiten, vergleichbar mit der Schmiede für die Waffenproduktion. Mehrere Tempel erlauben eine schnellere Herbeirufung magischer Einheiten." , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo172", String = "Außerdem können Sie im Tempel des Lichts eine Aufwertung durchführen. Aufwertungen sind in zahlreichen Gebäuden möglich und sie verbessern meist Ihre Einheiten, können aber auch andere Vorteile bieten." , Color = ColorWhite} },
		[4] = { SetInfoText{Tag = "TutInfo173", String = "Wenn Sie den Tempel selektieren und ausreichend Rohstoffe haben, können Sie unten das Symbol 'Weg des Lichts' aktivieren. Alle Kleriker, welche Sie danach herbeirufen, verfügen über ein Schild und größere Mana-Reserven." , Color = ColorWhite} },
		[5] = { SetInfoText{Tag = "TutInfo174", String = "Neben der Aria-Quelle sehen Sie übrigens einige Lenya-Pflanzen und Mondsilber. Beide Rohstoffe sind für Menschen unbedeutend, spielen aber für die anderen Aufbaurassen eine wichtige Rolle." , Color = ColorWhite} },

		[6] = { SetInfoText{Tag = "TutInfo175", String = "Produzieren Sie wenigstens 3 Kleriker. Falls Sie die Einheit nicht produzieren können, ist die Schaltfläche abgedunkelt. Bewegen Sie in diesem Fall die Maus über die Schaltfläche und achten Sie auf Hinweise im Hilfe-Fenster. Falls die Anzahl Ihrer Kampfeinheiten bereits das Einheitenlimit erreicht hat, können Sie vorhandene Einheiten selektieren und mit 'K' zerstören." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #13.l DREI KLERIKER GEBAUT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = 
	{  	-- Kleriker oder Kleriker Upgrade
		ODER 
		(
			UND 
			(
				PlayerUnitExists{UnitId = 538, Amount = 2, UpdateInterval = 5},
		     	PlayerUnitExists{UnitId = 1227, Amount = 1, UpdateInterval = 5}
		    ),
			ODER
			(
				UND 
				(
					PlayerUnitExists{UnitId = 538, Amount = 1, UpdateInterval = 5},
		     		PlayerUnitExists{UnitId = 1227, Amount = 2, UpdateInterval = 5}
		     	),     
				ODER
				(
					PlayerUnitExists{UnitId = 538, Amount = 3, UpdateInterval = 5},
		     		PlayerUnitExists{UnitId = 1227, Amount = 3, UpdateInterval = 5}
		     	)
		   	)
		 ),
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo176", String = "Als nächstes wollen wir der Eisenproduktion etwas nachhelfen. Errichten Sie eine Schmelze im näheren Umkreis Ihrer 'Mine'." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #13.m SCHMELZE AUFGEBAUT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerBuildingExists{BuildingId = 15, OnlyWhenBuiltUp = TRUE, UpdateInterval = 10},	-- Schmelze
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo177", String = "Die 'Minen'-Handwerker werden nun das von Ihnen geförderte Erz bei der Schmelze abliefern. In der Schmelze wird es weiterverarbeitet. Dadurch erhalten Sie insgesamt die doppelte Rohstoffmenge pro Lieferung." , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo178", String = "Einfache Arbeiter können ihre Rohstoffe nur in Hauptgebäuden und an Monumenten abliefern." , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo179", String = "Alle Handwerker können ihr Eisenerz an eine Schmelze, ihr Holz an ein Sägwerk, ihre Steine an einen Steinmetz oder ihre Nahrungsmittel an das Nahrungslager liefern, wodurch jede Lieferung doppelt zählt." , Color = ColorWhite} },

		[4] = { SetInfoText{Tag = "TutInfo180", String = "Errichten Sie ein Nahrungslager." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #13.n NAHRUNGSMITTELLAGER AUFGEBAUT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerBuildingExists{BuildingId = 8, OnlyWhenBuiltUp = TRUE, UpdateInterval = 10},	-- Nahrungslager
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo181", String = "Wenn das Nahrungslager fertig ist, können Ihre herbeigerufenen Einheiten durch Nahrungsmittel ihre Lebenspunkte und Manareserven regenerieren. Dies ist insbesondere wichtig, wenn Sie viele magische Einheiten herbeirufen." , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo182", String = "Ihr Avatar und Ihre Helden regenerieren sich übrigens auch ohne Nahrungsmittel." , Color = ColorWhite} },

		[3] = { SetInfoText{Tag = "TutInfo183", String = "Rufen Sie wenigstens 15 Kampfeinheiten herbei." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #13.o FÜNFZEHN KAMPFEINHEITEN PRODUZIERT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		PlayerUnitExists{UnitId = 0, Amount = 15, UpdateInterval = 10},	-- 15 Einheiten
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo187", String = "Wenn Sie nun am Ork-Lager vorbei dem Weg weiter nach Osten folgen, werden Sie auf einen feindlichen Spähposten treffen. Dieser wird bei Sichtkontakt sofort sein Hauptlager alarmieren." , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo188", String = "Dringen Sie mit Ihrem Avatar, dem Helden und wenigstens 15 Kampfeinheiten weiter nach Osten vor. Sobald der Spähposten Sie entdeckt hat, erscheint ein gelbes Warnsignal auf der Übersichtskarte." , Color = ColorYellow},
				SetGlobalFlagTrue{Name = "OpenDoor3335"},
		},
}}


------------------------------------------------------------------------------------------------------------------------
-- #14.a LOOKOUT ALARMIERT CAMP ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		ODER(
			FigureHasAggro{NpcId = 3615},
			FigureDead{NpcId = 3615}
			),
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo189", String = "Die Orks sind alarmiert und schicken Ihnen eine Angriffswelle entgegen. Vernichten Sie die Orks und ihr Hauptlager." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #14.b ZWEITES CAMP ZERSTÖRT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "OrcCamp2Destroyed", UpdateInterval = 2},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
		QuestSolve{QuestId = 477},
		QuestBegin{QuestId = 478},
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo190", String = "Gratuliere! Wenn Sie in Ihr Questbuch schauen, werden Sie feststellen, dass Sie die beiden vorher offenen Schritte jetzt gelöst haben." , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo191", String = "Der Anführer der Orks hatte die gesuchte Rune bei sich. Durchsuchen Sie die Leiche und nehmen Sie die Rune an sich, falls noch nicht geschehen." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #14.bII ORK ANFÜHRER GELOOTET ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "PlayerHasHadAvatarRune", UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo192", String = "Gehen Sie nun zurück zu 'Joshua' am Menschen-Monument und reden Sie mit ihm." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #14.c DEM JOSHUA DIE RUNE GEBRACHT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking", UpdateInterval = 1},
		Negated(PlayerHasItem{ItemId = 3240, UpdateInterval = 1}),
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo193", String = "Für das Lösen der Queste haben Sie zusätzliche Erfahrungspunkte erhalten und Ihr Avatar ist eine Stufe aufgestiegen." , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo194", String = "Mit jeder neuen Stufe verfügt Ihr Avatar über mehr Lebenspunkte und Manareserven. Außerdem erhalten Sie Fähigkeitspunkte und Attributspunkte, mit denen Sie Ihren Avatar weiter verbessern können." , Color = ColorWhite} },

		[3] = { SetInfoText{Tag = "TutInfo195", String = "Öffnen Sie das Inventar und gehen Sie in die Rubrik 'Charakter-Information'" , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #14.d IM CHARAKTER STATS MENÜ ...
------------------------------------------------------------------------------------------------------------------------
local cond = CGdsIsInventoryOpen:new(6)
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo196", String = "Wählen Sie rechts im Fenster Ihren Avatar aus, falls nicht bereits aktiv. Links im Fenster sehen Sie die Fähigkeiten Ihres Avatars und in der Mitte die Attribute." , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo197", String = "Verteilen Sie die neuen Attributspunkte, z.B. auf Stärke oder Weisheit. Klicken Sie dazu im Fenster auf die kleinen Pfeile direkt neben den Zahlenwerten der Attribute." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #14.e STATPUNKTE VERTEILT ...
------------------------------------------------------------------------------------------------------------------------
local cond = Negated(CGdsAdvancementLookUp:new(0, 0, 0))
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo198", String = "Die einzelnen Attribute stehen für die Eigenschaften einer Figur. Wenn Sie mit dem Mauszeiger über einem Attribut schweben, erklärt das Hilfe-Fenster die Bedeutung der einzelnen Werte." , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo199", String = "Verteilen Sie nun die neuen Fähigkeitspunkte. Klicken Sie auf 'Neue Fähigkeit' und wählen Sie rechts im Fenster die 'leichte Kriegskunst' aus. Verteilen Sie den zweiten Punkt beliebig durch einen Klick auf einen der kleinen Pfeile neben den Fähigkeiten." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #14.f SKILLPUNKTE VERTEILT ...
------------------------------------------------------------------------------------------------------------------------
local cond = Negated(CGdsAdvancementLookUp:new(0, 0, 1))
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo200", String = "Sie haben durch Ihre besseren Fähigkeiten in der 'leichten Kriegskunst' nun eine zusätzliche Kampf-Fähigkeit erhalten, und zwar 'Berserk'." , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo201", String = "Sie finden diese Nahkampf-Fähigkeit in Ihrem Zauberbuch. Übertragen Sie 'Berserk' in das 'Zauber-Gedächtnis'." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #14.g BERSERK IM GEDÄCHTNIS ...
------------------------------------------------------------------------------------------------------------------------
local cond = CGdsIsSpellMemorized:new(3211)
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo202", String = "Schließen Sie nun Ihr Inventar.", Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #14.h INVENTORY GESCHLOSSEN ...
------------------------------------------------------------------------------------------------------------------------
local cond = Negated(CGdsIsInventoryOpen:new(8))
cond:SetUpdateInterval(2)
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		cond,
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo203", String = "Kampf-Fähigkeiten und einige Zaubersprüche werden nicht auf ein Ziel ausgelöst, sondern wirken nur  auf den auslösenden Charakter selbst." , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo204", String = "Lösen Sie 'Berserk' testweise aus, indem Sie Ihre Figur selektieren und das Symbol unten in der Aktionsleiste oder oben links unter dem Porträt anklicken." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #14.i DIE BERSERK ABILITY BENUTZT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "PlayerHasHadBerserkActive", UpdateInterval = 1},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
		SetGlobalFlagTrue{Name = "JoshTurorialOver"},
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo205", String = "Wenn Sie 'Berserk' auslösen, verursacht Ihr Avatar für kurze Zeit sehr hohen Kampfschaden. Dies kann in einer Notsituation sehr hilfreich sein, allerdings können Sie ihn erst nach einigen Minuten erneut einsetzen." , Color = ColorWhite} },

		[2] = { SetInfoText{Tag = "TutInfo206", String = "Sprechen Sie Joshua nochmals an." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #14.j JOSHUA ZUM LETZTEN MAL ANGESPROCHEN ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "JoshTutorialGotoPortal", UpdateInterval = 10},
		IsGlobalFlagFalse{Name = "GDS_PlayerIsTalking", UpdateInterval = 10},
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
		SetGlobalFlagTrue{Name = "OpenDoor3333"},
		SetGlobalFlagTrue{Name = "BeginJoshuaRohenCutscene"},
		-- lösche letzten info text
		SetInfoText{Tag = "", String = "" , Color = ColorWhite},
	},
}

------------------------------------------------------------------------------------------------------------------------
-- #14.k NACH ENDE DER FINALEN CUTSCENE ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		IsGlobalFlagTrue{Name = "TutExtroEnd", UpdateInterval = 10},
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo207", String = "Mit einem magischen Portal können Sie diese Karte nun verlassen. Oder folgen Sie dem Weg nach Süden. Dort warten weitere Gegner zum Experimentieren auf sie, sowie einige nützliche Hinweise, die Sie für die ersten Karten aber nicht unbedingt benötigen." , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo208", String = "Wenn Sie oben rechts 'Menü' anklicken, dann können Sie jederzeit den aktuellen Spielstand speichern." , Color = ColorWhite} },

		[3] = { SetInfoText{Tag = "TutInfo209", String = "Gehen Sie nach Westen zum Portal, um die Karte zu verlassen oder folgen Sie dem Weg nach Süden, um weitere nützliche Hinweise zu erhalten." , Color = ColorYellow} },
}}

------------------------------------------------------------------------------------------------------------------------
-- #14.l SPIELER AM FINALEN MONUMENT ...
------------------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "Tutorial#" .. TutorialStateNum }
AddTransition{ From = "Tutorial#" .. TutorialStateNum - 1, To = "Tutorial#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {
		ODER(
			FigureInRange{NpcId = Avatar, X = 145, Y = 196, Range = TutorialDefaultRange},
			FigureInRange{NpcId = Avatar, X = 297, Y = 108, Range = TutorialDefaultRange}
			),
		CGdsIsInfoTextActive:new(),
	},
	Actions = {
	},
}
TutorialTextFlow{ From = "Tutorial#" .. TutorialStateNum, To = "Tutorial#" .. TutorialStateNum,	Actions = {
		[1] = { SetInfoText{Tag = "TutInfo210", String = "Portale erlauben einem die Reise zu neuen Plattformen, auch wenn man dort noch über keinen aktiven Seelenfels verfügt. Wenn Sie dieses Portal benutzen, betreten Sie die nächste Karte." , Color = ColorYellow} },
}}


EndDefinition()
end
