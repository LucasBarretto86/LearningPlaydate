import "CoreLibs/graphics"
import "CoreLibs/animation"

pd = playdate
gfx = pd.graphics

duration = 400

imagePaths = {"assets/sprites/chars/Bald/00.png", "assets/sprites/chars/Bald/01.png",
                    "assets/sprites/chars/Bald/02.png", "assets/sprites/chars/Bald/03.png"}

sprites = gfx.imagetable.new(#imagePaths, 32, 32)

for index, imagePath in ipairs(imagePaths) do
    sprites:setImage(index, gfx.image.new(imagePath))
end

animation = gfx.animation.loop.new(duration, sprites, true)

function pd.update()
    gfx.clear()

    animation:draw(150, 50)
end
