

function love.load()
    love.window.setTitle("MagiMagiSword")
    love.graphics.setBackgroundColor(1, 1, 1)
    gameTime = 0;
    SwordImage = love.graphics.newImage("res/sword.png")
    HeroImage = love.graphics.newImage("res/hero.png")
    playerPosX = 800 /2 
    playerPosY = 600/2
    playerDamage = 2
    playerHP = 10
    playerCooldown = 0
    playerSpeed = 50
    playerAngle = 0
    playerDirection = 1

end

function love.update(dt)
    if love.keyboard.isDown('right') then
        playerPosX = playerPosX + playerSpeed * dt
        playerDirection = 2
   end
   if love.keyboard.isDown('left') then
       playerPosX = playerPosX - playerSpeed * dt
       playerDirection = 1
   end
   if love.keyboard.isDown('down') then
       playerPosY = playerPosY + playerSpeed * dt
   end
   if love.keyboard.isDown('up') then
       playerPosY = playerPosY - playerSpeed * dt
   end
   
   gameTime = gameTime + dt
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    if (playerDirection == 1) then
    love.graphics.draw(SwordImage, (playerPosX-70), playerPosY - 10, playerAngle, 1, 1)
    love.graphics.draw(HeroImage, (playerPosX-50), playerPosY, playerAngle, 1, 1)
    else
        love.graphics.draw(HeroImage, (playerPosX+50), playerPosY, playerAngle, -1, 1)
        love.graphics.draw(SwordImage, (playerPosX+70), playerPosY - 10, playerAngle, -1, 1)
    end
  end