import "CoreLibs/graphics"

pd = playdate
gfx = pd.graphics

charImage = gfx.image.new("assets/sprites/chars/Bald/00")
char = gfx.sprite.new(charImage)

charSpeed = 16
charX = 150
charY = 100

char:moveTo(100, 100)
char:setSize(64,64)
char:add()

-- Control events
function playdate.leftButtonDown()
    charX -= charSpeed
end

function playdate.rightButtonDown()
    charX += charSpeed
end

function playdate.upButtonDown()
    charY -= charSpeed
end

function playdate.downButtonDown()
    charY += charSpeed
end

function pd.update()
    char:moveTo(charX, charY)
    gfx.sprite.update()
end
