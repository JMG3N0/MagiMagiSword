

function love.load()
    love.window.setTitle("MagiMagiSword")
    love.graphics.setBackgroundColor(1, 1, 1)
    SwordImage = love.graphics.newImage("res/sword.png")
    HeroImage = love.graphics.newImage("res/hero.png")
    playerPosX = 800 /2 
    playerPosY = 600/2
    playerDamage = 2
    playerHP = 10
    playerCooldown = 0
    isAttacking = false
    playerSpeed = 50
    playerAngle = 0
    playerDirection = 1
    score = 0
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
   if love.keyboard.isDown('z') then
        if (playerCooldown == 0) then
        isAttacking = true
        playerCooldown = 60
        end
   end

   if (playerCooldown > 0) then
   playerCooldown = playerCooldown - 1
   end
   if (playerCooldown == 0 ) then
    isAttacking = false
   end
  

end

function love.draw()
    love.graphics.setColor(1, 1, 1)

    if (playerDirection == 1) then
        if (isAttacking == false) then
             love.graphics.draw(SwordImage, (playerPosX-70), playerPosY - 10, playerAngle, 1, 1)
        else
            love.graphics.draw(SwordImage, (playerPosX-100), playerPosY + 120, math.rad(270), 1, 1)
        end
    love.graphics.draw(HeroImage, (playerPosX-50), playerPosY, playerAngle, 1, 1)
    else
        love.graphics.draw(HeroImage, (playerPosX+50), playerPosY, playerAngle, -1, 1)
        if (isAttacking == false) then
        love.graphics.draw(SwordImage, (playerPosX+70), playerPosY - 10, playerAngle, -1, 1)
        else
            love.graphics.draw(SwordImage, (playerPosX+100), playerPosY + 120, math.rad(90), -1, 1)
        end
    end
  end