-- GdsCreateDoc HTML doc generator needs these:
numdoc = 1
doc = {}

-- some handy time conversion functions
-- hms(h,m,s) convert hms to internal time format, returns value in range 0.0 to 1.0
-- randhms(h,m,s) wie hms(), nur rückgabe ist zufällige zeit zwischen 00:00:00 und h:m:s
-- time2hms(time) convert time in range 0.0 to 1.0 back to hms format (return value is a table)
-- time2hms2str(time) same as above, but returns a properly formatted string (HH:MM:SS)
-- hms2str(h,m,s) returns hms as a properly formatted string HH:MM:SS

-- **DOC** -------------------------------------------------------------------------------
function hms(h, m, s)
	local FuncName = "GDS: hms(): "
	assert2(h, FuncName .. "MISSING PARAMETER")
	assert2(h < 24, FuncName .. "INVALID PARAMETER #1 (HOUR): not a value from 0 to 23")
	if (m) then	assert2(m < 60, FuncName .. "INVALID PARAMETER #2 (MINUTE): not a value from 0 to 59") end
	if (s) then assert(s < 60, FuncName .. "INVALID PARAMETER #3 (SECOND): not a value from 0 to 59") end
	s = s or 0
	m = m or 0

	-- return wert 0.0 bis 1.0 (0.5 == mittag)
	return (s + 60 * (m + 60 * h))  		-- 86400 = 24 * 60 * 60
end

doc[numdoc] = [[Nützliche Funktion um Uhrzeiten in internes Format zu wandeln. h = Stunde, m = Minute (optional), s = Sekunde (optional).]]
doc[numdoc] = nil
numdoc = numdoc + 1

-- **DOC** -------------------------------------------------------------------------------
function randhms(h, m, s)
	local FuncName = "GDS: randhms(): "
	assert2(h, FuncName .. "MISSING PARAMETER")
	assert2(h < 24, FuncName .. "INVALID PARAMETER #1 (HOUR): not a value from 0 to 23")
	if (m) then	assert2(m < 60, FuncName .. "INVALID PARAMETER #2 (MINUTE): not a value from 0 to 59") end
	if (s) then assert(s < 60, FuncName .. "INVALID PARAMETER #3 (SECOND): not a value from 0 to 59") end
	s = s or 0
	m = m or 0
	
	local hr, mr, sr = 0, 0, 0
	
	if (h ~= 0) then 
		hr = random(0, h)
		if (m ~= nil) then	mr = random(0, m)	else	mr = random(0, 59)	end
		if (s ~= nil) then	sr = random(0, m)	else	sr = random(0, 59)	end
	elseif (m ~= 0) then
		mr = random(0, m)
		if (s ~= nil) then	sr = random(0, m)	else	sr = random(0, 59)	end
	elseif (s ~= 0) then
		sr = random(0, s)
	end
	
	-- return wert 0.0 bis 1.0 (0.5 == mittag)
	return hms(hr, mr, sr)
end

doc[numdoc] = [[Wie hms(), nur das diese Funktion eine zufällige Uhrzeit zwischen 00:00:00 und h,m,s zurückliefert. Die Funktion sollte für DailyJobs möglichst auf eine hms() Zeit draufaddiert werden, damit nicht versehentlich die Reihenfolge der Uhrzeiten der ControlPoints durcheinander kommt.]]
doc[numdoc] = nil
numdoc = numdoc + 1

---------------------------------------------------------------------------------
function time2hms(time)
	assert(time ~= nil)
	
	-- time ist ein wert 0.0 bis 1.0 (0.5 == mittag)
	local hms2 = {}
	local t = time * 86400

	if t == 0 then
		hms2.h = 0
		hms2.m = 0
		hms2.s = 0
		return hms2
	end

	hms2.h = floor(t / 3600)
	t = t - 3600 * hms2.h
	hms2.m = floor(t / 60)
	t = t - 60 * hms2.m

	-- use either floor or ceil for better accuracy as there can be minor
	-- floating point flaws leading to seconds being off by 1 second
	local tfloor = t - floor(t)
	local tceil = ceil(t) - t
	if (tfloor < tceil) then
		hms2.s = floor(t)
		if (hms2.s < 0) then
			hms2.s = hms2.s + 60
			hms2.m = hms2.m - 1
			if (hms2.m < 0) then 
				hms2.h = hms2.h - 1 
			end
		end
	else
		hms2.s = ceil(t)
		if (hms2.s >= 60) then
			hms2.s = hms2.s - 60
			hms2.m = hms2.m + 1
			if (hms2.m >= 60) then
				hms2.h = hms2.h + 1
			end
		end
	end

	return hms2
end

---------------------------------------------------------------------------------
function time2hms2str(time)
	assert(time ~= nil)

	-- time ist ein wert 0.0 bis 1.0 (0.5 == mittag)
	local hms2 = {}
	hms2 = time2hms(time)

	return hms2str(hms2.h, hms2.m, hms2.s)	
end

---------------------------------------------------------------------------------
function hms2str(h, m, s)
	h = h or 0
	m = m or 0
	s = s or 0
	local str = ""

	if (h < 10) then
		str = "0" .. tostring(h)
	else
		str = tostring(h) 
	end
	if (m < 10) then 
		str = str .. ":0" .. tostring(m)
	else 
		str = str .. ":" .. tostring(m) 
	end
	if (s < 10) then
		str = str .. ":0" .. tostring(s)
	else
		str = str .. ":" .. tostring(s) 
	end
	
	return str
end

-- **DOC** -------------------------------------------------------------------------------
function Dawn()
	return hms(3, 30)
end
doc[numdoc] = [[Beginn der Morgendämmerung (Dawn) im hms() Format. Dawn ist definiert als 03:30 Uhr morgens.]]
doc[numdoc] = nil
numdoc = numdoc + 1
-- **DOC** -------------------------------------------------------------------------------
function ForeNoon()
	return hms(5, 0)
end
doc[numdoc] = [[Beginn des Vormittags im hms() Format. Vormittag ist definiert als 05:00 Uhr morgens.]]
doc[numdoc] = nil
numdoc = numdoc + 1
-- **DOC** -------------------------------------------------------------------------------
function BreakFast()
	return hms(7, 30)
end
doc[numdoc] = [[Beginn der Frühstückszeit im hms() Format. Frühstück findet immer ab 07:30 Uhr morgens statt.]]
doc[numdoc] = nil
numdoc = numdoc + 1
-- **DOC** -------------------------------------------------------------------------------
function Noon()
	return hms(11, 0)
end
doc[numdoc] = [[Beginn der Mittagszeit im hms() Format. Mittag ist definiert als 11:00 Uhr.]]
doc[numdoc] = nil
numdoc = numdoc + 1
-- **DOC** -------------------------------------------------------------------------------
function AfterNoon()
	return hms(13, 0)
end
doc[numdoc] = [[Beginn der Nachmittagzeit im hms() Format. Nachmittag ist definiert als 13:00 Uhr.]]
doc[numdoc] = nil
numdoc = numdoc + 1
-- **DOC** -------------------------------------------------------------------------------
function TeaTime()
	return hms(15, 30)
end
doc[numdoc] = [[Beginn der Tee-Zeit am Nachmittag im hms() Format. Tee-Zeit ist immer ab 15:30 Uhr.]]
doc[numdoc] = nil
numdoc = numdoc + 1
-- **DOC** -------------------------------------------------------------------------------
function Dusk()
	return TimeBetween(19, 0)
end
doc[numdoc] = [[Beginn des Sonnenuntergangs (Dusk) im hms() Format. Dusk ist definiert als 19:00 Uhr abends.]]
doc[numdoc] = nil
numdoc = numdoc + 1
-- **DOC** -------------------------------------------------------------------------------
function Night()
	return hms(20, 30)
end
doc[numdoc] = [[Beginn der Nacht im hms() Format. Nacht ist definiert als 20:30 Uhr abends.]]
doc[numdoc] = nil
numdoc = numdoc + 1
-- **DOC** -------------------------------------------------------------------------------
function MidNight()
	return hms(0, 0)
end
doc[numdoc] = [[Geisterstunde um Mitternacht! Natürlich im hms() Format. Mitternacht ist definiert als 00:00 Uhr. Buuuuh-huuuuh! *rassel*]]
doc[numdoc] = nil
numdoc = numdoc + 1
