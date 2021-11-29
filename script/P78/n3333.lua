function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- portal events zum �ffnen/schliessen von portalen und toren
OnPortalEvent
{
	X = 172, Y = 162,
	Type = SteinTorGross,
	OpenConditions = {
		IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 5},
		--PlayerUnitInRange{X = 172, Y = 162, Range = 5, UpdateInterval = 5}
	 },
	StayOpen = TRUE,
}


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------ TUTORIAL ADVANCED INFO BEREICH ----------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

TippRange = 4

---------------------------------------------------------------------------------------------------------------
-- TIP 0	-	Tippeinleitung
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = 0
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					ODER(
						FigureInRange{NpcId = Avatar, X = 169, Y = 155, Range = 6},
						FigureInRange{NpcId = Avatar, X = 176, Y = 155, Range = 6}
						),	}, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo211", String =  "Immer, wenn Sie eine Statue erreichen, erhalten Sie einige Tipps und Hinweise aus verschiedenen Bereichen des Spiels."  , Color = ColorWhite} },
}}

---------------------------------------------------------------------------------------------------------------
-- TIP 1	-	Reisen
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 161, Y = 149, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo212", String =  "Wenn Sie mit einem Portal oder einem Seelenfels von einer Plattform zu einer anderen reisen, verlieren Sie alle Ihre zuvor durch Runenmagie herbeigerufenen Einheiten und die erbauten Siedlungen. �berlegen Sie sich daher gut, zu welchem Zeitpunkt Sie weiterziehen."  , Color = ColorWhite} },

}}

---------------------------------------------------------------------------------------------------------------
-- TIP 2	-	Bild rotieren
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 132, Y = 144, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo213", String = "F�r eine bessere �bersicht, ist die Blickrichtung in isometrischer Perspektive automatisch nach Norden ausgerichtet."  , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo214", String =  "Mit den Tasten 'ENTF' und 'ENDE' k�nnen Sie den Bildausschnitt rotieren. Dies k�nnen Sie auch machen, indem Sie beide Maustasten gedr�ckt halten und die Maus nach links oder rechts bewegen."  , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo215", String =  "Standardm��ig rotiert der Bildausschnitt automatisch wieder in die Ausgangsposition, wenn Sie die Tasten bzw. die Maustasten loslassen. Diese Funktion kann in den Optionen auch deaktiviert werden."  , Color = ColorWhite} },
		[4] = { SetInfoText{Tag = "TutInfo216", String =  "Mit der Taste 'POS1'  wird der Bildausschnitt wieder nach Norden ausgerichtet."  , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 3	-	Questen
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 112, Y = 138, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo217", String = "Manche Charaktere haben Dialoge und Auftr�ge, welche die Hauptquest betreffen, andere Charaktere sind nur f�r sogenannte 'Nebenquesten' wichtig."  , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo218", String = "Sie erkennen die Charaktere f�r die Hauptquest an dem gro�en '!'-Symbol �ber dem Kopf dieser Charaktere. Mit diesen Charakteren m�ssen Sie reden, um die Hauptquest erfolgreich zu l�sen."  , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo219", String = "Die sogenannten 'Nebenquesten' sind optional. Sie m�ssen sie nicht absolvieren, aber sie bieten Ihnen zahlreiche Vorteile und Abenteuer."  , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 4	-	Formationen
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 126, Y = 108, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo220", String = "Neben dem Inventar-Symbol unten rechts befindet sich ein Formations-Symbol."  , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo221", String = "Wenn Sie mehrere Einheiten selektieren, k�nnen Sie eine Formation bilden, indem Sie das Formations-Symbol anklicken. Die Einheiten bilden dann eine Formation, so wie sie momentan angeordnet sind."  , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo222", String = "Wahrscheinlich werden Sie aber die komfortable Funktion f�r Standard-Formationen bevorzugen. Sobald  Sie eine Formation gebildet haben, erscheinen drei weitere Symbole f�r die drei Standard-Formationen: Kreis-, Halbkreis- und Reihen-Formation."  , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 5	-	Spr�che & Pl�ne sortieren
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 105, Y = 119, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo223", String = "Sie k�nnen bereits verwendete Pl�ne von Geb�uden und Einheiten sowie Zauberspr�che in Ihrem Zauberbuch und auch gelernte Zauberspr�che im Zauber-Ged�chtnis zu einem beliebigen Zeitpunkt umsortieren."  , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo224", String = "Dazu �ffnen Sie Ihr Inventar und klicken z.B. erst einen Zauberspruch an, und dann den zweiten. Da die Geb�ude und Zauberspr�che in der Aktionsleiste in der gleichen Reihenfolge angezeigt werden, kann dies f�r Ihre �bersicht n�tzlich sein."  , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 6	-	Einheiten folgen & bewachen
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 110, Y = 90, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo225", String = "Sie k�nnen eigenen Einheiten den Befehl geben, jemandem zu folgen. Dies ist besonders n�tzlich, wenn Sie sich mit anderen Einheiten in der Verfolgerperspektive bewegen wollen."  , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo226", String = "Selektieren Sie dazu die entsprechenden Einheiten, dr�cken Sie dann die Shift-Taste und klicken Sie mit der rechten Maustaste auf das Ziel, also z.B. Ihren Avatar, dem die Einheiten folgen sollen."  , Color = ColorWhite} },
--		[3] = { SetInfoText{Tag = "TutInfo227", String = "ALTERNATIVE:"  , Color = ColorWhite} },
--		[4] = { SetInfoText{Tag = "TutInfo228", String = "Wenn Sie Einheiten selektieren und dann die 'G'-Taste dr�cken, folgen diese Einheiten Ihrem Avatar automatisch. Dies ist besonders n�tzlich, wenn Sie sich mit einer Gruppe in der Verfolgerperspektive bewegen wollen."  , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 7	-	Rohstoff Regeneration
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 142, Y = 89, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo229", String = "Die Rohstoffe in SpellForce regenerieren sich mit der Zeit. Es kann daher durchaus sinnvoll sein, an einer ersch�pften Aria-Quelle oder an einem abgebauten Erzvorkommen einen oder zwei Handwerker zu belassen."  , Color = ColorWhite} },

}}

---------------------------------------------------------------------------------------------------------------
-- TIP 8	-	Titanen
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 161, Y = 116, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo230", String = "Die m�chtigste Kampfeinheit, die Sie beherrschen k�nnen, sind die Titanen. Jede Aufbaurasse verf�gt �ber einen eigenen Titan."  , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo231", String = "Um den Titan zu erschaffen, m�ssen Sie zun�chst das gro�e Haupthaus der entsprechenden Rasse errichten. Sie k�nnen von einer Rasse nur einen Titan gleichzeitig haben."  , Color = ColorWhite} },
}}

---------------------------------------------------------------------------------------------------------------
-- TIP 9	-	Rassen
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 175, Y = 102, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo232", String = "Au�er mit Menschen k�nnen Sie auf der hellen Seite auch mit Elfen und Zwergen St�dte errichten. Auf der dunklen Seite stehen Ihnen Orks, Trolle und Dunkelelfen zur Verf�gung."  , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo233", String = "In SpellForce k�nnen Sie oft mit mehreren Rassen gleichzeitig eine Stadt errichten. Wenn Sie sich f�r eine helle und eine dunkle Rasse gleichzeitig entscheiden, m�ssen Sie darauf achten, dass sich die Armeen nicht begegnen..."  , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo234", String = "Die Rohstoff-Vorr�te der dunklen und der hellen Rassen sind getrennt. Untereinander teilen die hellen Rassen ihre Rohstoffe, ebenso die dunklen Rassen."  , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 10	-	Feinde ignorieren
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 203, Y = 91, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo235", String = "Bei dem normalen 'Gehe-Zu'-Kommando werden Feinde unterwegs ignoriert, Ihre Einheiten verteidigen sich erst am Zielort. Sie k�nnen die STRG-Taste gedr�ckt halten und eigenen Einheiten das 'Gehe-Zu'-Kommando mit der rechten Maustaste geben. In diesem Fall werden Feinde auf dem Weg angegriffen."  , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 11	-	Patrulljen & Wegpunkte
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 173, Y = 129, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo236", String = "Wenn Sie die ALT-Taste gedr�ckt halten und eigenen Einheiten ein 'Gehe-Zu'-Kommando mit der rechten Maustaste geben, dann patroullieren Ihre Einheiten zwischen dem aktuellen Standort und dem Zielort."  , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo237", String = "Wenn Sie mehrere Punkte angeben, dann werden diese nacheinander vorw�rts und r�ckw�rts abgelaufen, wobei dann der aktuelle Standort nicht mehr ber�cksichtigt wird."  , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo238", String = "Auf einer Patrouille greifen Ihre Einheiten jeden Feind in Sichtweite an."  , Color = ColorWhite} },
		[4] = { SetInfoText{Tag = "TutInfo239", String = "Wenn Sie die Shift-Taste gedr�ckt halten und eigenen Einheiten ein 'Gehe-Zu'-Kommando mit der rechten Maustaste geben, dann k�nnen Sie Wegpunkte festlegen, die nacheinander abgelaufen werden sollen."  , Color = ColorWhite} },
		[5] = { SetInfoText{Tag = "TutInfo240", String = "Am letzten Wegpunkt bleiben die Einheiten stehen. Mit dieser Methode k�nnen Sie eigene Einheiten um ein feindliches Lager herumschicken ohne st�ndig neue Richtungsangaben geben zu m�ssen."  , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 12	-	Geb�ude rotieren
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 200, Y = 142, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo260", String = "Wenn Sie ein Geb�ude vor dem Platzieren drehen wollen, halten Sie die STRG-Taste gedr�ckt und verwenden Sie danach die Tasten 'ENTF' und 'ENDE', um das Geb�ude links- oder rechtsherum zu drehen."  , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 13	-	Einheitentypen selektieren & zu Selektion hinzuf�gen oder entfernen
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 199, Y = 123, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo241", String = "Wenn Sie die STRG-Taste gedr�ckt halten und eine Einheit selektieren, dann werden alle anderen Einheiten dieses Typs in der Umgebung ebenso selektiert."  , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo242", String = "Diese Funktion kann auch mit den Portr�t-Buttons des Avatars, der Helden oder der Gruppen verwendet werden."  , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo243", String = "Wenn Sie die Shift-Taste gedr�ckt halten und eine oder mehrere Einheiten selektieren, dann werden diese Einheiten der aktuellen Selektion hinzugef�gt oder von ihr entfernt."  , Color = ColorWhite} },
		[4] = { SetInfoText{Tag = "TutInfo244", String =  "Diese Funktion kann auch mit den Portr�t-Buttons des Avatars, der Helden oder der Gruppen verwendet werden." , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 14	-	Diener (Pets)
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 220, Y = 127, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo261", String = "Einige Zauberspr�che erlauben das Herbeirufen von sogenannten Dienern, die dem Magier treu ergeben sind und ihn im Kampf unterst�tzen. Ein Magier kann auch mehrere Diener gleichzeitig herbeirufen."  , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo262", String = "Diese Diener kosten den Magier allerdings dauerhaft eine geringe Menge Mana, wodurch sich die Regeneration von Mana verlangsamt oder der Magier sogar st�ndig Mana verliert. Wenn dem Magier kein Mana mehr zur Verf�gung steht, sterben die Diener."  , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 15	-	Doppel-Selektion
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 236, Y = 142, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo245", String = "Wenn Sie mehrere Einheiten selektiert haben, k�nnen Sie unten links im Selektionsfenster einzelne Einheiten bzw. Einheitentypen anklicken und sie damit 'doppelt selektieren'."  , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo246", String = "Wenn Sie jetzt weitere Kommandos geben, z.B. die Einheit an einen anderen Ort schicken, dann gilt dieses Kommando nur f�r die 'doppelt selektierten' Einheiten."  , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo247", String = "Diese Methode ist sehr komfortabel, um z.B. bestimmte Einheiten aus dem Kampf zu ziehen oder mit 'Click&Fight' sehr schnell gezielt verwundete Einheiten zu heilen."  , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 16	-	Monument Symbol
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 260, Y = 122, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo248", String = "In der Aktionsleiste befindet sich auch ein Monument-Symbol. Wenn Sie es mit der linken Maustaste anklicken, k�nnen Sie sehr schnell und ohne den Ort zu wechseln Ihre Monumente nacheinander selektieren und neue Einheiten produzieren."  , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo249", String = "Wenn Sie das Monument-Symbol mit der rechten Maustaste anklicken, dann werden die Monumente nacheinander fokussiert, d.h. der sichtbare Bildausschnitt bewegt sich zu dem Monument."  , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 17	-	Tech Tree Geb�ude & Tech Tree Einheiten
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 246, Y = 95, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo250", String = "Einige Geb�ude k�nnen Sie bereits bei Spielstart errichten, andere ben�tigen vorher das kleine, mittlere oder das gro�e Haupthaus. Sie finden entsprechende Hinweise jeweils im Hilfe-Fenster."  , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo251", String = "Einheiten ben�tigen je nach Typ unterschiedliche Geb�ude, um herbeigerufen werden zu k�nnen."  , Color = ColorWhite} },
		[3] = { SetInfoText{Tag = "TutInfo252", String = "Au�er den erforderlichen Rohstoffen ben�tigen Sie je nach Rasse eine Schmiede f�r Stahlwaffen und Metallr�stungen, eine Waffenwerkstatt f�r Holzwaffen und Leder-R�stungen oder ein Magie-Geb�ude f�r Einheiten mit magischen F�higkeiten."  , Color = ColorWhite} },
		[4] = { SetInfoText{Tag = "TutInfo253", String = "Einige Einheiten ben�tigen weitere Spezialgeb�ude. Sie finden entsprechende Hinweise jeweils im Hilfe-Fenster."  , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 18	-	XP Threshold
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 230, Y = 94, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo263", String = "Je �fter Sie einen bestimmten Gegnertyp besiegen, desto weniger Erfahrungspunkte erhalten Sie daf�r. Neue Gegnertypen bringen besonders viele Erfahrungspunkte."  , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 19	-	Proc Waffen
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 308, Y = 91, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo254", String = "Einige seltene Waffen verf�gen �ber Zaubereffekte. Diese Effekte k�nnen nicht gezielt ausgel�st werden, sie entfesseln ihre Kraft im Kampf in zuf�lligen Zeitabst�nden."  , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo255", String = "Es sind dabei sehr unterschiedliche Effekte m�glich, z.B. gibt es Waffen mit zus�tzlichem Feuereffekt oder andere, die dem Feind Lebenspunkte entziehen und dem Besitzer hinzuf�gen."  , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 20	-	schnelle Feindselektion
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 341, Y = 106, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo256", String = "Wenn Sie die TAB-Taste dr�cken, wird automatisch der st�rkste Feind im sichtbaren Bildausschnitt selektiert. Wenn Sie erneut TAB dr�cken, werden alle sichtbaren Feinde nacheinander selektiert."  , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo257", String = "So k�nnen Sie sehr schnell feindliche Ziele w�hlen, z.B. f�r das 'Click&Fight'-System."  , Color = ColorWhite} },
}}
---------------------------------------------------------------------------------------------------------------
-- TIP 21	-	Abbruch Einheitenbau
---------------------------------------------------------------------------------------------------------------
TutorialStateNum = TutorialStateNum + 1
NewState{ Name = "TutorialTip#" .. TutorialStateNum }
AddTransition{ From = "_IDLE", To = "TutorialTip#" .. TutorialStateNum, RemoveTransitionAfterUse = TRUE,
	Conditions = {	IsGlobalFlagTrue{Name = "OpenDoor" .. _NpcId, UpdateInterval = 50},
					FigureInRange{NpcId = Avatar, X = 315, Y = 103, Range = TippRange} }, }
TutorialTextFlow{ From = "TutorialTip#" .. TutorialStateNum, To = "_IDLE", Actions = {
		[1] = { SetInfoText{Tag = "TutInfo258", String = "Sie k�nnen bereits in Auftrag gegebene Einheiten an einem Monument nachtr�glich wieder entfernen oder �ndern."  , Color = ColorWhite} },
		[2] = { SetInfoText{Tag = "TutInfo259", String = "Selektieren Sie dazu das Monument und klicken Sie unten links im Selektionsfenster auf die aktuell in Produktion befindliche Einheit oder auf Einheiten in der Warteschlage, um sie zu entfernen."  , Color = ColorWhite} },
}}

EndDefinition()
end
     