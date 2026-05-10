function ChangeToolParent(player, tool, parent)
	local char = player.Character
	if char then
		for i,v in pairs(char:GetChildren()) do
			if v:IsA("BackpackItem") then
				v.Parent = player.Backpack
			end
		end
	end
	
	if tool and parent then
		if tool:IsA("BackpackItem") then
			tool.Parent = parent
		end
	end
end

game.ReplicatedStorage.REM.ChangeToolParent.OnServerEvent:Connect(ChangeToolParent)

function DropHat(player)
	if player.Character ~= nil then
		for i,v in pairs(player.Character:GetChildren()) do
			if v.ClassName == "Accessory" then
				v.Parent = game.Workspace
			end
		end
	end
end

game.ServerStorage.ReplicatedStorage.REM.DropHat.OnServerEvent:Connect(DropHat)
