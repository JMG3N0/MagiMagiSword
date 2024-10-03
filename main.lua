

function love.load()
    love.window.setTitle("MagiMagiSword")
    love.graphics.setBackgroundColor(1, 1, 1)
    math.randomseed( os.time() )

    player = {
    SwordImage = love.graphics.newImage("res/sword.png"),
    HeroImage = love.graphics.newImage("res/hero.png"),
    initPosX = 800/2,
    initPosY = 600/2,
    posX = 800/2,
    posY = 600/2,
    damage = 2,
    hp = 10,
    cooldown = 0,
    isAttacking = false,
    speed = 50,
    angle = 0,
    direction = 1,
    score = 0
    }

    enemy = {
    posX = 0,
    posY = 0,
    hp = 0,
    damage = 0,
    angle = 0,
    direction = 1,
    speed = 25
    }
    enemyBody = love.graphics.newImage("res/enemy.png")
    enemyEye = love.graphics.newImage("res/enemyEye.png")
end

function checkToSpawn(player)
    local chancePerScore = player.score    
    local randomNumb = 0

    if (player.score > 10 ) then
        chancePerScore = 10
    end

    randomNumb = math.random(20)

    if (randomNumb <= chancePerScore) then
        return true
    else
        return false
    end
end

function setEnemy(player, enemy, enemyAlive)
    local spawnLimit = 10
    local currentSpawnLimit = player.score + 1

    if (currentSpawnLimit > spawnLimit) then
        currentSpawnLimit = spawnLimit
    end

    if (checkToSpawn(player) == true) then
        if (currentSpawnLimit > enemyAlive) then
            if (enemy.hp <= 0) then
                enemy.posX = math.random(1, 200)
                enemy.posY = math.random(200, 599)
                enemy.hp = 2 * (player.score + 1)
                enemy.damage = 1* (player.score + 1)
            end
        end
    end

    return enemy
end

function playerUpdateState(dt, player)
    if love.keyboard.isDown('right') then
        player.posX = player.posX + player.speed * dt
        player.direction = -1
   end
   if love.keyboard.isDown('left') then
       player.posX = player.posX - player.speed * dt
       player.direction = 1
   end
   if love.keyboard.isDown('down') then
       player.posY = player.posY + player.speed * dt
   end
   if love.keyboard.isDown('up') then
       player.posY = player.posY - player.speed * dt
   end
   if love.keyboard.isDown('z') then
        if (player.cooldown == 0) then
        player.isAttacking = true
        player.cooldown = 60
        end
   end

   if (player.cooldown > 0) then
    player.cooldown = player.cooldown - 1
    end
    if (player.cooldown == 0 ) then
     player.isAttacking = false
    end


   return player
end

function drawPlayer(player)
    if (player.direction == 1) then
        if (player.isAttacking == false) then
             love.graphics.draw(player.SwordImage, (player.posX-70), player.posY - 10, player.angle, player.direction, 1)
        else
            love.graphics.draw(player.SwordImage, (player.posX-100), player.posY + 120, math.rad(270), player.direction, 1)
        end
    love.graphics.draw(player.HeroImage, (player.posX-50), player.posY, player.angle, player.direction, 1)
    else
        love.graphics.draw(player.HeroImage, (player.posX+50), player.posY, player.angle, player.direction, 1)
        if (player.isAttacking == false) then
        love.graphics.draw(player.SwordImage, (player.posX+70), player.posY - 10, player.angle, player.direction, 1)
        else
            love.graphics.draw(player.SwordImage, (player.posX+100), (player.posY + 120), math.rad(90), player.direction, 1)
        end
    end
end



function love.update(dt)
    
    local enemyAlive = 0
    player = playerUpdateState(dt, player)

   for i = 0, 9 do
        if  (enemy[i].hp > 0) then
            enemyAlive = enemyAlive + 1
        end
    end
    for y = 0, 9 do 
        setEnemy(player, enemy[y], enemyAlive)
    end
  

end

function love.draw()

    love.graphics.setColor(1, 1, 1)
    drawPlayer(player)

    for i = 0, 9 do
        if  (enemy[i].hp > 0) then
            love.graphics.draw(enemyBody, (enemy[i].posX), (enemy[i].posY), enemy[i].angle, enemy[i].direction, 1)
        end
    end

end