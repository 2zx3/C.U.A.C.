require "main"

local intro = {}

camera = require "Extensions/camera"
cam = camera()

clicked = false

function intro:load()

ending = love.graphics.newImage("Special/ending.png") 


end





function intro:update()

    if clicked == true then
        love.event.quit()
    end


    function love.touchpressed(id, x, y, dx, dy, pressure)
        clicked = true
        
    end

        function love.keypressed(key)
            if key == "escape" then
               love.event.quit()
            end
        end
end

function intro:draw()

    lg.draw(ending, 50, 50, 0, 0.8, 0.8 )
   

end

return intro