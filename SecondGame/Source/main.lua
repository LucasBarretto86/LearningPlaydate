import "CoreLibs/graphics"

pd = playdate
gfx = pd.graphics

charImage = gfx.image.new("assets/sprites/test/test-2")
char = gfx.sprite.new(charImage)

char:moveTo(150, 100)
char:setSize(64,64)
char:add()

function pd.update()
    gfx.clear()

    gfx.sprite.update()
end
