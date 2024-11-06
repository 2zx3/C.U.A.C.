 -- Virtual Gamepad --
local lovepad = require "lovepad"
lovepad:setGamePad()
-- Virtual Gamepad --

function love.load()
  -- Camera --
  camera = require "camera"
  cam = camera()
 -- Camera -- 
 
lovepad:new{
text = "Pause",
x = 280,
y = 50,
length, width, side = 10,
lovepad:remove(3)
 }
 
 -- player characteristics --
 player = {}
 player.character = love.graphics.newImage("placeholder.jpg")
 Charawidth  = player.character:getWidth()
 Charaheight = player.character:getHeight()
 player.x = 400
 player.y = 200
 CharaInteract = love.graphics.newImage("2024-03-30.jpg")
 Map = love.graphics.newImage("placeholder(1).jpg")
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
  lovepad:draw()
 end
