require "main"

local titleScene  = {}

local scale = 0.1       
local scaleSpeed = 0.5
local griwing = true

lg = love.graphics

-- function Scene:titleScene()

function titleScene:load()
  BG = love.graphics.newImage("Images/placeholder(1).jpg") -- change the image name lmao
  scrnX = lg.getWidth()
  scrnY = lg.getHeight()
  dimsX, dimsY = lg.getDimensions()
  
end

function titleScene:update(dt)
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
    end
end

function titleScene:draw()
  lg.draw(BG)
  lg.print("Backshots Mania", dimsX/3.2, dimsY/4, 0, 3, 3)
     local text = "Tap Anywhere to Start"
    local font = love.graphics.getFont()
    local textWidth = font:getWidth(text)
    local textHeight = font:getHeight(text)
    
    love.graphics.push()
    love.graphics.translate(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
    love.graphics.scale(scale, scale)  
    love.graphics.printf(text, -textWidth / 2, -textHeight / 2, textWidth, "center")
    love.graphics.pop()
    lg.print("Game made By: Juan and The Goods Pusher", dimsX/5.5, 300, 0, 2, 2)
  end

function love.touchpressed(id, x, y, dx, dy, pressure)
    changeScene("gametest")
 end

return titleScene