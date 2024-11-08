require "main" 

local test1 = {}
 -- Virtual Gamepad --
local lovepad = require "extensions/lovepad"

lovepad:setGamePad()
-- Virtual Gamepad --

  -- Camera --

  camera = require "extensions/camera"

  cam = camera()
 -- Camera -- 
player = {}
 -- player characteristics --

 player.character = love.graphics.newImage("Images/placeholder.jpg")

 Charawidth  = player.character:getWidth()
 Charaheight = player.character:getHeight()
 playerx = 400
 playery = 200
 CharaInteract = love.graphics.newImage("Images/2024-03-30.jpg")
 Map = love.graphics.newImage("Images/placeholder(1).jpg")
 -- player characteristics --

function test1:load()
 
lovepad:new{
text = "Pause",
x = 280,
y = 50,
length, width, side = 10,
lovepad:remove(3)
 }
end

function test1:update(dt)
   lovepad:update()
   if lovepad:isDown('Up') then
     playery = playery - 2.5
  elseif love.keyboard.isDown('w') then
     playery = playery - 2.5
  elseif love.keyboard.isDown('up') then
     playery = playery - 2.5
   end
   
   if lovepad:isDown('Down') then
     playery = playery + 2.5
   elseif love.keyboard.isDown('s') then
     playery = playery + 2.5
  elseif love.keyboard.isDown('down') then
     playery = playery + 2.5
   end
   
if lovepad:isDown('Left') then
     playerx = playerx - 2.5
   elseif love.keyboard.isDown('a') then
     playerx = playerx - 2.5
  elseif love.keyboard.isDown('left') then
     playerx = playerx - 2.5
   end
   
if lovepad:isDown('Right') then
     playerx = playerx + 2.5
   elseif love.keyboard.isDown('d') then
     playerx = playerx + 2.5
  elseif love.keyboard.isDown('right') then
     playerx = playerx + 2.5
end
 
if lovepad:isPressed('A') then
     playerx = playerx + 40
end
   
   if lovepad:isPressed('B') then
 -- playerx = playerx - 40
 love.draw(CharaInteract)
   end
  
  if lovepad:isPressed('Pause') then
    changeScene("Test")
    end
    cam:lookAt(playerx, playery)
  
   end
  
 function test1:draw()
  cam:attach()
    love.graphics.draw(Map)
    love.graphics.draw(player.character, playerx, playery, 0, 1, 1,  Charawidth/2, Charaheight/2)
  cam:detach()
  lovepad:draw()
 end

return test1
