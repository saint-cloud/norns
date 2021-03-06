--- Screen class
-- subset of cairo drawing functions. see https://www.cairographics.org/tutorial/
-- @module screen
-- @alias Screen
local Screen = {}

local metro = require 'metro'
local screensaver = metro[33]

screensaver.callback = function()
  s_clear()
  s_update()
end
screensaver.time = 900
screensaver.count = 1

--- copy buffer to screen
Screen.update = function()
  s_update()
  screensaver:start()
end

--- enable/disable anti-aliasing
-- @param state on(1) or off(0)
Screen.aa = function(state) s_aa(state) end

--- clear
Screen.clear = function() s_clear() end

--- set level (color/brightness)
-- @param value 0-15 (0=off, 15=white)
Screen.level = function(value) s_level(value) end

--- set line width
-- @param w line width (in pixels, floats permitted)
Screen.line_width = function(w) s_line_width(w) end

--- move drawing position
-- @param x position x
-- @param y position y
Screen.move = function(x, y) s_move(x, y) end

--- move drawing position relative to current position
-- @param x relative position x
-- @param y relative position y
Screen.move_rel = function(x, y) s_move_rel(x, y) end

--- draw line to specified point
-- @param x destination x
-- @param y destination y
Screen.line = function(x,y) s_line(x,y) end

--- draw line to specified point relative to current position
-- @param x relative destination x
-- @param y relative destination y
Screen.line_rel = function(x, y) s_line_rel(x, y) end

--- draw arc
-- @param x circle center x
-- @param y circle center y
-- @param r radius
-- @param angle1 start angle
-- @param angle2 end angle
Screen.arc = function(x, y, r, angle1, angle2) s_arc(x, y, r, angle1, angle2) end

--- draw circle
-- @param x origin x
-- @param y origin y
-- @param r radius
Screen.circle = function(x, y, r) s_circle(x, y, r) end

--- draw rectangle
-- @param x x position
-- @param y y position
-- @param w width
-- @param h height
Screen.rect = function(x, y, w, h) s_rect(x, y, w, h) end

--- draw curve (cubic Bézier spline)
-- @param x1 destination x
-- @param y1 destination y
-- @param x2 handle 1 x
-- @param y2 handle 1 y
-- @param x3 handle 2 x
-- @param y3 handle 2 y
Screen.curve = function(x1, y1, x2, y2, x3, y3) s_curve(x1, y1, x2, y2, x3, y3) end

--- draw curve (cubic Bézier spline) relative coordinates
-- @param x1 relative destination x
-- @param y1 relative destination y
-- @param x2 handle 1 x
-- @param y2 handle 1 y
-- @param x3 handle 2 x
-- @param y3 handle 2 y
Screen.curve_rel = function(x1, y1, x2, y2, x3, y3) s_curve_rel(x1, y1, x2, y2, x3, y3) end

--- close current path
Screen.close = function() s_close() end

--- stroke current path
-- uses currently selected color
Screen.stroke = function() s_stroke() end

--- fill current path
-- uses currently selected color
Screen.fill = function() s_fill() end

--- draw text (left aligned)
-- uses currently selected font
-- @param string text to write
Screen.text = function(str) s_text(str) end

--- draw text, right aligned
-- uses currently selected font
-- @param string text to write
Screen.text_right = function(str) s_text_right(str) end

--- draw text, center aligned
-- uses currently selected font
-- @param string text to write
Screen.text_center = function(str) s_text_center(str) end

--- select font face
-- @param index font face (see list)
--
-- 1 04B_03 (norns default)
--
-- 2 ALEPH
--
-- 3 Roboto Thin
--
-- 4 Roboto Light
--
-- 5 Roboto Regular
--
-- 6 Roboto Medium
--
-- 7 Roboto Bold
--
-- 8 Roboto Black
--
-- 9 Roboto Thin Italic
--
-- 10 Roboto Light Italic
--
-- 11 Roboto Italic
--
-- 12 Roboto Medium Italic
--
-- 13 Roboto Bold Italic
--
-- 14 Roboto Black Italic
Screen.font_face = function(index) s_font_face(index) end

--- set font size
-- @param size in pixel height
Screen.font_size = function(size) s_font_size(size) end

-- draw single pixel (requires integer x/y, line_width == 1, stroke afterwards)
-- @param x position
-- @param y position
Screen.pixel = function(x,y)
  s_rect(x-0.25,y-0.25,0.5,0.5)
end


s_text_right = function(str)
  local x, y = s_extents(str)
  s_move_rel(-x, 0)
  s_text(str)
end

s_text_center = function(str)
  local x, y = s_extents(str)
  s_move_rel(-x/2, 0)
  s_text(str)
end

s_circle = function(x, y, r)
  s_arc(x, y, r, 0, math.pi*2)
end



return Screen
