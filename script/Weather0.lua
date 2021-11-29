return { "Clear",
{	-- Sonnenaufgang
	angle={0},
	
	-- Landschaft
	brightness={2},	-- Gesamthelligkeit, 1=neutral, 2=überstrahlt.
	bump={-0.001,1},  	-- Modifikator für Kontrast auf Landschaft, abhängig von Sonnenwinkel.
	blur={5.0}, 		-- Schattenkante
	ratio={-0.05}, 		-- Verhältnis von diffusem Himmelslicht zu direktem Sonnen-/Mondlicht auf der Landschaft
	mapsun={150, 150, 225},	-- Farbe des Sonnenlichtes auf der Landschaft
	mapsky={90, 90, 90},	-- Farbe des diffusen Himmelslichtes auf der Landschaft
	
	-- Himmel
	skymoon={0, 0, 0},	-- Farbe des Himmels auf der Mondseite
	skysun={160, 180, 255},	-- Farbe des Himmels auf der Sonnenseite
	
	-- Objekte und Figuren
	ambient={130, 130, 130},	-- Farbe des ambienten Lichtes auf den Objekten/Figuren	
	directed={20, 20, 0},		-- Farbe des Sonnen-/Mondlichtes auf den Objekten/Figuren
	
	-- Nebel
	fog={30,100,0.6,350,0.1}, 	-- Definition der Nebelkurve
	fogcolor={150, 150, 150},	-- Farbe des Nebels
	skyfog={4000,1.0},		-- Höhe und Dichte des Nebels am Himmelshorizont
	oceanfog={3000},		-- "Höhe" des Nebels in den Ozean
		
	-- Himmelskörper
	sun={254,216,160,80},		-- Farbe der Sonne und Alpha des Blendens und der Linsenflecken 
	star={255},			-- Alpha der Sterne
	
	-- Wolken
	layermoon={64,64,64}, 		-- Farbe der Wolkendecke vor dem Mond
	layersun={237,197,145},		-- Farbe der Wolkendecke vor der Sonne
},
{	-- 10 Grad nach Sonnenaufgang
	angle={10}, brightness={1.5},
	bump={-2.0, 0.5}, blur={5}, ratio={-0.8}, mapsun={255, 255, 180}, mapsky={90, 90, 90},
	skymoon={ 40, 46,80}, skysun={ 160, 180, 255},
	ambient={120, 120, 120}, directed={255, 255, 180},
	fog={30,100,0.6,350,0.1}, fogcolor={150, 150, 150},	skyfog={4000,1.0},
	sun={254,216,160,80}, star={0},
	layermoon={150,150,150}, layersun={237,197,145},
	oceanfog={3000},
},
{	-- Vormittag, Nachmittag
	angle={45,145}, brightness={1.5},
	bump={-0.3,0.4}, blur={2}, ratio={-1}, mapsun={255, 255, 220}, mapsky={130, 130, 190},
	skymoon={ 31, 70, 179},	skysun={ 150, 200, 255},
	ambient={130, 130, 190}, directed={255, 255, 150},
	fog={30,100,0.8,350,0.3}, fogcolor={210, 220, 255},	skyfog={3000,1.2},
	star={0},	sun={255,255,255,255},
	layermoon={185,185,185}, layersun={255, 255, 255},
	oceanfog={3000},
},
{	-- Mittag
	angle={90}, brightness={1.5},
	bump={-0.05, 0.1}, blur={1.0}, ratio={-1.0}, mapsun={255, 255, 255}, mapsky={150, 150, 250},
	skymoon={ 31, 70, 179},	skysun={ 150, 200, 255},
	ambient={150, 150, 190}, directed={255, 255, 190},
	fog={30,200,0.8,350,0.1}, fogcolor={210, 220, 255},	skyfog={3000,1.2},
	star={0},	sun={255,255,255,255},
	layermoon={220,220,220}, layersun={255, 255, 255},
	oceanfog={3000},
},
{	-- 10 Grad vor Sonnenuntergang
	angle={170}, brightness={1.5},
	bump={-2.0, 0.5}, blur={5},	ratio={-1}, mapsun={255, 150, 100}, mapsky={90, 90, 150},
	skymoon={ 50, 60, 80}, skysun={ 60, 100, 150},
	ambient={120, 120, 200}, directed={255, 100, 0},
	fog={30,100,0.8,350,0.3}, fogcolor={150, 81, 40}, skyfog={4000,1},
	star={50}, sun={255,180,80,150},
	layermoon={200,200,200}, layersun={220, 80, 60},
	oceanfog={3000},
},
{	-- Sonnenuntergang
	angle={180}, brightness={2},
	bump={0,1}, blur={5}, ratio={-0.2},	mapsun={250, 100, 100},	mapsky={80, 80, 80},
	skymoon={ 0, 0, 0},	skysun={ 60, 80, 120},
	ambient={130, 130, 130}, directed={60, 10, 10},
	fog={30,100,0.8,350,0.1}, fogcolor={80, 20, 0},	skyfog={3000,1},
	sun={255,0,0,50}, star={255},	moonaura={180,100,100}, moon={130,0,0},
	layermoon={20,20,40}, layersun={230,50,0},
	oceanfog={3000},
},
{	-- Mitternacht
	angle={270}, brightness={2},
	bump={-0.01, 0.2}, blur={1.0}, ratio={-0.9}, mapsun={100, 100, 255}, mapsky={10, 10, 200},
	skymoon={ 0, 0, 0},	skysun={ 0, 0, 30},
	ambient={120, 120, 255}, directed={120, 120, 255},
	fog={30,100,0.6,350,0.1}, fogcolor={15, 47, 72}, skyfog={3000,1},
	sun={0,0,0,0},
	layermoon={20,20,40}, layersun={30,40,50},
	oceanfog={3000},
},
{	-- 10 Grad nach Sonnenuntergang bzw. vor Sonnenaufgang
	angle={190,350}, brightness={2},
	bump={-2.0, 0.5}, blur={5}, ratio={-0.8}, mapsun={95, 95, 255}, mapsky={60, 60, 100},
	skymoon={ 0, 0, 0}, skysun={ 0, 0, 30}, 
	ambient={80, 80, 130}, directed={100, 120, 255},
	fog={30,100,0.6,350,0.1}, fogcolor={15, 47, 72}, skyfog={3000,1},
	sun={0,0,0,0}, 
	layermoon={70,70,70}, layersun={30,40,50},
	oceanfog={3000},
}
}