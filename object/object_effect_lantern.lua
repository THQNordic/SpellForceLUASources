local fireparticle = CombineParticles{ratio=0.4, flic1=flics.smoke, color1={1,0.5,0,1}, color2={1,1,0.6,1}}

Fire{size2=0.5, time=2, particles=11, color1={1,1,1,1}, color2={1,0,0,0}, ground=0.1, width=0.3, top=0.5, size=3, height=2.5}
local fire = NewObject{subobject=fireparticle, movie=pMovie}

Smoke{wind={1,0,0}, particles=15, offset={0,0,2}, velocity={1,0,15}, gravity={0,0,0}, time=3, growth=2, color2={0.1,0.1,0.1,0}, color1={0.4,0.4,0.4,0.3}, colorplay=kDrwPlayLooped}
Scale{min=2}
local smoke = NewObject{billboard=flics.plasma, movie=pMovie, restriction=kDrwCsWorld}

LightMovie{offset={0,0,2}, size=8, deviation=0.2, color={0.8,0.5,0.2,0}}
local radiosity = Radiosity{movie=pMovie}

NewMovie()
Translation{min={0,0,0.2}}
Scale{min=0.1}
NewObject{subobject={smoke, fire, radiosity}, movie=pMovie, boundingradius=20}
EffectSave("Campfire")

-------------------- torch 1
NewMovie()
Translation{min={0,0,2.3}}
Scale{min=0.1}
NewObject{subobject={fire, radiosity}, movie=pMovie, boundingradius=20}
EffectSave("Torch2")


Smoke{wind={1,0,0}, particles=15, offset={0,0,2.2}, velocity={0.5,0,2}, gravity={0,0,0}, time=2, growth=1, color2={0.5,0.5,0.5,0}, color1={0,0,0,0.6}, colorplay=kDrwPlayLooped}
Clamp{range=3, fadein=1, fadeout=1.5}
Scale{min=0.3}
local smoke = NewObject{billboard=flics.plasma, movie=pMovie, restriction=kDrwCsWorld}
EffectSave("Torch2Off")

-------------------- torch 2
NewMovie()
Translation{min={0,0,2.15}}
Scale{min=0.1}
NewObject{subobject={fire, radiosity}, movie=pMovie, boundingradius=20}
EffectSave("Torch")


Smoke{wind={1,0,0}, particles=15, offset={0,0,2.05}, velocity={0.5,0,2}, gravity={0,0,0}, time=2, growth=1, color2={0.5,0.5,0.5,0}, color1={0,0,0,0.6}, colorplay=kDrwPlayLooped}
Clamp{range=3, fadein=1, fadeout=1.5}
Scale{min=0.3}
local smoke = NewObject{billboard=flics.plasma, movie=pMovie, restriction=kDrwCsWorld}
EffectSave("TorchOff")

-------------------- torch 3
NewMovie()
Translation{min={0,0,2.3}}
Scale{min=0.1}
NewObject{subobject={fire, radiosity}, movie=pMovie, boundingradius=20}
EffectSave("Torch3")


Smoke{wind={1,0,0}, particles=15, offset={0,0,2.2}, velocity={0.5,0,2}, gravity={0,0,0}, time=2, growth=1, color2={0.5,0.5,0.5,0}, color1={0,0,0,0.6}, colorplay=kDrwPlayLooped}
Clamp{range=3, fadein=1, fadeout=1.5}
Scale{min=0.3}
local smoke = NewObject{billboard=flics.plasma, movie=pMovie, restriction=kDrwCsWorld}
EffectSave("Torch3Off")


----------------------------------------------------------------- portal keep torches
NewMovie()
Scale{min=0.1}
local torch = NewObject{subobject=fire, movie=pMovie}

lTorch = Position{object = torch, positions = {
{1.65,1.7,4.5}, {5.35,1.7,4.5}, 
{1.65,-2.25,4.5}, {5.35,-2.25,4.5}, 
{0.75,-2.25,2.0}, {6.25,-2.25,2.0}, 
}}

NewObject{subobject=lTorch, boundingradius=20}
EffectSave("SmallGateTorch")


lTorch = Position{object = torch, positions = {
{2.65,2.7,7.2}, {8.6,2.7,7.2}, 
{2.65,-3.55,7.2}, {8.6,-3.55,7.2}, 
{1.1,-3.55,3.3}, {10.1,-3.55,3.3}, 
}}

NewObject{subobject=lTorch, boundingradius=20}
EffectSave("GateTorch")


-------------------- Building Light
Fire{time=1, particles=5, size=0.4, size1=2, size2=0.5, ground=0, width=0.2, top=-0.1, height=2, color1={1,0.7,0.2,1}, color2={1,0,0,0.1}, path=kDrwPathParabola}
local fire = NewObject{billboard=flics.smoke, movie=pMovie}
EffectSave("TestFire")

--human
LightMovie{offset={0,0,-0.5}, size=3.1, deviation=0, flicker=0, color={0.7,0.4,0.0,0.1}}
PowerScale{powerscale=1}
local radiosity = Radiosity{movie=pMovie}


local day = NewObject{mesh=flics.lantern_human}
local night = NewObject{mesh=flics.lantern_human, subobject=radiosity}

NewMovie(2)
Choose{dim=kDrwDimPower}
NewObject{subobject={day, night}, movie=pMovie, boundingradius=20}
EffectSave("BuildingLightHuman")


--dwarf
LightMovie{offset={-0.2,0,-0.5}, size=1.4, deviation=0, flicker=0, color={0.7,0.4,0.7,0.05}}
PowerScale{powerscale=1}
local radiosity = Radiosity{movie=pMovie, billboard=flics.lightblend1}

local day = NewObject{mesh=flics.lantern_dwarf}
local night = NewObject{mesh=flics.lantern_dwarf, subobject=radiosity}

NewMovie(2)
Choose{dim=kDrwDimPower}
NewObject{subobject={day, night}, movie=pMovie, boundingradius=20}
EffectSave("BuildingLightDwarf")

--elf
LightMovie{offset={0.23,0,-0.55}, size=1.4, deviation=0, flicker=0, color={0.5,0.5,0.6,1}}
PowerScale{powerscale=1}
local radiosity = Radiosity{movie=pMovie, billboard=flics.lightblend1, scale=0}

LightMovie{offset={0.23,0,-0.55}, size=1.4, deviation=0.01, flicker=0.2, color={1,1,1,0.3}}
PowerScale{powerscale=1}
Scale{min=0.1}
local glow = NewObject{billboard=flics.lightblend1, movie=pMovie}

local day = NewObject{mesh=flics.lantern_elf}
local night = NewObject{mesh=flics.lantern_elf, subobject={radiosity, glow}}

NewMovie(2)
Choose{dim=kDrwDimPower}
NewObject{subobject={day, night}, movie=pMovie, boundingradius=20}
EffectSave("BuildingLightElf")

-- Orc/Troll
LightMovie{offset={0,0,0}, size=1.7, deviation=0.1, flicker=2, color={0.8,0.5,0.2,0.1}}
local radiosity = Radiosity{movie=pMovie, billboard=flics.lightblend2}


NewMovie()
Translation{min={0.4,0,-0.35}}
Rotation{axis="y", min=90, direction=0}
PowerScale{powerscale=1}
local light = NewObject{subobject={fire, radiosity}, movie=pMovie, boundingradius=20}

local day = NewObject{mesh=flics.lantern_orc}
local night = NewObject{mesh=flics.lantern_orc, subobject=light}

NewMovie(2)
Choose{dim=kDrwDimPower}
NewObject{subobject={day, night}, movie=pMovie, boundingradius=20}
EffectSave("BuildingLightOrc")
EffectSave("BuildingLightTroll")


--darkelf
LightMovie{offset={0.25,0,-0.55}, size=1.4, deviation=0, flicker=0, color={0.5,0.2,0.2,0.7}}
PowerScale{powerscale=1}
local radiosity = Radiosity{movie=pMovie, billboard=flics.lightblend1, scale=0}

LightMovie{offset={0.25,0,-0.55}, size=1.4, deviation=0, flicker=0, color={1,0.5,1,0.2}}
PowerScale{powerscale=1}
Scale{min=0.2}
local glow = NewObject{billboard=flics.lightblend1, movie=pMovie}

local day = NewObject{mesh=flics.lantern_darkelf}
local night = NewObject{mesh=flics.lantern_darkelf, subobject={radiosity, glow}}

NewMovie(2)
Choose{dim=kDrwDimPower}
NewObject{subobject={day, night}, movie=pMovie, boundingradius=20}
EffectSave("BuildingLightDarkelf")




---------------------------------------------- temple of light
local temple = NewObject{mesh=flics.temple}

NewMovie()
Translation{min={0,-2.5,2}}
Rotation{}
local crystal = NewObject{mesh=flics.templecrystal, movie=pMovie}
EffectSave("Temple")
NewObject{subobject={temple,crystal}}

---------------------------------------------- soulforger fountain
local temple = NewObject{mesh=flics.sf_fountain}

NewMovie()
Translation{min={0,0,2}}
Rotation{}
local crystal = NewObject{mesh=flics.sf_crystal, movie=pMovie}
EffectSave("SoulforgerCrystal")

local crystal = NewObject{mesh=flics.sf_crystalgreen, movie=pMovie}
EffectSave("SoulforgerCrystalGreen")



NewObject{subobject={temple,crystal}}
