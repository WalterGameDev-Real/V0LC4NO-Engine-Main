local PRD = game.ServerStorage["RPK.arc"].DAT.Dev.PhontyRagdollDeath.Value
script.Parent.HumanoidRootPart.Touched:Connect(function(hit)
	if hit and hit.Parent and hit.Parent:FindFirstChildOfClass("Humanoid") and hit.Parent:FindFirstChildOfClass("Humanoid").Health > 0 then
		local plr = game.Players:GetPlayerFromCharacter(hit.Parent)
		if plr then
			local Debris = game:GetService('Debris')
			local chr = plr.Character
			local MAGNITUDE = 2
			local TIME_OF_FORCE = 0.05
			script.Parent.HumanoidRootPart.PHNT_Shoot:Play()
			chr:FindFirstChildOfClass("Humanoid").Health = 0
			if PRD == false then
			for i, v in chr.HumanoidRootPart:GetChildren() do
				if v:IsA("BallSocketConstraint") then
					v:Destroy()
				end
			end
		end
			for i, v in chr:GetChildren() do
				if v:IsA("Part") then
			local direction = (hit.Position - v.Position).unit
			local bodyForce = Instance.new('BodyForce')
			bodyForce.Force = MAGNITUDE * direction
			bodyForce.Parent = v
			Debris:AddItem(bodyForce, TIME_OF_FORCE)
				end
			end
		end
	end
end)
