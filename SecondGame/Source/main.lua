import "CoreLibs/graphics"

local gfx = playdate.graphics
local screenWidth = playdate.display.getWidth()
local screenHeight = playdate.display.getHeight()

local char = gfx.imagetable.new(4, 32, 32)

local success = char:load('./assets/sprites/L.png')

function playdate.update()
    gfx.clear()

    if success then
        char:drawImage(1, screenWidth / 2, screenHeight / 2.5, false)
    else
        print("Failed to load image")
    end
end
