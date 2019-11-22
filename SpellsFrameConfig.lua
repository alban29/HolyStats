local isSpellsFrameConfig = false
local isSpellsFrameConfigInit = false

function toggleSpellsFrameConfig()
    if not isSpellsFrameConfigInit
    then
        SpellsFrameConfig_Fill(SpellsFrameConfig)
    end
	if isSpellsFrameConfig
	then 
		SpellsFrameConfig:Hide()
		isSpellsFrameConfig = false
	else
		SpellsFrameConfig:Show()
		isSpellsFrameConfig = true
	end
end

function SpellsFrameConfig_OnLoad(self)
	self:SetMinResize(20,20)
	self:SetClampedToScreen(true)
	if myIgnoredSpells == nil
	then
		myIgnoredSpells = {}
	end
end

function SpellsFrameConfig_OnMouseDown(self, button)
	if (button == "LeftButton") then
		self:StartMoving()
		return
	elseif button == "RightButton" then
		self:StartSizing()
		return
	elseif button == "MiddleButton" then
		toggleSpellsFrameConfig()
	end
end

function SpellsFrameConfig_OnMouseUp(self, button)
	self:StopMovingOrSizing()
end

function isSpellIgnored(spell, rank)
	if myIgnoredSpells[spell] == nil
	then
		myIgnoredSpells[spell] = {}
	end

	if myIgnoredSpells[spell][rank] == nil
	then
		return false 
	else 
		return myIgnoredSpells[spell][rank]
	end
	
end

function toggleSpellIgnore(spell, rank)
	if myIgnoredSpells[spell] == nil
	then
		myIgnoredSpells[spell] = {}
	end
	if isSpellIgnored(spell, rank)
	then
		myIgnoredSpells[spell][rank] = false
	else
		myIgnoredSpells[spell][rank] = true
	end
end

local offsetY = 0
local frameLoaded = false
function SpellsFrameConfig_Fill(self)
	local spells = getHealingSpells()
	local offsetX = 70
	self:SetWidth( 10 * 50 + 70)
	SpellsFrameConfigBG:SetVertexColor(0.1, 0.3, 0.3)
	if not frameLoaded
	then
		for i=1, 10
		do
			local label = self:CreateFontString(tostring(i) .. '1', 'OVERLAY' ,"GameFontNormal")
			label:SetPoint("TOPLEFT", offsetX, offsetY)
			label:SetWidth(50)
			label:SetHeight(20)
			label:SetVertexColor(0.9, 0.9, 0.9)
			label:SetText('Rank ' .. tostring(i))
			offsetX = offsetX + label:GetWidth()
		end
		offsetX = 0
		offsetY = offsetY - 30
	
		for _,spell in pairs(sortKeys(spells))
		do
			local label = self:CreateFontString(tostring(i) .. '1', 'OVERLAY' ,"GameFontNormal")
			label:SetPoint("TOPLEFT", offsetX, offsetY)
			label:SetWidth(70)
			label:SetHeight(20)
			label:SetText(spell)
			offsetX = offsetX + label:GetWidth()

			ranks = spells[spell]
			for _,rank in pairs(sortKeys(ranks))
			do
				local btn = CreateFrame("CheckButton", spell .. rank, self ,"UICheckButtonTemplate")
				btn:SetPoint("TOPLEFT", offsetX + 15, offsetY)
				btn:SetScript("OnClick", function(self)
					local lSpell = spell
					local lRank = rank
					toggleSpellIgnore(spell, rank)
				end)
				btn:SetChecked(not isSpellIgnored(spell, rank))
				btn:SetWidth(20)
				btn:SetHeight(20)
				offsetX = offsetX + 50
			end
			offsetX = 0
			offsetY = offsetY - 30
		end
    end
    self:SetHeight( offsetY * -1)
	frameLoaded = true
end
