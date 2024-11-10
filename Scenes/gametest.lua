require "main" 



local sti = require "sti"



local test1 = {}

 -- Virtual Gamepad --

local lovepad = require "Extensions/lovepad"



local anim8 = require 'Extensions/anim8'



lovepad:setGamePad()

-- Virtual Gamepad --



  -- Camera --



  camera = require "Extensions/camera"



  cam = camera()

 -- Camera -- 

player = {}

 -- player characteristics --



 --player.character = love.graphics.newImage("Sprites/placeholder.jpg")



-- Charawidth  = player.character:getWidth()

 --Charaheight = player.character:getHeight()

 playerx = 400

 playery = 200

 playerrun = 6

 playerrunmp = 15

 --CharaInteract = love.graphics.newImage("Sprites/2024-03-30.jpg")

 --Map = love.graphics.newImage("Sprites/placeholder(1).jpg")

 player.spriteSheet = love.graphics.newImage('Sprites/player.png')

 player.grid = anim8.newGrid( 12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight() )





 -- player characteristics --



function test1:load()

  wf = require 'windfield'
  world = wf.newWorld(0, 0)

  anim8 = require 'Extensions/anim8'

  love.graphics.setDefaultFilter("nearest", "nearest")


  sti = require 'sti'
  gameMap = sti("maps/main.lua")


  player = {}

  player.spriteSheet = love.graphics.newImage('Sprites/player.png')

  player.grid = anim8.newGrid( 12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight() )



  player.animations = {}

  player.animations.down = anim8.newAnimation( player.grid('1-4', 1), 0.2 )

  player.animations.left = anim8.newAnimation( player.grid('1-4', 2), 0.2 )

  player.animations.right = anim8.newAnimation( player.grid('1-4', 3), 0.2 )

  player.animations.up = anim8.newAnimation( player.grid('1-4', 4), 0.2 )



  player.anim = player.animations.up



 

lovepad:new{

text = "Pause",

x = 380,

y = 50,

radius = 10,

 }



end



function test1:update(dt)

   lovepad:update()



    local isMoving = false



   if lovepad:isDown('Up') then

     playery = playery - playerrun

     player.anim = player.animations.up

        isMoving = true



  elseif love.keyboard.isDown('w') then

     playery = playery - playerrun

     player.anim = player.animations.up

     isMoving = true

     

  elseif love.keyboard.isDown('up') then

     playery = playery - playerrun

     player.anim = player.animations.up

     isMoving = true

   end

   

   if lovepad:isDown('Down') then

     playery = playery + playerrun

     player.anim = player.animations.down

     isMoving = true



   elseif love.keyboard.isDown('s') then

     playery = playery + playerrun

     player.anim = player.animations.down

     isMoving = true



  elseif love.keyboard.isDown('down') then

     playery = playery + playerrun

     player.anim = player.animations.down

     isMoving = true



   end

   

if lovepad:isDown('Left') then

     playerx = playerx - playerrun

     player.anim = player.animations.left

     isMoving = true



   elseif love.keyboard.isDown('a') then

     playerx = playerx - playerrun

     player.anim = player.animations.left

     isMoving = true



  elseif love.keyboard.isDown('left') then

     playerx = playerx - playerrun

     player.anim = player.animations.left

     isMoving = true



   end

   

if lovepad:isDown('Right') then

     playerx = playerx + playerrun

     player.anim = player.animations.right

     isMoving = true



   elseif love.keyboard.isDown('d') then

     playerx = playerx + playerrun

     player.anim = player.animations.right

     isMoving = true



  elseif love.keyboard.isDown('right') then

     playerx = playerx + playerrun

     player.anim = player.animations.right

     isMoving = true



end

 

if lovepad:isPressed('A') then

     playerx = playerx + playerrun

end

   

if lovepad:isDown('B') then



   playerrun = playerrunmp

  elseif love.keyboard.isDown("b") then

  playerrun = playerrunmp else

      playerrun = 6 



end

  

  if lovepad:isPressed('Pause') then

    changeScene("Test")

    end



  if isMoving == false then

    player.anim:gotoFrame(2)

  end

  world:update(dt)

  player.anim:update(dt)





  cam:lookAt(playerx, playery)

    

    function love.keypressed(key)

    if key == "escape" then

       changeScene("Test")

    end

  end

end

 function test1:draw()

  cam:attach()

    gameMap:draw()

   -- love.graphics.draw(player.character, playerx, playery, 0, 1, 1,  Charawidth/2, Charaheight/2)

    player.anim:draw(player.spriteSheet, playerx, playery, nil, 1.5)
    
    world:draw()

  cam:detach()


  lovepad:draw()

  love.graphics.print(playerrun)

 end



return test1
