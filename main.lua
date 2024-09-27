function love.load()

    love.window.setTitle("MagiMagiSword")
  
    love.graphics.setBackgroundColor(1, 1, 1)
    HeroImage = love.graphics.newImage("res/hero.png")

    playerPosX = 800 /2 
    playerPosY = 600/2
    playerDamage = 2
    playerHP = 10
    speed = 25
    angle = 0
    direction = 1
end

function love.update(dt)
    if love.keyboard.isDown('right') then
         playerPosX = playerPosX + speed * dt
         direction = 2
    end
    if love.keyboard.isDown('left') then
        playerPosX = playerPosX - speed * dt
        direction = 1
    end
    if love.keyboard.isDown('down') then
        playerPosY = playerPosY + speed * dt
    end
    if love.keyboard.isDown('up') then
        playerPosY = playerPosY - speed * dt
    end
end

function love.draw()
  
    love.graphics.setColor(1, 1, 1)
    if (direction == 1) then
    love.graphics.draw(HeroImage, (playerPosX-50), playerPosY, angle, 1, 1)
    else
        love.graphics.draw(HeroImage, (playerPosX+50), playerPosY, angle, -1, 1)
    end
  end