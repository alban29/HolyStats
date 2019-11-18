local cache = {}
local healingSpells = {
	Heal = {
		['Rank 1'] = {
			Min = 337,
			Max = 389,
			Mana = 132,
			Cast = 2.5,
			BaseCast = 3
		},
		['Rank 2'] = {
			Min = 489,
			Max = 558,
			Mana = 174,
			Cast = 2.5,
			BaseCast = 3
		},
		['Rank 3'] = {
			Min = 644,
			Max = 729,
			Mana = 217,
			Cast = 2.5,
			BaseCast = 3
		},
		['Rank 4'] = {
			Min = 807,
			Max = 910,
			Mana = 259,
			Cast = 2.5,
			BaseCast = 3
		}
	},
	['Greater Heal'] = {
		['Rank 1'] = {
			Min = 1016,
			Max = 1143,
			Mana = 314,
			Cast = 2.5,
			BaseCast = 3
		},
		['Rank 2'] = {
			Min = 1295,
			Max = 1450,
			Mana = 387,
			Cast = 2.5,
			BaseCast = 3
		},
		['Rank 3'] = {
			Min = 1617,
			Max = 1807,
			Mana = 463,
			Cast = 2.5,
			BaseCast = 3
		},
		['Rank 4'] = {
			Min = 1994,
			Max = 2224,
			Mana = 557,
			Cast = 2.5,
			BaseCast = 3
		}
	},
	['Flash Heal'] = {
		['Rank 1'] = {
			Min = 222,
			Max = 272,
			Mana = 125,
			Cast = 1.5,
			BaseCast = 1.5
		},
		['Rank 2'] = {
			Min = 295,
			Max = 358,
			Mana = 155,
			Cast = 1.5,
			BaseCast = 1.5
		},
		['Rank 3'] = {
			Min = 373,
			Max = 447,
			Mana = 185,
			Cast = 1.5,
			BaseCast = 1.5
		},
		['Rank 4'] = {
			Min = 455,
			Max = 542,
			Mana = 215,
			Cast = 1.5,
			BaseCast = 1.5
		},
		['Rank 5'] = {
			Min = 587,
			Max = 696,
			Mana = 265,
			Cast = 1.5,
			BaseCast = 1.5
		},
		['Rank 6'] = {
			Min = 728,
			Max = 861,
			Mana = 315,
			Cast = 1.5,
			BaseCast = 1.5
		},
		['Rank 7'] = {
			Min = 911,
			Max = 1073,
			Mana = 380,
			Cast = 1.5,
			BaseCast = 1.5
		}
	}
}

local sortBy = 'eff'
local sortOrder = 1

function SpellsFrame_OnLoad(self)
	SpellsFrameBG:SetVertexColor(0.2, 0.2, 0.2)
	self:SetMinResize(20,20)
	self:SetClampedToScreen(true)
	local offset = 0
	local columns = {
		{ name = 'spell', width = 100 },
		{ name = 'rank', width = 50 },
		{ name = 'min', width = 40 },
		{ name = 'max', width = 40 },
		{ name = 'avg', width = 40 },
		{ name = 'mana', width = 40 },
		{ name = 'eff', width = 40 },
		{ name = 'hbcoeff', width = 40 },
		{ name = 'hb', width = 40 },
		{ name = 'hbp', width = 40 }
	}
	for _,col in pairs(columns)
	do
		local btn = CreateFrame("Button", nil, self,"UIPanelButtonTemplate")
		btn:SetPoint("TOPLEFT", offset, 1)
		btn:SetScript("OnClick", function()
			if sortBy ~= col['name']
			then
				sortBy = col['name']
				sortOrder = 1
			else
				if sortOrder == 1
				then
					sortOrder = 0
				else 
					sortOrder = 1
				end
			end
			SpellsFrame_Update()
		end)
		btn:SetText(col['name'])
		btn:SetWidth(col['width'])
		offset = offset + col['width']
	end
	-- btn:Show()
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

function SpellsFrame_Update()
	local spells = getHealingSpells()
	local data = getSpells(spells)
	printData(data)
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
	return spells
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


function getSpells(spells)
	local toFrame = ''
	local data = {}
	cache['maxeff'] = 0
	for a,spell in pairs(sortKeys(spells))
	do
		for a,rank in pairs(sortKeys(spells[spell]))
		do
			local meta = spells[spell][rank]
			-- print(spell .. '(' .. rank .. ')')
			local avg = (meta.Min + meta.Max) / 2
			local eff = avg * 100 / meta.Mana
			local hb = 0
	
			-- toFrame = toFrame .. "\n" .. string.format("%s (%s): [Min: %d][Max:%d][Avg: %d][Eff: %d]", spell, rank, meta.Min, meta.Max, avg, eff, hb )
			
			local bonusHealing = GetSpellBonusHealing()
			local coeff = meta.BaseCast / 3.5
			
			local mMin = meta.Min + bonusHealing * coeff
			local mMax = meta.Max + bonusHealing * coeff
			local avgHB = avg + bonusHealing * coeff
			eff = avgHB / meta.Mana
			hb = (avgHB - avg) * 100 / avgHB
			hbp = bonusHealing * coeff
			
			local entry = {
				['spell'] = spell,
				['rank'] = rank,
				['mana'] = meta.Mana,
				['min'] = mMin,
				['max'] = mMax,
				['avg'] = avgHB,
				['eff'] = eff,
				['hbcoeff'] = coeff * 100,
				['hb'] = hbp,
				['hbp'] = hb
			}
			table.insert(data, entry)
			if cache['maxeff'] < eff
			then
				cache['maxeff'] = eff
			end
			-- toFrame = toFrame .. "\n" .. string.format("%s (%s): [Min: %d][Max:%d][Avg: %d][Eff: %d][HB: %d%%]", spell, rank, mMin, mMax, avgHB, eff, hb ) 
		end
	end

	if sortBy ~= nil 
	then
		data = sortData(data)
	end
	-- SpellsFrameText:SetText(toFrame)
	return data
end

function printData(data)
	-- local toFrame = ''
	local keys = {'spell', 'rank', 'mana', 'min', 'max', 'avg', 'eff', 'hbcoeff', 'hb', 'hbp'}
	local col = {}
	for i, entry in pairs(data)
	do
		for _,key in pairs(keys)
		do
			if col[key] == nil
			then
				col[key] = {}
			end
			if key == 'eff'
			then
				entry[key] = entry[key] * 100 / cache['maxeff']
			end
			if key == 'avg' or key == 'eff' or key == 'hb' or key == 'min' or key == 'max' or key == 'hbcoeff' or key == 'hbp'
			then
				entry[key] = math.floor(entry[key])
			end
			if key == 'hbp' or key == 'hbcoeff'
			then
				entry[key] = string.format("%d%%", entry[key])
			end
			table.insert(col[key], entry[key])
		end

		-- toFrame = toFrame .. "\n" .. string.format("%s (%s): [Min: %d][Max:%d][Avg: %d][Eff: %d][HB: %d%%]", entry['spell'], entry['rank'], entry['min'], entry['max'], entry['avg'], entry['eff'], entry['hb'] ) 
		-- do break end
	end
	-- SpellsFrameHSpell:SetText( 'Spell' )
	-- SpellsFrameHRank:SetText('Rank')
	-- SpellsFrameHMin:SetText('Min')
	-- SpellsFrameHMax:SetText('Max')
	-- SpellsFrameHAvg:SetText('Avg')
	-- SpellsFrameHEff:SetText('Eff')
	-- SpellsFrameHHB:SetText('HB')

	SpellsFrameTextSpell1:SetText( table.concat(col['spell'], "\n"))
	SpellsFrameTextRank1:SetText(table.concat(col['rank'], "\n"))
	SpellsFrameTextMana1:SetText(table.concat(col['mana'], "\n"))
	SpellsFrameTextMin1:SetText(table.concat(col['min'], "\n"))
	SpellsFrameTextMax1:SetText(table.concat(col['max'], "\n"))
	SpellsFrameTextAvg1:SetText(table.concat(col['avg'], "\n"))
	SpellsFrameTextEff1:SetText(table.concat(col['eff'], "\n"))
	SpellsFrameTextHBCoeff1:SetText(table.concat(col['hbcoeff'], "\n"))
	SpellsFrameTextHB1:SetText(table.concat(col['hb'], "\n"))
	SpellsFrameTextHBp1:SetText(table.concat(col['hbp'], "\n"))
end

function sortData(data)
	if sortOrder == 1
	then
		table.sort( data, function( a,b ) return a[sortBy] > b[sortBy] end )
	else
		table.sort( data, function( a,b ) return a[sortBy] < b[sortBy] end )
	end

	return data
end
