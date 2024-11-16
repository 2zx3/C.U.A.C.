require "main"

local intro = {}

camera = require "Extensions/camera"
cam = camera()

clicked = false

function intro:load()

introduction = love.graphics.newImage("Special/intro.png") 


end





function intro:update()

    if clicked == true then
        changeScene("gametest")
    end


    function love.touchpressed(id, x, y, dx, dy, pressure)
        clicked = true
        
    end

        function love.keypressed(key)
            if key == "escape" then
               changeScene("gametest")
            end
        end
end

function intro:draw()

    lg.draw(introduction, 5, 5, 0, 0.8, 0.8 )
   

end

return intro