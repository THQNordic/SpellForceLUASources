---- P207_Raven_Pass --
----OnToggleEvent
----{
----		UpdateInterval = 60,
----		OnConditions = { TimeNightExtended() },
----		OnActions = { 
----						SetEffect = {Effect = Torch, X = 171, Y = 305},
----						SetEffect = {Effect = Torch, X = 175, Y = 305},
----						SetEffect = {Effect = Torch, X = 180, Y = 305},
----						SetEffect = {Effect = Torch, X = 190, Y = 305},
----						SetEffect = {Effect = Torch, X = 190, Y = 299},
----						SetEffect = {Effect = Torch, X = 186, Y = 299},
----						SetEffect = {Effect = Torch, X = 182, Y = 299},
----						SetEffect = {Effect = Torch, X = 178, Y = 299},
----						SetEffect = {Effect = Torch, X = 174, Y = 299},
----						SetEffect = {Effect = Torch, X = 170, Y = 299},
----						SetEffect = {Effect = Torch, X = 166, Y = 299},
----					},              
----					
----		OffConditions = { TimeDay() },
----		OffActions = { 
----						StopEffect{X = 171, Y = 305},
----						StopEffect{X = 175, Y = 305},
----						StopEffect{X = 180, Y = 305},
----						StopEffect{X = 190, Y = 305},
----						StopEffect{X = 190, Y = 299},
----						StopEffect{X = 186, Y = 299},
----						StopEffect{X = 182, Y = 299},
----						StopEffect{X = 178, Y = 299},
----						StopEffect{X = 174, Y = 299},
----						StopEffect{X = 170, Y = 299},
----						StopEffect{X = 166, Y = 299},
----					},
----}                       
--Fackelfeuer             
--{	                    
-- -- Erste Festung       
--                        
-- 	-- Fackeln um die mittleren Geb?ude
---- 	Festung001 = { X = 171, Y = 305, When = NightOnly},
---- 	Festung002 = { X = 175, Y = 305, When = NightOnly},
---- 	Festung003 = { X = 180, Y = 305, When = NightOnly},
---- 	Festung004 = { X = 190, Y = 305, When = NightOnly},
---- 	Festung005 = { X = 190, Y = 299, When = NightOnly},
---- 	Festung006 = { X = 186, Y = 299, When = NightOnly},
---- 	Festung007 = { X = 182, Y = 299, When = NightOnly},
---- 	Festung008 = { X = 178, Y = 299, When = NightOnly},
---- 	Festung009 = { X = 174, Y = 299, When = NightOnly},
---- 	Festung010 = { X = 170, Y = 299, When = NightOnly},
---- 	Festung011 = { X = 166, Y = 299, When = NightOnly},
-- 	
-- 	-- Fackeln vor beiden Aufg?ngen
-- 	Festung012 = { X = 139, Y = 307, When = NightOnly},
-- 	Festung013 = { X = 139, Y = 301, When = NightOnly},
-- 	Festung014 = { X = 179, Y = 274, When = NightOnly},
-- 	Festung015 = { X = 185, Y = 274, When = NightOnly},
-- 	
-- 	-- Fackeln vor Gef?ngnis
-- 	Festung016 = { X = 159, Y = 280, When = NightOnly},
-- 	Festung017 = { X = 154, Y = 285, When = NightOnly},
-- 	
-- -- Zweite Festung
-- 
--	-- Fackeln an beiden Aufg?ngen
--	Festung018 = { X = 396, Y = 284, When = NightOnly},
--	Festung019 = { X = 396, Y = 278, When = NightOnly},
--	Festung020 = { X = 406, Y = 251, When = NightOnly},
--	Festung021 = { X = 406, Y = 245, When = NightOnly},
--	
--	-- Fackeln im Gang(Eingang)
--	Festung047 = { X = 396, Y = 314, When = NightOnly},
--	Festung048 = { X = 396, Y = 309, When = NightOnly},
--	Festung049 = { X = 396, Y = 304, When = NightOnly},
--	Festung050 = { X = 396, Y = 299, When = NightOnly},
--	Festung051 = { X = 396, Y = 294, When = NightOnly},
--	Festung052 = { X = 396, Y = 289, When = NightOnly},
--	Festung053 = { X = 396, Y = 273, When = NightOnly},
--	Festung054 = { X = 396, Y = 268, When = NightOnly},
--	
--	-- Fackeln im Gang(Ausgang)
--	Festung055 = { X = 406, Y = 256, When = NightOnly},
--	Festung055 = { X = 406, Y = 240, When = NightOnly},
--	
--	-- Innenhof/Aufbau
--		-- Objektgeb?ude
--		Festung021 = { X = 407, Y = 292, When = NightOnly},
--		Festung022 = { X = 407, Y = 298, When = NightOnly},
--		Festung023 = { X = 407, Y = 304, When = NightOnly},
--				
--		-- Schwarze Schule
--		Festung024 = { X = 405, Y = 312, When = NightOnly},
--		Festung025 = { X = 413, Y = 312, When = NightOnly},
--		
--		-- Arkanum
--		Festung026 = { X = 416, Y = 303, When = NightOnly},
--		Festung027 = { X = 416, Y = 298, When = NightOnly},
--		
--		-- Onyxturm
--		Festung028 = { X = 432, Y = 291, When = NightOnly},
--		
--		-- Onyxschrein
--		Festung029 = { X = 445, Y = 287, When = NightOnly},
--		
--		-- Mondsilberwerkstatt
--		Festung030 = { X = 443, Y = 272, When = NightOnly},
--		
--		-- Mondsilbermine
--		Festung031 = { X = 449, Y = 268, When = NightOnly},
--		
--		-- DE-Monument
--		Festung032 = { X = 457, Y = 258, When = NightOnly},
--		Festung033 = { X = 452, Y = 251, When = NightOnly},
--		
--		-- Geb?udezerst?rer
--		Festung034 = { X = 445, Y = 249, When = NightOnly},
--		
--		-- Schmelze
--		Festung035 = { X = 435, Y = 248, When = NightOnly},
--		Festung036 = { X = 432, Y = 245, When = NightOnly},
--		
--		-- Mine
--		Festung037 = { X = 428, Y = 238, When = NightOnly},
--		
--		-- Schmiede
--		Festung038 = { X = 423, Y = 236, When = NightOnly},
--		
--		-- Schwarmgeb?ude
--		Festung039 = { X = 415, Y = 238, When = NightOnly},
--		Festung040 = { X = 415, Y = 242, When = NightOnly},
--		
--		-- Nahrungslager
--		Festung041 = { X = 428, Y = 260, When = NightOnly},
--		Festung042 = { X = 428, Y = 266, When = NightOnly},
--		
--		-- Z?chter
--		Festung043 = { X = 416, Y = 263, When = NightOnly},
--		Festung044 = { X = 412, Y = 263, When = NightOnly},
--		
--		-- Gro?es Haupthaus
--		Festung045 = { X = 421, Y = 278, When = NightOnly},
--		Festung046 = { X = 421, Y = 284, When = NightOnly},
--		
--		
---- Dritte Festung
--
--	-- Fackeln am Eingang
--	Festung055 = { X = 142, Y = 212, When = NightOnly},
--	Festung056 = { X = 142, Y = 206, When = NightOnly},
--	Festung057 = { X = 142, Y = 200, When = NightOnly},
--	Festung058 = { X = 142, Y = 195, When = NightOnly},
--	Festung059 = { X = 142, Y = 190, When = NightOnly},
--	
--	-- Fackeln am Ausgang
--	Festung060 = { X = 142, Y = 145, When = NightOnly},
--	Festung061 = { X = 142, Y = 150, When = NightOnly},
--	Festung062 = { X = 142, Y = 155, When = NightOnly},
--	Festung063 = { X = 142, Y = 160, When = NightOnly},
--	
--	-- Fackeln an den Aufg?ngen
--	Festung064 = { X = 136, Y = 172, When = NightOnly},
--	Festung065 = { X = 136, Y = 179, When = NightOnly},
--	Festung066 = { X = 129, Y = 173, When = NightOnly},
--	Festung067 = { X = 129, Y = 178, When = NightOnly},
--	Festung068 = { X = 123, Y = 173, When = NightOnly},
--	Festung069 = { X = 123, Y = 178, When = NightOnly},
--	
--	-- Fackeln im Stealthpart
--	Festung066 = { X = 85, Y = 125, When = NightOnly},
--	Festung067 = { X = 90, Y = 125, When = NightOnly},
--	Festung068 = { X = 95, Y = 125, When = NightOnly},
--	Festung069 = { X = 85, Y = 131, When = NightOnly},
--	Festung070 = { X = 90, Y = 131, When = NightOnly},
--	Festung071 = { X = 95, Y = 131, When = NightOnly},
--	
--	Festung072 = { X = 96, Y = 113, When = NightOnly},
--	Festung073 = { X = 101, Y = 115, When = NightOnly},
--	Festung074 = { X = 114, Y = 113, When = NightOnly},
--	Festung075 = { X = 122, Y = 121, When = NightOnly},
--	Festung076 = { X = 120, Y = 126, When = NightOnly},
--	Festung077 = { X = 112, Y = 128, When = NightOnly},
--	Festung078 = { X = 106, Y = 128, When = NightOnly},
--	Festung079 = { X = 96, Y = 143, When = NightOnly},
--	Festung080 = { X = 101, Y = 141, When = NightOnly},
--	Festung081 = { X = 117, Y = 141, When = NightOnly},
--	Festung082 = { X = 122, Y = 143, When = NightOnly},
--	
--	-- Fackeln in der Festung
--	Festung082 = { X = 85, Y = 144, When = NightOnly},
--	Festung083 = { X = 85, Y = 151, When = NightOnly},
--	Festung084 = { X = 85, Y = 158, When = NightOnly},
--	Festung085 = { X = 85, Y = 165, When = NightOnly},
--	
--	Festung086 = { X = 98, Y = 170, When = NightOnly},
--	Festung087 = { X = 108, Y = 170, When = NightOnly},
--	
--	Festung088 = { X = 113, Y = 170, When = NightOnly},
--	Festung089 = { X = 113, Y = 181, When = NightOnly},
--	
--	
--	
--	
--}
--
Lagerfeuer
{
 Riese = { X = 349, Y = 452, When = Always},
}