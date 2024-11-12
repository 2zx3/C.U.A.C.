require "main" 



local wf = require 'windfield'



local sti = require "sti"



local Dialove = require 'Extensions/Dialove'





local test1 = {}





local lovepad = require "Extensions/lovepad"



local anim8 = require 'Extensions/anim8'





lovepad:setGamePad()





player = {}



  camera = require "Extensions/camera"



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



 player.spriteSheet = love.graphics.newImage('Sprites/player.png')



 player.grid = anim8.newGrid( 12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight() )



 -- dialog --



dialogManager = Dialove.init({



  font = love.graphics.newFont('fonts/press-start-2p/PressStart2P-Regular.ttf', 16)



  })



dialogManager:show({



  text = "Oh No! it seems like i forgot my diary, I should go back and take it.",



  title = 'Lucas',



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



-- SECOND FLOOR



world:addCollisionClass('F2')



door = world:newRectangleCollider(-16, -1520, 16, 16)



door:setCollisionClass("F2")



door:setType('static')







world:addCollisionClass('F2_ret')



door = world:newRectangleCollider(464, -2656, 32, 16)



door:setCollisionClass("F2_ret")



door:setType('static')







world:addCollisionClass('F2R1')



door = world:newRectangleCollider(320, -3104, 16, 16)



door:setCollisionClass("F2R1")



door:setType('static')







world:addCollisionClass('F2R1_ret')



door = world:newRectangleCollider(-784, -2416, 32, 16)



door:setCollisionClass("F2R1_ret")



door:setType('static')







world:addCollisionClass('F2R2')



door = world:newRectangleCollider(80, -3104, 16, 16)



door:setCollisionClass("F2R2")



door:setType('static')







world:addCollisionClass('F2R2_ret')



door = world:newRectangleCollider(-1072, -2416, 32, 16)



door:setCollisionClass("F2R2_ret")



door:setType('static')







world:addCollisionClass('F2R3')



door = world:newRectangleCollider(-96, -3104, 16, 16)



door:setCollisionClass("F2R3")



door:setType('static')







world:addCollisionClass('F2R3_ret')



door = world:newRectangleCollider(-1648, -2416, 32, 16)



door:setCollisionClass("F2R3_ret")



door:setType('static')









world:addCollisionClass('F2R4')



door = world:newRectangleCollider(-448, -3104, 16, 16)



door:setCollisionClass("F2R4")



door:setType('static')







world:addCollisionClass('F2R4_ret')



door = world:newRectangleCollider(-1072, -2896, 32, 16)



door:setCollisionClass("F2R4_ret")



door:setType('static')







world:addCollisionClass('F2R5')



door = world:newRectangleCollider(16, -3504, 16, 16)



door:setCollisionClass("F2R5")



door:setType('static')







world:addCollisionClass('F2R5_ret')



door = world:newRectangleCollider(-1568, -2896, 32, 16)



door:setCollisionClass("F2R5_ret")



door:setType('static')







world:addCollisionClass('F2R6')



door = world:newRectangleCollider(-448.00, -3504, 16, 16)



door:setCollisionClass("F2R6")



door:setType('static')







world:addCollisionClass('F2R6_ret')



door = world:newRectangleCollider(-1744, -3376, 32, 16)



door:setCollisionClass("F2R6_ret")



door:setType('static')



-- THIRD FLOOR



world:addCollisionClass('F3')



door = world:newRectangleCollider(400, -3504, 16, 16)



door:setCollisionClass("F3")



door:setType('static')







world:addCollisionClass('F3_ret')



door = world:newRectangleCollider(-2000, 416, 32, 16)



door:setCollisionClass("F3_ret")



door:setType('static')







world:addCollisionClass('F3R1')



door = world:newRectangleCollider(-1776, 224, 16, 16)



door:setCollisionClass("F3R1")



door:setType('static')







world:addCollisionClass('F3R1_ret')



door = world:newRectangleCollider(-1488, -816, 32, 16)



door:setCollisionClass("F3R1_ret")



door:setType('static')







world:addCollisionClass('F3R2')



door = world:newRectangleCollider(-1904, 224, 16, 16)



door:setCollisionClass("F3R2")



door:setType('static')







world:addCollisionClass('F3R2_ret')



door = world:newRectangleCollider(-1872, -816, 32, 16)



door:setCollisionClass("F3R2_ret")



door:setType('static')







world:addCollisionClass('F3R3')



door = world:newRectangleCollider(-2080, 224, 16, 16)



door:setCollisionClass("F3R3")



door:setType('static')







world:addCollisionClass('F3R3_ret')



door = world:newRectangleCollider(-2544, -816, 32, 16)



door:setCollisionClass("F3R3_ret")



door:setType('static')







world:addCollisionClass('F3R4')



door = world:newRectangleCollider(-2208, 224, 16, 16)



door:setCollisionClass("F3R4")



door:setType('static')







world:addCollisionClass('F3R4_ret')



door = world:newRectangleCollider(-3008, -816, 32, 16)



door:setCollisionClass("F3R4_ret")



door:setType('static')







world:addCollisionClass('F3R5')



door = world:newRectangleCollider(-1776, -16, 16, 16)



door:setCollisionClass("F3R5")



door:setType('static')







world:addCollisionClass('F3R5_ret')



door = world:newRectangleCollider(-1568, -1296, 32, 16)



door:setCollisionClass("F3R5_ret")



door:setType('static')







world:addCollisionClass('F3R6')



door = world:newRectangleCollider(-1904, -16, 16, 16)



door:setCollisionClass("F3R6")



door:setType('static')







world:addCollisionClass('F3R6_ret')



door = world:newRectangleCollider(-1952, -1296, 32, 16)



door:setCollisionClass("F3R6_ret")



door:setType('static')







world:addCollisionClass('F3R7')



door = world:newRectangleCollider(-2080, -16, 16, 16)



door:setCollisionClass("F3R7")



door:setType('static')







world:addCollisionClass('F3R7_ret')



door = world:newRectangleCollider(-2352, -1296, 32, 16)



door:setCollisionClass("F3R7_ret")



door:setType('static')







world:addCollisionClass('F3R8')



door = world:newRectangleCollider(-2208, -16, 16, 16)



door:setCollisionClass("F3R8")



door:setType('static')







world:addCollisionClass('F3R8_ret')



door = world:newRectangleCollider(-2928, -1296, 32, 16)



door:setCollisionClass("F3R8_ret")



door:setType('static')



world:addCollisionClass('tornpage1')

tornpage1 = world:newRectangleCollider(20, 40, 50, 10)

tornpage1:setCollisionClass("tornpage1")

tornpage1:setType('static')



world:addCollisionClass('tornpage2')

tornpage2 = world:newRectangleCollider(20, 60, 50, 10)

tornpage2:setCollisionClass("tornpage2")

tornpage2:setType('static')



local showTorn = false

local tornTimer = 250

local pagegot = 0

local drawit = false

local tornpageuno = love.graphics.newImage("24x24/npc1.png")



local showTorn2 = false

local tornTimer2 = 250

local drawit2 = false

local tornpagedos = love.graphics.newImage("24x24/npc2.png")

-- DO NOT TOUCH THIS PLEASE!!!!!

--world:addCollisionClass('end')



--door = world:newRectangleCollider(400, -3504, 16, 16)



--door:setCollisionClass("end")



--door:setType('static')









function test1:load()



  sounds = {}



  sounds.horror = love.audio.newSource("sounds/horror.mp3", "stream")

  sounds.peace = love.audio.newSource("sounds/peace.mp3", "stream")

  sounds.footsteps = love.audio.newSource("sounds/footsteps.mp3", "stream")

  sounds.footsteps2 = love.audio.newSource("sounds/footsteps2.mp3", "static")



  sounds.peace:setLooping(true)

  sounds.horror:setLooping(true)



  sounds.footsteps:setLooping(true)

  sounds.footsteps2:setLooping(true)

  sounds.peace:setVolume(0.8)



  sounds.peace:play()

  



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



   local walking = false



if showTorn == true then 



   tornTimer = tornTimer - 1



    end



   if showTorn2 == true then 

   tornTimer2 = tornTimer2 - 1

    end

  

 if tornTimer < 0 then 

   drawit = false

   end

   

   if lovepad:isDown('Up') then



    vy = playerrun * -1



    player.anim = player.animations.up



    isMoving = true

    walking = true







  elseif love.keyboard.isDown('w') then



    vy = playerrun * -1



    player.anim = player.animations.up



    isMoving = true

    walking = true



  



  elseif love.keyboard.isDown('up') then



    vy = playerrun * -1



    player.anim = player.animations.up



    isMoving = true

    walking = true



  



   end







   if lovepad:isDown('Down') then



    vy = playerrun



    player.anim = player.animations.down



    isMoving = true

    walking = true







   elseif love.keyboard.isDown('s') then



    vy = playerrun



    player.anim = player.animations.down



    isMoving = true

    walking = true







  elseif love.keyboard.isDown('down') then



    vy = playerrun



    player.anim = player.animations.down



    isMoving = true

    walking = true

 

  



   end





if lovepad:isDown('Left') then



    vx = playerrun * -1



    player.anim = player.animations.left



    isMoving = true

    walking = true

 





   elseif love.keyboard.isDown('a') then



    vx = playerrun * -1



    player.anim = player.animations.left



    isMoving = true

    walking = true







  elseif love.keyboard.isDown('left') then



    vx = playerrun * -1



    player.anim = player.animations.left



    isMoving = true

    walking = true





   end







if lovepad:isDown('Right') then



    vx = playerrun



    player.anim = player.animations.right



    isMoving = true

    walking = true

 





   elseif love.keyboard.isDown('d') then



    vx = playerrun



    player.anim = player.animations.right



    isMoving = true

    walking = true

 





  elseif love.keyboard.isDown('right') then



    vx = playerrun



    player.anim = player.animations.right



    isMoving = true

    walking = true







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



  if walking == true then

      

    sounds.footsteps:play() else



      sounds.footsteps:stop()



  end



  --if floor2 == true and foot2 == true then 



   -- sounds.footsteps:setVolume(0.0)

   -- sounds.footsteps:stop()

   -- sounds.footsteps2:play() else



    --  sounds.footsteps2:stop()

    --  sounds.footsteps:setVolume(1)



  --end





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



 -- SECOND FLOOR



 if playercollider:enter('F2') then

    

  playercollider:setPosition(448, -2640)

  

  sounds.peace:stop()



  end





  if playercollider:enter('F2_ret') then

  

  playercollider:setPosition(0, -1488)



  sounds.peace:play()



  end



  if playercollider:enter('F2R1') then

    

    playercollider:setPosition(-768, -2432)



  end





  if playercollider:enter('F2R1_ret') then

    

    playercollider:setPosition(328, -3072.18)



  end



  if playercollider:enter('F2R2') then

    

    playercollider:setPosition(-1056, -2432)



  end





  if playercollider:enter('F2R2_ret') then

    

    playercollider:setPosition(88.25, -3072.18)



  end



  if playercollider:enter('F2R3') then

    

    playercollider:setPosition(-1632, -2432)



  end





  if playercollider:enter('F2R3_ret') then

    

    playercollider:setPosition(-89, -3072.18)



  end



  if playercollider:enter('F2R4') then

    

    playercollider:setPosition(-1056, -2912)



  end





  if playercollider:enter('F2R4_ret') then

    

    playercollider:setPosition(-439.67, -3072.18)



  end



  if playercollider:enter('F2R5') then

    

    playercollider:setPosition(-1552, -2912)



  end





  if playercollider:enter('F2R5_ret') then

    

    playercollider:setPosition(23.67, -3470)



  end



  if playercollider:enter('F2R6') then

    

    playercollider:setPosition(-1728, -3392)



  end





  if playercollider:enter('F2R6_ret') then

    

    playercollider:setPosition(-440.36, -3470)



  end



  -- THIRD FLOOR



  if playercollider:enter('F3') then

    

    playercollider:setPosition(-1984, 400)



    sounds.horror:play()



  end





  if playercollider:enter('F3_ret') then

    

    playercollider:setPosition(416, -3472)



    sounds.horror:stop()



  end



  if playercollider:enter('F3R1') then

    

    playercollider:setPosition(-1472, -832)



  end





  if playercollider:enter('F3R1_ret') then

    

    playercollider:setPosition(-1768, 263)



  end



  if playercollider:enter('F3R2') then

    

    playercollider:setPosition(-1856, -832)



  end





  if playercollider:enter('F3R2_ret') then

    

    playercollider:setPosition(-1895.67, 263)



  end



  if playercollider:enter('F3R3') then

    

    playercollider:setPosition(-2528, -832)



  end





  if playercollider:enter('F3R3_ret') then

    

    playercollider:setPosition(-2072, 263)



  end



  if playercollider:enter('F3R4') then

    

    playercollider:setPosition(-2992, -832)



  end





  if playercollider:enter('F3R4_ret') then

    

    playercollider:setPosition(-2200.33, 263)



  end



  if playercollider:enter('F3R5') then

    

    playercollider:setPosition(-1552, -1312)



  end





  if playercollider:enter('F3R5_ret') then

    

    playercollider:setPosition(-1768.25, 24)



  end



  if playercollider:enter('F3R6') then

    

    playercollider:setPosition(-1936, -1312)



  end





  if playercollider:enter('F3R6_ret') then

    

    playercollider:setPosition(-1895.82, 24)



  end



  if playercollider:enter('F3R7') then

    

    playercollider:setPosition(-2336, -1312)



  end





  if playercollider:enter('F3R7_ret') then

    

    playercollider:setPosition(-2073.50, 24)



  end



  if playercollider:enter('F3R8') then

    

    playercollider:setPosition(-2912, -1312)



  end





  if playercollider:enter('F3R8_ret') then

    

    playercollider:setPosition(-2199.67, 24)



  end



  if playercollider:enter('tornpage1') then

    showTorn = true

    pagegot = 1

    tornpage1:destroy()

  end



  if playercollider:enter('tornpage2') then

    showTorn2 = true

    pagegot = 2

        tornpage2:destroy()

  end

  

  dialogManager:pop()

  

 drwtrnpg()

end



function drwtrnpg()

  if showTorn == true then 

    drawit = true 

  elseif showTorn == false then 

    drawit = false

  end



  if showTorn2 == true then 

    drawit2 = true 

  elseif showTorn2 == false then 

    drawit2 = false

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

    if drawit == true and tornTimer > 0 then 

      love.graphics.draw(tornpageuno, playerx, playery)

    end
    

    if drawit2 == true and tornTimer2 > 0 then

      love.graphics.draw(tornpagedos, playerx, playery)

      end

    --  world:draw()

  cam:detach()

  lovepad:draw()

  dialogManager:draw()

  love.graphics.print(playerrun)

  love.graphics.print(playerx, 10,10)

  love.graphics.print(playery, 10,20)

  love.graphics.print(playerrun)

 end

return test1

