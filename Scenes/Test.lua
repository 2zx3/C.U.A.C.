require "main"

lg = love.graphics

local titleScene  = {}

camera = require "Extensions/camera"
cam = camera()

local screenWidth, screenHeight = love.graphics.getDimensions()

-- Circle properties and timer variables
local circle = {
    x = screenWidth / 2,      -- Center of the screen
    y = screenHeight / 2,
    radius = 0,
    maxRadius = math.max(screenWidth, screenHeight),
    expanding = false,
    visible = true,
    delay = 10,
    timer = 0,
    speed = 500
}

-- growing text --
local scale = 0.1       
local scaleSpeed = 0.5
local growing = true
-- growing text --

local timery = 5
local delary = false

x = 0 
y = 0 

-- function Scene:titleScene()

function titleScene:load()
  BG = love.graphics.newImage("Special/titlescreenS8.png") -- change the image name lmao
  scrnX = lg.getWidth()
  scrnY = lg.getHeight()
  
end

function titleScene:update(dt)
  if delary == true then 
   timery = timery - 1
    end
if growing then
        scale = scale + scaleSpeed * dt
        if scale >= 1 then
            scale = 1
            growing = false  -- Switch to shrinking when fully grown
        end
    else
        scale = scale - scaleSpeed * dt
        if scale <= 0.1 then
            scale = 0.1
            growing = true  -- Switch to growing when fully shrunk
        end
        if delary == true and timery < 0 then
		 changeScene('intro')
  	end
end
expandAndDisappear()
end

function expandAndDisappear()
    -- Check if circle is in expanding state
    if circle.expanding then
        -- Increase radius faster by adjusting the multiplier
        circle.radius = circle.radius + circle.speed * love.timer.getDelta()
        
        -- If radius reaches maxRadius, start disappearance delay
        if circle.radius >= circle.maxRadius then
            circle.radius = circle.maxRadius
            circle.visible = false  -- Hide the circle
            circle.expanding = false -- Stop expanding
            circle.timer = 0         -- Reset timer for delay
        end
    end
    
    -- Handle disappearance delay
    if not circle.visible then
        circle.timer = circle.timer + love.timer.getDelta()
        
        -- After delay, reset circle for reappearance
        if circle.timer >= circle.delay then
            circle.radius = 0
            circle.visible = true
            circle.expanding = false
            circle.timer = 0
        end
    end
end

function love.touchpressed(id, x, y, dx, dy, pressure)
    if not circle.expanding and circle.visible then
        circle.expanding = true -- Start expanding
        circle.radius = 0       -- Reset radius
    end
     delary = true
 end

function love.keypressed(key)
  if key == "escape" then
     changeScene("intro")
  end
end

function titleScene:draw()

   -- love.graphics.draw(BG, 10, 10, 0, 1, 1, 50, -10)

   lg.draw(BG, 5, 5, 0, 0.8, 0.8 )
     
    cam:attach()
    cam:detach()
    lg.setColor(0,0,0)
    if circle.visible then
        love.graphics.circle("fill", circle.x, circle.y, circle.radius)
    end
    lg.setColor(1,1,1)
  end

return titleScene
