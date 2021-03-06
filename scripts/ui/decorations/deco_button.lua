DecoButton = Class.inherit(UiDeco)
function DecoButton:new(color, bordercolor, hlcolor, borderhlcolor)
	self.color = color or deco.colors.buttoncolor
	self.bordercolor = bordercolor or deco.colors.buttonbordercolor
	self.hlcolor = hlcolor or deco.colors.buttonhlcolor
	self.borderhlcolor = borderhlcolor or deco.colors.buttonborderhlcolor
	self.disabledcolor = deco.colors.buttondisabledcolor
	self.disabledbordercolor = deco.colors.buttondisabledbordercolor
	
	self.rect = sdl.rect(0, 0, 0, 0)
end

function DecoButton:draw(screen, widget)
	local r = widget.rect

	local basecolor = self.color
	local bordercolor = self.bordercolor

	if widget.hovered then
		basecolor = self.hlcolor
		bordercolor = self.borderhlcolor
	end
	if widget.disabled then
		basecolor = self.disabledcolor
	end
	
	self.rect.x = r.x
	self.rect.y = r.y
	self.rect.w = r.w
	self.rect.h = r.h
	screen:drawrect(bordercolor, self.rect)

	self.rect.x = r.x + 1
	self.rect.y = r.y + 1
	self.rect.w = r.w - 2
	self.rect.h = r.h - 2
	screen:drawrect(basecolor, self.rect)
	
	if not widget.disabled then
		self.rect.x = r.x + 2
		self.rect.y = r.y + 2
		self.rect.w = r.w - 4
		self.rect.h = r.h - 4
		screen:drawrect(bordercolor, self.rect)

		self.rect.x = r.x + 4
		self.rect.y = r.y + 4
		self.rect.w = r.w - 8
		self.rect.h = r.h - 8
		screen:drawrect(basecolor, self.rect)
	end
	
	widget.decorationx = widget.decorationx + 8
end

function DecoButton:apply(widget)
	widget:padding(5)
end

function DecoButton:unapply(widget)
	widget:padding(-5)
end


DecoMainMenuButton = Class.inherit(UiDeco)
function DecoMainMenuButton:new(colorBase, colorHighlight)
	self.colorBase = colorBase or deco.colors.mainMenuButtonColor
	self.colorHighlight = colorHighlight or deco.colors.mainMenuButtonColorHighlight
	self.colorDisabled = deco.colors.mainMenuButtonColorDisabled
	
	self.bonusX = 0
	self.bonusWidth = 0
	self.color = self.colorBase

	self.rect = sdl.rect(0, 0, 0, 0)
end

function DecoMainMenuButton:draw(screen, widget)
	if widget.disabled then
		self.color = self.colorDisabled
	end

	self.rect.x = widget.rect.x + self.bonusX
	self.rect.y = widget.rect.y
	self.rect.w = widget.rect.w + self.bonusWidth
	self.rect.h = widget.rect.h

	screen:drawrect(self.color, self.rect)
	
	widget.decorationx = widget.decorationx + 65
	widget.decorationy = widget.decorationy + 1
end
