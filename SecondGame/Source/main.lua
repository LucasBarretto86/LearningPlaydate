import "CoreLibs/graphics"

local pd<const> = playdate
local gfx<const> = pd.graphics

local charImage = gfx.image.new("assets/sprites/test/test-2")
local char = gfx.sprite.new(charImage)

char:moveTo(150, 100)
char:setSize(64,64)
char:add()

function pd.update()
    gfx.clear()

    gfx.sprite.update()
end
