local healingSpells = {
	Heal = {
		['Rank 1'] = {
			Min = 337,
			Max = 389,
			Mana = 132,
			Cast = 2.5
		},
		['Rank 2'] = {
			Min = 489,
			Max = 558,
			Mana = 174,
			Cast = 2.5
		},
		['Rank 3'] = {
			Min = 644,
			Max = 729,
			Mana = 217,
			Cast = 2.5
		},
		['Rank 4'] = {
			Min = 807,
			Max = 910,
			Mana = 259,
			Cast = 2.5
		}
	},
	['Greater Heal'] = {
		['Rank 1'] = {
			Min = 1016,
			Max = 1143,
			Mana = 314,
			Cast = 2.5
		},
		['Rank 2'] = {
			Min = 1295,
			Max = 1450,
			Mana = 387,
			Cast = 2.5
		},
		['Rank 3'] = {
			Min = 1617,
			Max = 1807,
			Mana = 463,
			Cast = 2.5
		},
		['Rank 4'] = {
			Min = 1994,
			Max = 2224,
			Mana = 557,
			Cast = 2.5
		}
	},
	['Flash Heal'] = {
		['Rank 1'] = {
			Min = 222,
			Max = 272,
			Mana = 125,
			Cast = 1.5
		},
		['Rank 2'] = {
			Min = 295,
			Max = 358,
			Mana = 155,
			Cast = 1.5
		},
		['Rank 7'] = {
			Min = 911,
			Max = 1073,
			Mana = 380,
			Cast = 1.5
		}
	}
}

function SpellsFrame_OnLoad(self)
	SpellsFrameBG:SetVertexColor(0.2, 0.2, 0.2)
	self:SetMinResize(20,20)
	self:SetClampedToScreen(true)
end

function SpellsFrame_OnMouseDown(self, button)
	if (button == "LeftButton") then
		self:StartMoving()
		return
	elseif button == "RightButton" then
		self:StartSizing()
		self.isSizing = true
		return
	elseif button == "MiddleButton" then
		hideSpellsFrame()
	end
end

function SpellsFrame_OnMouseUp(self, button)
	self:StopMovingOrSizing()
end

function getHealingSpells()
	-- for i=0, 40	do skillType, contextualID = GetSpellBookItemName(i, BOOKTYPE_SPELL); print(skillType); print(contextualID)	end
	-- print("Spells")
	local spells = {}
	local i = 1
	while true do
		local spellName, spellSubName = GetSpellBookItemName(i, BOOKTYPE_SPELL)
		if not spellName
		then
			do break end
		end


		if healingSpells[spellName] ~= nil and healingSpells[spellName][spellSubName] ~= nil
		then
			if spells[spellName] == nil
			then
				spells[spellName] = {}
			end
			spells[spellName][spellSubName] = healingSpells[spellName][spellSubName]
			-- print(spellName .. '(' .. spellSubName .. ')')
		end
		i = i + 1
	end

	printSpells(spells)
end

function sortKeys(data)
	local keys = {}
	for k in pairs(data)
	do
		table.insert(keys, k)
	end
	table.sort(keys)

	return keys
end


function printSpells(spells)
	local toFrame = ''
	local data = {}
	for a,spell in pairs(sortKeys(spells))
	do
		for a,rank in pairs(sortKeys(spells[spell]))
		do
			meta = spells[spell][rank]
			-- print(spell .. '(' .. rank .. ')')
			local avg = (meta.Min + meta.Max) / 2
			local eff = avg * 100 / meta.Mana
			local hb = 0
	
			-- toFrame = toFrame .. "\n" .. string.format("%s (%s): [Min: %d][Max:%d][Avg: %d][Eff: %d]", spell, rank, meta.Min, meta.Max, avg, eff, hb )
			
			local bonusHealing = GetSpellBonusHealing()
			local coeff = meta.Cast / 3.5
			
			local mMin = meta.Min + bonusHealing * coeff
			local mMax = meta.Max + bonusHealing * coeff
			local avgHB = avg + bonusHealing * coeff
			eff = avgHB * 20 / meta.Mana
			hb = (avgHB - avg) * 100 / avgHB
			
			local entry = {
				['spell'] = spell,
				['rank'] = rank,
				['min'] = mMin,
				['max'] = mMax,
				['avg'] = avgHB,
				['eff'] = eff,
				['hb'] = hb
			}
			table.insert(data, entry)
			toFrame = toFrame .. "\n" .. string.format("%s (%s): [Min: %d][Max:%d][Avg: %d][Eff: %d][HB: %d%%]", spell, rank, mMin, mMax, avgHB, eff, hb ) 
		end
	end
	-- SpellsFrameText:SetText(toFrame)
	printData(data)
end

function printData(data)
	local toFrame = ''
	for i, entry in pairs(data)
	do
		toFrame = toFrame .. "\n" .. string.format("%s (%s): [Min: %d][Max:%d][Avg: %d][Eff: %d][HB: %d%%]", entry['spell'], entry['rank'], entry['min'], entry['max'], entry['avg'], entry['eff'], entry['hb'] ) 
	end
	SpellsFrameText:SetText(toFrame)
end
