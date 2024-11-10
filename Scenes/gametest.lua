require "main" 

local wf = require 'windfield'

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



  wf = require 'windfield'



  world = wf.newWorld(0, 0)

  love.graphics.setDefaultFilter("nearest", "nearest")

  sti = require 'sti'

  gameMap = sti("maps/main.lua")

  player = {}

  player.collider = world:newRectangleCollider(0, 0, 14, 20)

  player.collider:setFixedRotation(true)

  playerx = 0

  playery = 0

  playerrun = 100

  playerrunmp = 150

  player.spriteSheet = love.graphics.newImage('Sprites/player.png')

  player.grid = anim8.newGrid( 12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight() )

 -- player characteristics --







 --player.character = love.graphics.newImage("Sprites/placeholder.jpg")







-- Charawidth  = player.character:getWidth()



 --Charaheight = player.character:getHeight()



 --CharaInteract = love.graphics.newImage("Sprites/2024-03-30.jpg")



 --Map = love.graphics.newImage("Sprites/placeholder(1).jpg")



 player.spriteSheet = love.graphics.newImage('Sprites/player.png')



 player.grid = anim8.newGrid( 12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight() )



player.animations = {}



  player.animations.down = anim8.newAnimation( player.grid('1-4', 1), 0.2 )



  player.animations.left = anim8.newAnimation( player.grid('1-4', 2), 0.2 )



  player.animations.right = anim8.newAnimation( player.grid('1-4', 3), 0.2 )



  player.animations.up = anim8.newAnimation( player.grid('1-4', 4), 0.2 )







  player.anim = player.animations.up





  hitbox = {}



  if gameMap.layers["hitbox"] then

    

    for i, obj in pairs(gameMap.layers["hitbox"].objects) do

            local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)

      wall:setType('static')

      table.insert(hitbox, wall)

    end



  end

 







 -- player characteristics --







 function test1:load()



-- DO NOT TOUCH THIS YET, MAY CAUSE CRASHES

--  camera:zoom(2)

--  camera.scale = zoom

--  camera.scale = camera.scale * 3



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



    local vx = 0

    local vy = 0







   if lovepad:isDown('Up') then



    vy = playerrun * -1



    player.anim = player.animations.up



    sMoving = true







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



     playerx = playerx + playerrun



end



   



if lovepad:isDown('B') then







   playerrun = playerrunmp



  elseif love.keyboard.isDown("b") then



  playerrun = playerrunmp else



      playerrun = 100





end



  



  if lovepad:isPressed('Pause') then



    changeScene("Test")



  end





  if isMoving == false then



    player.anim:gotoFrame(2)



  end

  

  player.collider:setLinearVelocity(vx, vy)



  cam:lookAt(playerx * 3, playery * 3) -- hmmmmmmm



  world:update(dt)



  playerx = player.collider:getX() - 9 -- 

  playery = player.collider:getY() - 13 --



  player.anim:update(dt)





    function love.keypressed(key)



    if key == "escape" then



       changeScene("Test")



    end



  end



end



 function test1:draw()



  cam:attach()



    love.graphics.scale(3, 3)





    gameMap:drawLayer(gameMap.layers["Tile Layer 1"])

    gameMap:drawLayer(gameMap.layers["Tile Layer 2"])

    --gameMap:drawLayer(gameMap.layers["Tile Layer 3"])



   -- love.graphics.draw(player.character, playerx, playery, 0, 1, 1,  Charawidth/2, Charaheight/2)



    player.anim:draw(player.spriteSheet, playerx, playery, nil, 1.5)

    

    -- world:draw()



  cam:detach()





  lovepad:draw()



  love.graphics.print(playerrun)

  love.graphics.print(playerx, 10,10)

  love.graphics.print(playery, 25,15)



 end







return test1
