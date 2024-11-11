require "main" 







local wf = require 'windfield'







local sti = require "sti"







local Dialove = require 'Extensions/Dialove'







local test1 = {}







 -- Virtual Gamepad --







local lovepad = require "Extensions/lovepad"















local anim8 = require 'Extensions/anim8'















lovepad:setGamePad()







-- Virtual Gamepad --















  -- Camera --



















  







 -- Camera -- 







player = {}







 -- player characteristics --















  camera = require "Extensions/camera"















-- DO NOT TOUCH THIS YET, MAY CAUSE CRASHES



--  camera:zoom(2)



--  camera.scale = zoom



--  camera.scale = camera.scale * 3











  cam = camera()















  wf = require 'windfield'



  world = wf.newWorld(0, 0)















  love.graphics.setDefaultFilter("nearest", "nearest")











  sti = require 'sti'



  gameMap = sti("maps/main.lua")











  playercollider = world:newRectangleCollider(0, 0, 14, 20)

  playercollider:setFixedRotation(true)











  



  playerx = 0

  playery = 0

  playerrun = 100

  playerrunmp = 130



map1x = 500

map1y = -500

  player.spriteSheet = love.graphics.newImage('Sprites/player.png')







  player.grid = anim8.newGrid( 12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight() )















  player.animations = {}







  player.animations.down = anim8.newAnimation( player.grid('1-4', 1), 0.2 )







  player.animations.left = anim8.newAnimation( player.grid('1-4', 2), 0.2 )







  player.animations.right = anim8.newAnimation( player.grid('1-4', 3), 0.2 )







  player.animations.up = anim8.newAnimation( player.grid('1-4', 4), 0.2 )















  player.anim = player.animations.up







 --player.character = love.graphics.newImage("Sprites/placeholder.jpg")















-- Charawidth  = player.character:getWidth()







 --Charaheight = player.character:getHeight()







 --CharaInteract = love.graphics.newImage("Sprites/2024-03-30.jpg")







 --Map = love.graphics.newImage("Sprites/placeholder(1).jpg")







 player.spriteSheet = love.graphics.newImage('Sprites/player.png')







 player.grid = anim8.newGrid( 12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight() )



 -- dialog --



dialogManager = Dialove.init({



  font = love.graphics.newFont('fonts/press-start-2p/PressStart2P-Regular.ttf', 16)



  })







dialogManager:show({



  text = "Oh No! it seems like i forgot my diary, I should go back and take it.",



  title = 'Lucas',



  -- image = love.graphics.newImage('Sprites/pic1place.jpeg')



})



-- dialog --



 -- player characteristics --

hitbox = {}



  if gameMap.layers["hitbox"] then



    for i, obj in pairs(gameMap.layers["hitbox"].objects) do



     

      local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)



      wall:setType('static')



      table.insert(hitbox, wall)



    end

  end



  -- doors = {}

-- 

--   if gameMap.layers["doors"] then

--   

--     for i, obj in pairs(gameMap.layers["doors"].objects) do

-- 

--       local doer = world:newRectangleCollider(obj.x, obj.y - 15, obj.width, obj.height)

-- 

--       doer:setType('static')

-- 

--       table.insert(doors, doer)

-- 

--     end

--   end

-- 

world:addCollisionClass('door')

door = world:newRectangleCollider(-20, -205, 50, 10)

door:setCollisionClass("door")

door:setType('static')



world:addCollisionClass('F1R3')

door = world:newRectangleCollider(-640, -1216, 16, 16)

door:setCollisionClass("F1R3")

door:setType('static')



world:addCollisionClass('F1R3_ret')

door = world:newRectangleCollider(-640, -1696, 32, 16)

door:setCollisionClass("F1R3_ret")

door:setType('static')



world:addCollisionClass('F1R2')

door = world:newRectangleCollider(-384, -1216, 16, 16)

door:setCollisionClass("F1R2")

door:setType('static')



world:addCollisionClass('F1R2_ret')

door = world:newRectangleCollider(-1168, -1696, 32, 16)

door:setCollisionClass("F1R2_ret")

door:setType('static')



world:addCollisionClass('F1R1')

door = world:newRectangleCollider(-128, -1216, 16, 16)

door:setCollisionClass("F1R1")

door:setType('static')



world:addCollisionClass('F1R1_ret')

door = world:newRectangleCollider(-1488, -1696, 32, 16)

door:setCollisionClass("F1R1_ret")

door:setType('static')





function test1:load()



lovepad:new{







text = "Pause",







x = 380,







y = 50,







radius = 10,







 }



end





function test1:update(dt)



   lovepad:update()

 dialogManager:update(dt)



    local isMoving = false



    local vx = 0

    local vy = 0





   if lovepad:isDown('Up') then



    vy = playerrun * -1



    player.anim = player.animations.up



    isMoving = true



  elseif love.keyboard.isDown('w') then



    vy = playerrun * -1



    player.anim = player.animations.up



    isMoving = true

  

  elseif love.keyboard.isDown('up') then



    vy = playerrun * -1



    player.anim = player.animations.up



    isMoving = true

  

   end



   if lovepad:isDown('Down') then



    vy = playerrun



    player.anim = player.animations.down



    isMoving = true



   elseif love.keyboard.isDown('s') then



    vy = playerrun



    player.anim = player.animations.down

  

    isMoving = true



  elseif love.keyboard.isDown('down') then



    vy = playerrun



    player.anim = player.animations.down



    isMoving = true

  

   end



if lovepad:isDown('Left') then



    vx = playerrun * -1



    player.anim = player.animations.left



    isMoving = true



   elseif love.keyboard.isDown('a') then



    vx = playerrun * -1



    player.anim = player.animations.left



    isMoving = true



  elseif love.keyboard.isDown('left') then



    vx = playerrun * -1



    player.anim = player.animations.left

  

    isMoving = true



   end



if lovepad:isDown('Right') then



    vx = playerrun

  

    player.anim = player.animations.right



    isMoving = true



   elseif love.keyboard.isDown('d') then



    vx = playerrun



    player.anim = player.animations.right

  

    isMoving = true



  elseif love.keyboard.isDown('right') then



    vx = playerrun



    player.anim = player.animations.right



    isMoving = true



end



if lovepad:isPressed('A') then

     dialogManager:faster()

     dialogManager:pop()

end



if lovepad:isDown('B') then



   playerrun = 150

  elseif love.keyboard.isDown("b") then

  playerrun = playerrunmp else

    playerrun = 100



end

 

  if lovepad:isPressed('Pause') then



    changeScene("pazmenu")



    end

 

    playercollider:setLinearVelocity(vx, vy)



  if isMoving == false then



    player.anim:gotoFrame(2)



  end



  cam:lookAt(playerx * 3, playery * 3)



  world:update(dt)



  playerx = playercollider:getX() - 9

  playery = playercollider:getY() - 13



  player.anim:update(dt)



    function love.keypressed(key)



    if key == "escape" then

   

       changeScene("Test")

   

    end

    end

    

  if playercollider:enter('door') then

      playercollider:setPosition(-4,-802)

  end


  if playercollider:enter('F1R3') then
    
    playercollider:setPosition(-624, -1712)

  end


  if playercollider:enter('F1R3_ret') then
    
    playercollider:setPosition(-633, -1191)

  end

  if playercollider:enter('F1R2') then
    
    playercollider:setPosition(-1152, -1712)

  end


  if playercollider:enter('F1R2_ret') then
    
    playercollider:setPosition(-376, -1191)

  end

  if playercollider:enter('F1R1') then
    
    playercollider:setPosition(-1472, -1712)

  end


  if playercollider:enter('F1R1_ret') then
    
    playercollider:setPosition(-118, -1191)

  end

end



 function test1:draw()



  cam:attach()

    love.graphics.scale(3, 3)

    gameMap:drawLayer(gameMap.layers["Tile Layer 1"])

    gameMap:drawLayer(gameMap.layers["Tile Layer 2"])

    gameMap:drawLayer(gameMap.layers["Tile Layer 3"])

   -- love.graphics.draw(player.character, playerx, playery, 0, 1, 1,  Charawidth/2, Charaheight/2)

    player.anim:draw(player.spriteSheet, playerx, playery, nil, 1.5)    

     -- world:draw()

  cam:detach()

  lovepad:draw()

  dialogManager:draw()

  love.graphics.print(playerrun)

  love.graphics.print(playerx, 10,10)

  love.graphics.print(playery, 10,20)

  love.graphics.print(playerrun)

 end



return test1
