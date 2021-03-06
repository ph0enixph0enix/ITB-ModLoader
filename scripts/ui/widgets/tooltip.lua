UiTooltip = Class.inherit(UiWrappedText)

function UiTooltip:new()
	UiWrappedText.new(self)
	
	self:padding(10)
		:decorate({ DecoFrame(deco.colors.buttoncolor, deco.colors.white) })
	
	self.translucent = true
	self.limit = 28

	self.text = nil
	self.visible = false
end

function UiTooltip:draw(screen)
	self:updateText()
	if not self.visible then return end
	
	local x = sdl.mouse.x()
	local y = sdl.mouse.y()
	if x + 20 + self.w <= screen:w() then
		self.x = x + 20
	else
		self.x = x - self.w
	end
	
	if y + self.h <= screen:h() then
		self.y = y
	else
		self.y = y - self.h
	end
	
	self.screenx = self.x
	self.screeny = self.y
	
	UiWrappedText.draw(self, screen)
end

function UiTooltip:updateText()
	if self.text ~= self.root.tooltip then
		self.w = 0
		self:setText(self.root.tooltip)
		self.w = self:maxChildSize() + self.padl + self.padr
		
		self:relayout()
	end
	
	self.visible = self.text and self.text ~= ""
end
