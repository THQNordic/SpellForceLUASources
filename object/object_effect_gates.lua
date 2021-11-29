gObjects = {}

----------------------------------- Portal
NewMovie()
Color{min=0.5}
local portal = NewObject{mesh=flics.portal}--, movie=pMovie}

NewMovie(2)
Rotation{dim=kDrwDimParticle}
local ring = NewObject{mesh=flics.ring2, movie=pMovie}

function Wave(start)
	NewMovie()
	Choose{path=kDrwPathRandom, range=100*3, start=start, play=kDrwPlayContinous}
	Scale{max=1, trail=1, range=3, start=start}
	Color{min=0.6, max=0, trail=1, range=3, start=start}
	local wave = NewObject{subobject={%ring, %gNoEffect, %gNoEffect}, movie=pMovie}
	return wave
end

local wave1 = Wave(0)
local wave2 = Wave(1)
local wave3 = Wave(2)

NewMovie(40)
Choose{dim=kDrwDimParticle}
Translation{min={0,0,0.3}, max={0,0,5.5}, dim=kDrwDimParticle, path=kDrwPathRandom}
Translation{min={-1,0,0}, max={1,0,0}, dim=kDrwDimParticle}
Translation{min={0,0.2,0}}
local waves = NewObject{subobject={wave1, wave2, wave3}, movie=pMovie}


NewMovie(2)
Translation{min={-0.2,0,2.95}}
Translation{max={0.4,0,0}, range=5, play=kDrwPlayBounce, path=kDrwPathCosine, trail=2}
Translation{max={0,0,-0.1}, range=7, play=kDrwPlayBounce, path=kDrwPathCosine, trail=2}
Translation{max={0,-0.1,0}, dim=kDrwDimParticle}
Rotation{axis="y", dim=kDrwDimParticle}
Color{min={0.6,0.6,0.6,0.3}}
Scale{min={1.7,1,3}}
local caustic = NewObject{mesh=flics.caustic1, movie=pMovie}

NewMovie(2)
Translation{min={0,0.2,0}}
Rotation{dim=kDrwDimParticle}
local caustic = NewObject{subobject=caustic, movie=pMovie}


NewObject{subobject={caustic, waves}, boundingradius=5}
EffectSave("Portal")


---------------------------------------------------------------- Gate Open/Close

NewMovie(2)
Translation{min={3.5,-1.2,0}}
Translation{min={-2.8,2.8,0}}
Rotation{dim=kDrwDimParticle}
Translation{min={0,1.23,0}}
Translation{max={-1.5,0,0}, play=kDrwPlayClamped, path=kDrwPathCosine, range=5}
Scale{min={1,1,1.02}}
local doors = NewObject{mesh=flics.gate_small_door, movie=pMovie, boundingradius=15, shadow=1}
EffectSave("GateSmallOpen")

NewMovie()
Translation{min={-1.15,-0.4,0}}
Scale{min=1.65}
local doors = NewObject{subobject=doors, movie=pMovie, boundingradius=15, shadow=1}
EffectSave("GateLargeOpen")

--NewObject{mesh=flics.gate_large, subobject=doors}

NewMovie(2)
Translation{min={3.5,-1.2,0}}
Translation{min={-2.8,2.8,0}}
Rotation{dim=kDrwDimParticle}
Translation{min={-1.5,1.23,0}}
Translation{max={1.5,0,0}, play=kDrwPlayClamped, path=kDrwPathCosine, range=5}
Scale{min={1,1,1.02}}
local doors = NewObject{mesh=flics.gate_small_door, movie=pMovie, boundingradius=15, shadow=1}
EffectSave("GateSmallClose")

NewMovie()
Translation{min={-1.15,-0.4,0}}
Scale{min=1.65}
local doors = NewObject{subobject=doors, movie=pMovie, boundingradius=15, shadow=1}

--NewObject{mesh=flics.gate_large, subobject=doors}
EffectSave("GateLargeClose")


---------------------------------------------------------------- Palisadegate Open/Close
local gate = NewObject{mesh=flics.palisadegate}

NewMovie(1)
Translation{min={0,-0.3,0}}
Translation{max={0,0,-6.0}, play=kDrwPlayClamped, path=kDrwPathNegParabola, range=1.5}
local doors = NewObject{mesh=flics.palisadegate_door, movie=pMovie, boundingradius=15, shadow=1}

NewObject{subobject={gate, doors}}
EffectSave("PalisadeOpen")

NewMovie(1)
Translation{min={0,-0.3,0}}
Translation{min={0,0,-6.0}, max={0,0,0}, play=kDrwPlayClamped, path=kDrwPathNegParabola, range=1.5}
local doors = NewObject{mesh=flics.palisadegate_door, movie=pMovie, boundingradius=15, shadow=1}

NewObject{subobject={gate, doors}}
EffectSave("PalisadeClose")
---------------------------------------------------------------- StoneGate Small Open/Close
local gate = NewObject{mesh=flics.stonegate}

NewMovie(1)
Translation{min={3.5,0,0}}
Translation{max={0,0,-4.5}, play=kDrwPlayClamped, path=kDrwPathNegParabola, range=1.5}
local doors = NewObject{mesh=flics.stonegate_door, movie=pMovie, boundingradius=15, shadow=1}
EffectSave("StoneGateSmallOpen")

NewObject{subobject={gate, doors}}

NewMovie(1)
Translation{min={3.5,0,0}}
Translation{min={0,0,-4.5}, max={0,0,0}, play=kDrwPlayClamped, path=kDrwPathCosine, range=3}
local doors = NewObject{mesh=flics.stonegate_door, movie=pMovie, boundingradius=15, shadow=1}
EffectSave("StoneGateSmallClose")


NewObject{subobject={gate, doors}}

---------------------------------------------------------------- StoneGate Large Open/Close
local gate = NewObject{mesh=flics.stonegate}

NewMovie(2)
Translation{max={14.2,0,0}, dim=kDrwDimParticle}
Translation{max={0,0,-4.5}, play=kDrwPlayClamped, path=kDrwPathNegParabola, range=1.5}
local doors = NewObject{mesh=flics.stonegate_door, movie=pMovie, boundingradius=15, shadow=1}
EffectSave("StoneGateLargeOpen")

NewObject{subobject={gate, doors}}

NewMovie(2)
Translation{max={14.2,0,0}, dim=kDrwDimParticle}
Translation{min={0,0,-4.5}, max={0,0,0}, play=kDrwPlayClamped, path=kDrwPathCosine, range=3}
local doors = NewObject{mesh=flics.stonegate_door, movie=pMovie, boundingradius=15, shadow=1}
EffectSave("StoneGateLargeClose")


NewObject{subobject={gate, doors}}


---------------------------------------------------------------- ElfGate Open/Close
local gate = NewObject{mesh=flics.elfgate}

NewMovie(2)
Translation{min={0,1.5,0}}
Rotation{dim=kDrwDimParticle}
Translation{min={0,-1.4,0}}
Translation{max={2,0,0}, play=kDrwPlayClamped, path=kDrwPathCosine, range=5}
local doors = NewObject{mesh=flics.elfgate_door, movie=pMovie, boundingradius=15, shadow=1}

EffectSave("ElfGateOpen")

NewMovie(2)
Translation{min={0,1.5,0}}
Rotation{dim=kDrwDimParticle}
Translation{min={0,-1.4,0}}
Translation{min={2,0,0}, max={0,0,0}, play=kDrwPlayClamped, path=kDrwPathCosine, range=5}
local doors = NewObject{mesh=flics.elfgate_door, movie=pMovie, boundingradius=15, shadow=1}

--NewObject{subobject={gate,doors}}
EffectSave("ElfGateClose")


---------------------------------------------------------------- DarkElfGate Open/Close
local gate = NewObject{mesh=flics.darkelfgate}

NewMovie(2)
Translation{min={0,1.5,0}}
Rotation{dim=kDrwDimParticle}
Translation{max={2.5,0,0}, play=kDrwPlayClamped, path=kDrwPathCosine, range=5}
local doors = NewObject{mesh=flics.darkelfgate_door, movie=pMovie, boundingradius=15, shadow=1}
EffectSave("DarkElfGateOpen")

--NewObject{subobject={gate,doors}}

NewMovie(2)
Translation{min={0,1.5,0}}
Rotation{dim=kDrwDimParticle}
Translation{min={2.5,0,0}, max={0,0,0}, play=kDrwPlayClamped, path=kDrwPathCosine, range=5}
local doors = NewObject{mesh=flics.darkelfgate_door, movie=pMovie, boundingradius=15, shadow=1}
EffectSave("DarkElfGateClose")

--NewObject{subobject={gate,doors}}

---------------------------------------------------------------- Firegate Open/Close
local gate = NewObject{mesh=flics.firegate}

local range=4
NewMovie(44)
Translation{min={-5.5,0,0}}
Translation{min={0,0,0}, max={11,0,0}, dim=kDrwDimParticle, path=kDrwPathRandom}
Translation{max={0,0,10}, trail=1, range=range, path=kDrwPathParabola}
local path=Path{{0,1},{0.1,0}, {0.8,0.3}, {1,1}}
Color{min={1,0.8,0.3,1}, max ={1,0,0,0}, trail=1, range=range, path=path}
--Scale{min=3, max=3, path=kDrwPathParabola, trail=1, range=range}
Scale{min=3}
Rotation{dim=kDrwDimParticle}
local doors = NewObject{billboard=flics.smoke, movie=pMovie}

NewMovie()
Translation{min={0,0,-10}, max={0,0,0}, range=3, path=kDrwPathCosine, play=kDrwPlayClamped}
NewObject{subobject=doors, movie=pMovie, boundingradius=15}
EffectSave("FireGateClose")

NewMovie()
Translation{max={0,0,-10}, min={0,0,0}, range=3, path=kDrwPathCosine, play=kDrwPlayClamped}
NewObject{subobject=doors, movie=pMovie, boundingradius=15}
EffectSave("FireGateOpen")


---------------------------------------------------------------- Indoorgate Open/Close (Addon2)
local gate = NewObject{mesh=flics.indoorgate}

NewMovie(1)
Translation{max={0,0,-2.5}, play=kDrwPlayClamped, path=kDrwPathNegParabola, range=1.5}
local doors = NewObject{mesh=flics.indoorgate_door, movie=pMovie, boundingradius=15, shadow=1}
EffectSave("IndoorGateOpen")

--NewObject{subobject={gate, doors}}

NewMovie(1)
Translation{min={0,0,-2.5}, max={0,0,0}, play=kDrwPlayClamped, path=kDrwPathCosine, range=3}
local doors = NewObject{mesh=flics.indoorgate_door, movie=pMovie, boundingradius=15, shadow=1}
EffectSave("IndoorGateClose")


--NewObject{subobject={gate, doors}}

---------------------------------------------------------------- Fence large Open/Close
NewMovie(1)
--Translation{min={0,-0.3,0}}
Translation{max={0,0,-3.0}, play=kDrwPlayClamped, path=kDrwPathNegParabola, range=1.5}
local doors = NewObject{mesh=flics.fence_door, movie=pMovie, boundingradius=15, shadow=1}

--NewObject{subobject={gate, doors}}
EffectSave("FenceOpen")

NewMovie(1)
--Translation{min={0,-0.3,0}}
Translation{min={0,0,-3.0}, max={0,0,0}, play=kDrwPlayClamped, path=kDrwPathNegParabola, range=1.5}
local doors = NewObject{mesh=flics.fence_door, movie=pMovie, boundingradius=15, shadow=1}

--NewObject{subobject={gate, doors}}
EffectSave("FenceClose")

---------------------------------------------------------------- Fence extralarge Open/Close
NewMovie(1)
Translation{max={0,0,-3.0}, play=kDrwPlayClamped, path=kDrwPathNegParabola, range=1.5}
local doors = NewObject{mesh=flics.fencelarge_door, movie=pMovie, boundingradius=15, shadow=1}

--NewObject{subobject={gate, doors}}
EffectSave("FenceLargeOpen")

NewMovie(1)
Translation{min={0,0,-3.0}, max={0,0,0}, play=kDrwPlayClamped, path=kDrwPathNegParabola, range=1.5}
local doors = NewObject{mesh=flics.fencelarge_door, movie=pMovie, boundingradius=15, shadow=1}

--NewObject{subobject={gate, doors}}
EffectSave("FenceLargeClose")

---------------------------------------------------------------- Fence small Open/Close
NewMovie(1)
Translation{max={0,0,-3.0}, play=kDrwPlayClamped, path=kDrwPathNegParabola, range=1.5}
local doors = NewObject{mesh=flics.fencesmall_door, movie=pMovie, boundingradius=15, shadow=1}

--NewObject{subobject={gate, doors}}
EffectSave("FenceSmallOpen")

NewMovie(1)
Translation{min={0,0,-3.0}, max={0,0,0}, play=kDrwPlayClamped, path=kDrwPathNegParabola, range=1.5}
local doors = NewObject{mesh=flics.fencesmall_door, movie=pMovie, boundingradius=15, shadow=1}

--NewObject{subobject={gate, doors}}
EffectSave("FenceSmallClose")
---------------------------------------------------------------- Empyria Open/Close
local gate = NewObject{mesh=flics.empyria_gate}

NewMovie(2)
Translation{min={0.15,3.5,0}}
Rotation{dim=kDrwDimParticle}
Translation{max={-2.5,0,0}, play=kDrwPlayClamped, path=kDrwPathCosine, range=5}
local doors = NewObject{mesh=flics.empyria_door, movie=pMovie, boundingradius=15, shadow=1}
EffectSave("EmpyriaOpen")

--NewObject{subobject={gate,doors}}


NewMovie(2)
Translation{min={0.15,3.5,0}}
Rotation{dim=kDrwDimParticle}
Translation{min={-2.5,0,0}, max={0.03,0,0}, play=kDrwPlayClamped, path=kDrwPathCosine, range=5}
local doors = NewObject{mesh=flics.empyria_door, movie=pMovie, boundingradius=15, shadow=1}
EffectSave("EmpyriaClose")

--NewObject{subobject={gate,doors}}
