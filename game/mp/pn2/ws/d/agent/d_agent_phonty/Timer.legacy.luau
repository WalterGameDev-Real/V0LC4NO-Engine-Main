-- 2024-04-21 godamn this took long to make, and it's still not done.
-- 2024-06-13 modified for new phonty.
-- 2024-08-25 i have no idea what i'm doing but it seemed to work lol.
-- 2025-01-05 yay new year.
-- 2025-06-30 added ambient sounds for when phonti angry.
-- 2025-08-25 síck so i worked on this.
-- 2025-11-15 added le new scari sounds.
-- 2026-02-10 finally fixed jittery movement, hell yea!
print("WalterGame's Phonty Script Loaded!") --no thief
local xmastheme = workspace.ChristmasTheme.Value
local root = script.Parent.HumanoidRootPart
if xmastheme == true then
root.PHNT_Music4:Play()
else
root.PHNT_Music3:Play()
end
while task.wait() do
	script.Parent.PHNT_TIME.Value = script.Parent.PHNT_TIME.Value - 0.075 --0.005
	if script.Parent.PHNT_TIME.Value <= 0 then
		break
	end
end

if script.Parent.PHNT_TIME.Value <= 0 then

script.Parent.TouchPart.ClickDetector.MaxActivationDistance = 0
script.Parent.TouchPart.GuiReplication.Disabled = true
root.PHNT_Particle_Normal01.Enabled = false
root.PHNT_Particle_Normal02.Enabled = false
root.PHNT_Particle_Normal03.Enabled = false
root.PHNT_State_Normal.Enabled = false
root.PHNT_State_Emerging.Enabled = true
root.PHNT_Music1:Stop()
root.PHNT_Music2:Stop()
root.PHNT_Music3:Stop()
root.PHNT_Music4:Stop()
root.PHNT_State_Emerging.Animate.Disabled = false
root.PHNT_Emerge:Play()
script.Parent.Script.Enabled = true
repeat
	
	game:GetService("RunService").Heartbeat:Wait()
until root.PHNT_State_Emerging:FindFirstChild("38").Visible == true
script.Parent.Cloth.Cloth.Enabled = true
script.Parent.Cloth.Parent = workspace
root.Anchored = false
script.Parent.TouchPart:Destroy()
for i, v in root.Parent:GetChildren() do
	if v:IsA("Part") and v.Anchored == false then
		v:SetNetworkOwner(nil)
	end
end
task.wait(1)
script.Parent.AI.Enabled = true
root.IdleScript.Enabled = true
root.PHNT_Walkloop:Play()
print('Phonty Has Woken Up!')
workspace.Lights:Destroy()
local audio = workspace.Audio
audio.pn2_sfx.phonty_spawn:Play()
local lighting = game.Lighting
	audio.pn2_tracks["phonty_emerged"]:Play()
	game.Lighting.FogEnd = 50
	game.Lighting.FogColor = Color3.new(0,0,0)
audio.ambientSounds.Enabled = true
	task.wait(3)
	if not xmastheme then
		game.ServerStorage["RPK.arc"].DAT.Rain.Parent = workspace
	workspace.SoundBricks.Part["Rain Sound Effect"]:Play()
	workspace.SoundBricks.SoundBrick1["Rain Sound Effect"]:Play()
		workspace.SoundBricks.SoundBrick2["Rain Sound Effect"]:Play()
		end
	workspace.Kerfus.Kerfus.Light.Transparency = 0
workspace.Kerfus.Kerfus.Light.SpotLight.Enabled = true
	workspace.Kerfus.Kerfus.HumanoidRootPart.Light_On:Play()
	workspace:FindFirstChild("Rain").c_courtyard_cubemap_standard_00.Position = workspace:FindFirstChild("Rain").CubemapInitPos.Position
	script.Parent.Remotes:Destroy()
		script.Parent.KillPlayer.Enabled = true
	script:Destroy()
end
