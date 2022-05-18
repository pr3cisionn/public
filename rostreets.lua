local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/obeseinsect/roblox/main/Ui%20Libraries/Elerium.lua'))()

local old
old = hookfunction(getrawmetatable(game).__index,(function(...)
    local self,key = ...
    if(self:IsA("Humanoid")and key=="WalkSpeed")then
        return 16
    end
    return old(...)
end))


local Window = library:AddWindow("Ro-Streets", {
	main_color = Color3.fromRGB(41, 74, 122),
	min_size = Vector2.new(275, 275),
	toggle_key = Enum.KeyCode.RightShift,
	can_resize = false,
})

local Main = Window:AddTab("Main")
Main:AddButton("Godmode", function()
	game.Players.LocalPlayer.Character.Values.Armor:Destroy()
end)
Main:AddButton("Fire Detectors", function()
for i ,v in pairs (game:GetDescendants()) do
    if (v:IsA("ClickDetector")) then
        fireclickdetector(v)
    end
end
end)
local WalkSpeedSlider = Main:AddSlider("WalkSpeed", function(x)
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = x
end, {
	["min"] = 16, 
	["max"] = 100,
	["readonly"] = false,
	})
WalkSpeedSlider:Set(1)

Main:Show()
library:FormatWindows()
