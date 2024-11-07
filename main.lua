 -- Virtual Gamepad --
local lovepad = require "lovepad"
lovepad:setGamePad()
-- Virtual Gamepad --

-- Scene manager (Roomy) --
local roomy = require 'roomy' -- if your roomy.lua is in the root directory
local roomy = require 'roomy' -- if it's in subfolders
-- Scene manager (Roomy) --

--Scene--
local pausemenu = placeholder

local pause = {}

function pause:keypressed(key)
	if lovepad.isDown(Pause) then
		manager:pop()
    placeholder = love.graphics.newImage("Sprites/shockedcyn.png")

	end
end

local game = {}

function game:keypressed(key)
	if lovepad.isDown(Pause) then
		manager:push(pause)
    placeholder = nil
	end
end



function love.load()
  -- Camera --
  camera = require "camera"
  cam = camera()
 -- Camera -- 

 --Anim8--
 anim8 = require 'anim8'
 
lovepad:new{
text = "Pause",
x = 280,
y = 50,
length, width, side = 10,
lovepad:remove(3)
 }
 
 -- player characteristics --
 player = {}
 player.character = love.graphics.newImage("Sprites/player.png")
 Charawidth  = player.character:getWidth()
 Charaheight = player.character:getHeight()
 player.x = 400
 player.y = 200
 CharaInteract = love.graphics.newImage("Sprites/trollin.png")
 Map = love.graphics.newImage("Sprites/doll.png")

 player.grid = anim8.newGrid( 32, 64, player.character:getWidth(), player.character:getHeight() )
 -- player characteristics --
end

function love.update(dt)
   lovepad:update()
   if lovepad:isDown('Up') then
     player.y = player.y - 2.5
   end
   
   if lovepad:isDown('Down') then
     player.y = player.y + 2.5
   end
   
if lovepad:isDown('Left') then
     player.x = player.x - 2.5
   end
   
if lovepad:isDown('Right') then
     player.x = player.x + 2.5
end
 
if lovepad:isPressed('A') then
     player.x = player.x + 40
end
   
   if lovepad:isPressed('B') then
 player.x = player.x - 40
   end
  
    cam:lookAt(player.x, player.y)
  
   end
  
 function love.draw()
  cam:attach()
    love.graphics.draw(Map)
    love.graphics.draw(player.character, player.x, player.y, 0, 1, 1,  Charawidth/2, Charaheight/2)
  cam:detach()
  love.graphics.draw(pausemenu)
  lovepad:draw()
 end
