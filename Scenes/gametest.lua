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

dialogManager = Dialove.init({

  font = love.graphics.newFont('fonts/press-start-2p/PressStart2P-Regular.ttf', 16)

  })

dialogManager:show({

  text = "Oh No! it seems like i forgot my diary, I should go back and take it.",
  title = 'Lucas',

})

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

world:addCollisionClass('F2_ret')
door = world:newRectangleCollider(464, -2656, 16, 32)
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
tornpage1 = world:newRectangleCollider(-672, -1824, 16, 16)
tornpage1:setCollisionClass("tornpage1")
tornpage1:setType('static')



world:addCollisionClass('tornpage2')
tornpage2 = world:newRectangleCollider(-960, -1808, 16, 16)
tornpage2:setCollisionClass("tornpage2")
tornpage2 :setType('static')


world:addCollisionClass('tornpage3')
tornpage3 = world:newRectangleCollider(-1088, -3024, 16, 16)
tornpage3:setCollisionClass("tornpage3")
tornpage3:setType('static')



world:addCollisionClass('tornpage4')
tornpage4 = world:newRectangleCollider(-1552, -3504, 16, 16)
tornpage4:setCollisionClass("tornpage4")
tornpage4:setType('static')



world:addCollisionClass('tornpage5')
tornpage5 = world:newRectangleCollider(-2032, -944, 16, 16)
tornpage5:setCollisionClass("tornpage5")
tornpage5:setType('static')



world:addCollisionClass('tornpage6')
tornpage6 = world:newRectangleCollider(-2544, -1328, 16, 16)
tornpage6:setCollisionClass("tornpage6")
tornpage6:setType('static')


world:addCollisionClass('F2')
door = world:newRectangleCollider(-16, -1520, 32, 16)
door:setCollisionClass("F2")
door:setType('static')

    world:addCollisionClass('F3')
    door = world:newRectangleCollider(400, -3504, 32, 16)
    door:setCollisionClass("F3")
    door:setType('static')

    world:addCollisionClass('end')
    door = world:newRectangleCollider(-2000.00, -336.00, 32, 16)
    door:setCollisionClass("end")
    door:setType('static')

sounds = {}



  sounds.peace = love.audio.newSource("sounds/peace.mp3", "stream")
  sounds.footsteps = love.audio.newSource("sounds/footsteps.mp3", "stream")

  sounds.peace:setLooping(true)
  sounds.footsteps:setLooping(true)

  sounds.peace:setVolume(0.8)

  sounds.peace:play()

  walking = false


function test1:load()

lovepad:new{



text = "Pause",



x = 380,
y = 50,
radius = 30,

 }


end


function test1:update(dt)

   lovepad:update()

 dialogManager:update(dt)

    local isMoving = false

     vx = 0
     vy = 0


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


 if walking == false then

  sounds.footsteps:stop() else

    sounds.footsteps:play()

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

 -- SECOND FLOOR

 if playercollider:enter('F2') then

  playercollider:setPosition(448, -2640)

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


  if playercollider:enter('end') then


    sounds.footsteps:stop()
    playercollider:setPosition(-2944.00, -2496.00)

  end


  if playercollider:enter('tornpage1') then



    tornpage1:destroy()

  end

  if playercollider:enter('tornpage2') then



    tornpage2:destroy()

  end

  if playercollider:enter('tornpage3') then


    tornpage3:destroy()

  end

  if playercollider:enter('tornpage4') then



    tornpage4:destroy()

  end

  if playercollider:enter('tornpage5') then



    tornpage5:destroy()

  end

  if playercollider:enter('tornpage6') then


    tornpage6:destroy()

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

  if showTorn3 == true then 

    drawit3 = true 

  elseif showTorn3 == false then 

    drawit3 = false

  end


  if showTorn4 == true then 

    drawit4 = true 

  elseif showTorn4 == false then 

    drawit4 = false

  end

  if showTorn5 == true then 

    drawit5 = true 

  elseif showTorn5 == false then 

    drawit5 = false

  end


  if showTorn6 == true then 

    drawit6 = true 

  elseif showTorn6 == false then 

    drawit6 = false

  end



end

 function test1:draw()

  cam:attach()

    love.graphics.scale(3, 3)

    gameMap:drawLayer(gameMap.layers["Tile Layer 1"])

    gameMap:drawLayer(gameMap.layers["Tile Layer 2"])

    gameMap:drawLayer(gameMap.layers["Tile Layer 3"])

    player.anim:draw(player.spriteSheet, playerx, playery, nil, 1.5)  


  cam:detach()

  lovepad:draw()

  dialogManager:draw()


 end

return test1
