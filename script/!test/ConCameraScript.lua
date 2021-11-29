-- this is a sample camera script
-- just do a dofile("script\\concamerascript.lua")
-- from the console to watch it running

-- funktionen einbinden die auch fürs GDS verwendet werden:
dofile("script/GdsCameraHelper.lua")


function DumpCameraPosition()
	x,y,z = Camera:GetPosition(0,0,0)
	Application:Log(format("    AddMoveTo(3,4,  %4d, %4d, %5.1f),", x,y,z))
end

function DumpCameraEyeCenter()
	x,y,z = Camera:GetEyeCenter(0,0,0)
	Application:Log(format("    AddLookAt(3,4,  %4d, %4d, %5.1f),", x,y,z))
end

CreateCameraFunction
{
	Name = "SvenTestKamera",
	Script =
	{
	CameraReset(),
	

AddLookAt(1,0,  127.4, 170.8,  22.0),

AddMoveTo(1,0,  127.9, 188.0,  26.1),

AddLookAt(6,6,  133.0, 169.4,  22.0),

AddMoveTo(6,6,  129.6, 186.9,  26.1),



	CameraStart(),
	}
}

-- cam abspielen
SvenTestKamera()


REM = [[
UiCreateGlobalShortcut
	{
		kMnu_kmCONTROL,
		INP_Keyboard.KC_K,
		"DumpCameraPosition",
		kMnu_scDebug,
		"Dumps camera moveto script command to log file"
	}

UiCreateGlobalShortcut
	{
		kMnu_kmCONTROL + kMnu_kmSHIFT,
		INP_Keyboard.KC_K,
		"DumpCameraEyeCenter",
		kMnu_scDebug,
		"Dumps camera lookat script command to log file"
	}
]]

--	Die Bedeutung der Parameter sind für jedes Ziel identisch:
--	- Beginn der Gültigkeit des Ziels
--	- Ende der Gültigkeit des Ziels
--	- Wie schnell soll sich die Kamera auf das Ziel einpendeln. (= Duration)
--	- X Koordinate (Weltcoordinate also in Metern)
--	- Y Koordinate (Weltcoordinate also in Metern)
--	- Z Koordinate (Weltcoordinate also in Metern)

--	AddLookAt: Bestimmt den Punkt, den die Kamera fixieren soll
--	AddMoveTo: Bestimmt die Position, den die Kamera einnehmen soll.

