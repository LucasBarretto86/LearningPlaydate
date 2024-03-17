import "CoreLibs/graphics"

local pd<const> = playdate
local gfx<const> = pd.graphics

local charImage = gfx.image.new("assets/sprites/chars/Bald")
local char = gfx.sprite.new(charImage)

char:moveTo(150, 50)
char:setSize(32,32)
char:add()

function pd.update()
    gfx.clear()

    gfx.sprite.update()
end
