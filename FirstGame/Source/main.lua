import "CoreLibs/graphics"

local gfx = playdate.graphics

function playdate.update()
    gfx.drawText("First Game has *Started*", 10, 10)
end

