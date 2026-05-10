local npc = script.Parent
local human = npc.Humanoid
local hroot = npc.HumanoidRootPart
local DACO = game.ServerStorage["RPK.arc"].DAT.Dev.DumpAICurrentObjective.Value
local wander = npc.PHNT_AI_MODE
local speedIdle = game.ServerStorage["RPK.arc"].DAT.Dev.PhontyIdleSpeed.Value
local speedChasing = game.ServerStorage["RPK.arc"].DAT.Dev.PhontyChasingSpeed.Value

local pfs = game:GetService("PathfindingService")

local AgentParams = {
AgentCanClimb = true,
AgentCanJump = false,
AgentHeight = 5,	
AgentRadius = 10
}
pfs:CreatePath(AgentParams)

function findNearestTorso(pos)
	local list = game.Players:GetChildren()
	local torso = nil
	local dist = 200
	local temp = nil
	local human = nil
	local char = nil
	for x = 1, #list do
		if list[x].Character ~= nil then
			char = list[x].Character
			if (char.ClassName == "Model") and (char ~= script.Parent) then
				temp = char:FindFirstChild("HumanoidRootPart")
				human = char:FindFirstChild("Humanoid")
				if (temp ~= nil) and (human ~= nil) and (human.Health > 0) then
					if (temp.Position - pos).Magnitude < dist then
						torso = temp
						dist = (temp.Position - pos).magnitude
					end
				end
			end
		end
	end
	return torso
end

function chase_player()
	while wander.Value == 0 do
		local enemytorso = findNearestTorso(hroot.Position)	
		if enemytorso ~= nil then
hroot.PHNT_Chase_Music.Playing = true
npc.Humanoid.WalkSpeed = speedChasing
npc.Name = ('Phonty-Phonograph')
			if DACO then
				print("Chasing Player")
			end
			if wander.Value == 2 or wander.Value == 1 then break end
			local path=game:GetService("PathfindingService"):FindPathAsync(hroot.Position,enemytorso.Position)
			if path.Status==Enum.PathStatus.NoPath then
				break
			else
				local waypoints = path:GetWaypoints()
				if npc:FindFirstChild("soda'd") then break end
				if #waypoints >= 3 and path.Status == Enum.PathStatus.Success then
					human:MoveTo(waypoints[3].Position)
				else
					human:MoveTo(enemytorso.Position)
				end
			end
		else
			wander.Value = math.random(1,2)
		end
		task.wait()
	end
end

function wander_around_halls()
	while wander.Value == 1 do
		npc.Name = 'Phonty'
		hroot.PHNT_Chase_Music:Stop()
		hroot.PHNT_Chase_Music.TimePosition = 0
		npc.Humanoid.WalkSpeed = speedIdle
		if DACO then
			print("Halls")
		end
		local all_points = workspace.AI.Nodes.HallPoints:GetChildren()
		local random_point = all_points[math.random(1, #all_points)]
		repeat
			local enemytorso = findNearestTorso(hroot.Position)
			if enemytorso ~= nil then
				wander.Value = 0
				break
			end
			if wander.Value == 0 or wander.Value == 2 then break end
			local path=game:GetService("PathfindingService"):FindPathAsync(hroot.Position,random_point.Position)
			if path.Status==Enum.PathStatus.NoPath then
				break
			else
				local waypoints = path:GetWaypoints()
				if npc:FindFirstChild("soda'd") then break end
				if #waypoints >= 3 and path.Status == Enum.PathStatus.Success then
					human:MoveTo(waypoints[3].Position)
				else
					human:MoveTo(random_point.Position)
				end
			end
			game:GetService("RunService").Heartbeat:Wait()
		until(random_point.Position-hroot.Position).Magnitude<=15
		task.wait()
	end
end


function check_rooms()
	while wander.Value == 2 do
		npc.Name = 'Phonty'
		hroot.PHNT_Chase_Music:Stop()
		hroot.PHNT_Chase_Music.TimePosition = 0
		npc.Humanoid.WalkSpeed = speedIdle
		if DACO then
			print("Rooms")
		end
		local all_points = workspace.AI.Nodes.HallPoints:GetChildren()
		local random_point = all_points[math.random(1, #all_points)]
		repeat
			local enemytorso = findNearestTorso(hroot.Position)
			if enemytorso ~= nil then
				wander.Value = 0
				break
			end
			if wander.Value == 1 or wander.Value == 0 then break end
			local path=game:GetService("PathfindingService"):FindPathAsync(hroot.Position,random_point.Position)
			if path.Status==Enum.PathStatus.NoPath then
				break
			else
				local waypoints = path:GetWaypoints()
				if npc:FindFirstChild("soda'd") then break end
				if #waypoints >= 3 and path.Status == Enum.PathStatus.Success then
					human:MoveTo(waypoints[3].Position)
				else
					human:MoveTo(random_point.Position)
				end
			end
			game:GetService("RunService").Heartbeat:Wait()
		until(random_point.Position-hroot.Position).Magnitude<=15
		task.wait()
	end
end

task.spawn(function()
	while true do
		if wander.Value == 1 then
			wander_around_halls()
		elseif wander.Value == 2 then
			check_rooms()
		elseif wander.Value == 0 then
			chase_player()
		end
		task.wait()
	end
end)


task.spawn(function()
	while true do
		task.wait(math.random(5,60))
		if wander.Value > 0 then -- if chasing then doesn't change
			wander.Value = math.random(1,2) -- switches between checking halls and checking rooms
		end
	end
end)
