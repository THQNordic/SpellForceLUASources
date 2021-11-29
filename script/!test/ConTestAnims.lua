local dict_jobs = make_dict(globals(), 'kGdJob', 1)

local job_table = { -- welche jobs durchtogglen zum testen?
	kGdJobNothing,
	kGdJobGroupWalk,
	kGdJobHitTarget,
	kGdJobCast,
	kGdJobDie,
	kGdJobGotHit,

	kGdJobWoodCutterCutTree,
	kGdJobStoneMinerCrushStone,
	kGdJobWalkBack,
	kGdJobStrafeLeft,
	kGdJobStrafeRight,
	0
}

function test_anims()
	local t = %job_table
	if t.current == nil or t.current>=getn(t) then
		t.current = 1
	else
		t.current = t.current + 1
	end
	local job = t[t.current]
	DrwSetTestJob(job)
	if job == 0 then 
		print("Animation System reset to normal")
	else
		print("Testing Animation:", %dict_jobs[job])
	end
end

function test_anims_redo()
	local t = %job_table
	if t.current == nil then
		t.current = getn(t)
	end
	local job = t[t.current]
	DrwSetTestJob(job)
	if job ~= 0 then 
		print("Testing Animation:", %dict_jobs[job])
	end
end

function test_anims_reload()
	ObjectLibrary:Done()
	doscript("DrwLibraryInit")
end

function test_anims_reset()
	DrwSetTestJob(0)
end

function test_anims_kampfvariante() -- zwischen Variante Kampfanims zeigen und normal togglen
	if test_anims_kampfvariante_state == 0 then
		test_anims_kampfvariante_state = -1
	else
		test_anims_kampfvariante_state = 0
	end
	DrwSetTestJob(test_anims_kampfvariante_state)
end