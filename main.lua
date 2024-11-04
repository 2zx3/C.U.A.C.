-- Virtual Gamepad --
local lovepad = require "lovepad"
lovepad:setGamePad()
-- Virtual Gamepad --

function love.load()
 player = {}
 player.character = love.graphics.newImage("placeholder.jpg")
 Charawidth  = player.character:getWidth()
 Charaheight = player.character:getHeight()
 player.x = 400
 player.y = 200
 CharaInteract = love.graphics.newImage("2024-03-30.jpg")
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
  end
 
function love.draw()
  lovepad:draw()
  love.graphics.draw(player.character, player.x, player.y, nil, 1, 1, Charawidth/2, Charaheight/2)
end
