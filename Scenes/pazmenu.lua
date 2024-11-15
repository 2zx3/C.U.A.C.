require "main"

local pausemenu = {}

dimsX, dimsY = lg.getDimensions()
function pausemenu:load()
  
end

function pausemenu:update(dt)
  
end

function love.touchpressed(id, x, y, dx, dy, pressure)
  changeScene("gametest")
end

function love.keypressed(key)
  if key == "escape" then
     changeScene("gametest")
  end
end

function pausemenu:draw()
  love.graphics.print("Game Paused", dimsX/3.25, dimsY/4, 0, 3, 3)
  love.graphics.print("Press Anywhere to Continue... again.", dimsX/3.25, dimsY-15, 0, 1, 1)
end

return pausemenu