function love.load()
  Scene = require("Scenes/Test")
 if Scene.load then Scene:load()
 end
end

function love.update(dt)
  if Scene.update then Scene:update(dt)
 end
end

function love.draw()
  if Scene.draw then Scene:draw()
 end
end

function changeScene(nextScene)
  Scene = require("Scenes/"..nextScene)
  if Scene.load then Scene:load()
 end
end
