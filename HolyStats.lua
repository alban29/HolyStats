local prefix = "|cffffa500MP5|cff1784d1Regen|r: "
local regen
local delay

function HolyStats_OnLoad(self)
	HolyStatsBG:SetVertexColor(0.2, 0.2, 0.2)
	HolyStatsFrame:SetMinResize(20,20)
	HolyStatsFrame:SetClampedToScreen(true)
	delay = 0
end

function HolyStats_OnUpdate(self, elapsed)
	delay = elapsed + delay
	if(delay > 1)
	then
		delay = 0
		HolyStats_update()
	end
end

function HolyStats_update()
	local base, casting = GetManaRegen()
	local delay
	if math.floor(base) > 0
	then
		regen = base
		delay = ""
	else
		delay = "+5s"
	end
	casting = 0.15 * regen
	local bonusHealing = GetSpellBonusHealing()
	local maxmana = UnitPowerMax("player" , 0)
	local mana = UnitPower("player" , 0);
	local full = maxmana/regen
	local fullin = (maxmana-mana)/regen
	local percent = 100*mana/maxmana

	local itemBonus = 0
	local itemRegen = 0
	for invSlot = 1, 18 do
		local itemLink = GetInventoryItemLink("player", invSlot);
		if itemLink == nil
		then
		else
			local stats = GetItemStats(itemLink)
				-- print("Item: "..itemLink)
			for k,v in pairs(stats)
			do
				if k == "ITEM_MOD_SPELL_POWER_SHORT"
				then
					itemBonus = itemBonus + v + 1
				end
				if k == "ITEM_MOD_POWER_REGEN0_SHORT"
				then
					itemRegen = itemRegen + v + 1
				end
			end
		end
	end
	
	tmpl = [[%d%% (%ds%s)

MP5: %.1f
MP5wC: %.1f
HealBonus: %d

ItemMP5wC: %.1f
ItemHealBonus: %d]]
	HolyStatsText:SetText(string.format( tmpl, percent, fullin, delay, regen*5, itemRegen + casting*5, bonusHealing, itemRegen, itemBonus))
end

function HolyStats_OnMouseDown(self, button)
	if (button == "LeftButton") then
		self:StartMoving()
		return
	elseif button == "RightButton" then
		self:StartSizing()
		self.isSizing = true
		end
end

function HolyStats_OnMouseUp(self, button)
	self:StopMovingOrSizing()
end
