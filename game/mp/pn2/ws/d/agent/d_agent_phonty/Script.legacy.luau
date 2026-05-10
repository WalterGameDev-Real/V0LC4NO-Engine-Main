local FS = math.random(1,4)
local root = script.Parent.HumanoidRootPart
task.wait(0.7)
local sound1 = root:FindFirstChild("PHNT_Footstep_00"..FS):Clone()
sound1.Parent = root
sound1:Play()
game.Debris:AddItem(sound1,0.740)
task.wait(0.4)
local sound2 = root:FindFirstChild("PHNT_Footstep_00"..FS):Clone()
sound2.Parent = root
sound2:Play()
game.Debris:AddItem(sound2,0.740)
task.wait(0.4)
local sound3 = root:FindFirstChild("PHNT_Footstep_00"..FS):Clone()
sound3.Parent = root
sound3:Play()
game.Debris:AddItem(sound3,0.740)
script:Destroy()
