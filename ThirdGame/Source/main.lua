import "CoreLibs/graphics"
import "CoreLibs/animation"

local pd<const> = playdate
local gfx<const> = pd.graphics

local duration = 400

local imagePaths = {"assets/sprites/chars/Bald/00.png", "assets/sprites/chars/Bald/01.png",
                    "assets/sprites/chars/Bald/02.png", "assets/sprites/chars/Bald/03.png"}

local sprites = gfx.imagetable.new(#imagePaths, 32, 32)

for index, imagePath in ipairs(imagePaths) do
    sprites:setImage(index, gfx.image.new(imagePath))
end

local animation = gfx.animation.loop.new(duration, sprites, true)

function pd.update()
    gfx.clear()

    animation:draw(150, 50)
end
