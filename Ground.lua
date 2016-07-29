Ground = {}
Ground.__index = Ground

Ground_frames_x  = love.graphics.newQuad(0,0,608,208,608,128) -- => 이거 움짤로 만들면 리스트로 관리해야함.

function Ground.create()
	local self = {}
	setmetatable(self, Ground)
	self:reset()	
	return self
end

function Ground:reset(x,y)
	self.frame = 1
	self.x = x
	self.y = y

	self.onGround = true
	Ground_now_frame = Ground_frames_x
end

function Ground:normal(dt) --Ground 이동 
	self=BackgroundNormal(self,dt)
end

function Ground:UpdateMove(dt) --Ground key이벤트 
	self=BackgroundMove(self,dt)
end

function Ground:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
end

function Ground:draw()
	love.graphics.draw(imgGround,Ground_now_frame,self.x,self.y)
end