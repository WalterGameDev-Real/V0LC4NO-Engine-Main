local hm = script.Parent:FindFirstChildOfClass("Humanoid")
local rn = math.random(1,2)
local hmrp = script.Parent.HumanoidRootPart

while true do
	game:GetService("RunService").Heartbeat:Wait()
	if hm.Sit then
		hm.Sit = false
	elseif hm.Jump then
		hm.Jump = false
	end
end

hm.StateChanged:Connect(function(_,state)
	if state then
		if state == Enum.HumanoidStateType.Landed  then
			hmrp:FindFirstChild("PHNT_Footstep_00"..rn):Play()
			hmrp.PHNT_Land:Play()
		end
	end
end)
