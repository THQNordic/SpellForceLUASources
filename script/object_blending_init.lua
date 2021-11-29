-- initialize blendings for the figure movies

print("-- INITIALIZING BLENDING   object_blending_init.lua")

BlendingLibrary = ObjectLibrary:GetBlendingLibrary()

-- define better names for these "job groups"
kGdJobIdle = kGdJobGroupNothing 
kGdJobWalk = kGdJobGroupWalk

local blendings = {
-- to = {from=value, from=value,...}
	kGdJobDefault={kGdJobDefault=0.15}, -- defaultwert für alles undefinierte
	kGdJobIdle = {kGdJobDefault=0.35, kGdJobCriticalHit=0.30}, 
	kGdJobWalk = {kGdJobIdle=0.25, kGdJobWalk = 0.4, kGdJobShrineWorkerTakeMana=1},
	kGdJobStrafeRight = {kGdJobDefault=0.5},
	kGdJobStrafeLeft = {kGdJobDefault=0.5},
	kGdJobHitTarget = {kGdJobHitTarget=0.5, kGdJobDefault=0.1, kGdJobWalk=0.5, kGdJobCriticalHit=0.30},
	kGdJobCast = {kGdJobDefault=0.2}, 
	kGdJobCastResolve = {kGdJobDefault=0.1}, -- resolve folgt auf cast und sollte flott genug sein, damit man noch was davon sieht ;)
	kGdJobDie = {kGdJobDefault=0.5}, 
	kGdJobWoodCutterCutTree = {kGdJobIdle=0.05, kGdJobWalk=0.2}, -- aus idle schnell umschalten, da pose kompatibel. aus walk langsamer
	kGdJobStoneMinerCrushStone = {kGdJobIdle=0.05, kGdJobWalk=0.2}, 
	kGdJobMinerWork = {kGdJobIdle=0.05, kGdJobWalk=0.2}, 
	kGdJobBuilderBuild = {kGdJobIdle=0.05, kGdJobWalk=0.2}, 
	kGdJobCriticalHit = {kGdJobDefault = 0.20},
	kGdJobShrineWorkerTakeMana = {kGdJobDefault = 0.5},
	kGdJobHunterCutCorpse = {kGdJobDefault = 0.5},
}

for to_job,t in blendings do
	if not globals()[to_job] then
		error(to_job .. "is an unknown job id identifier!")
	end
	local to = globals()[to_job]
	for from_job,v in t do
		if not globals()[from_job] then
			error(from_job .. "is an unknown job id identifier!")
		end
		local from = globals()[from_job]
		BlendingLibrary:AddBlending(from, to, v)
	end
end

-- for debugging:
-- call DrwSetBlending(0.2) to use 0.2 globally for all blendings
-- call DrwSetBlending(nil) to reset to normal
function DrwSetGlobalBlending(blending)
	for to_job,t in %blendings do
		if not globals()[to_job] then
			error(to_job .. "is an unknown job id identifier!")
		end
		local to = globals()[to_job]
		for from_job,v in t do
			if not globals()[from_job] then
				error(from_job .. "is an unknown job id identifier!")
			end
			local from = globals()[from_job]
			BlendingLibrary:AddBlending(from, to, blending or v)
		end
	end
end

	