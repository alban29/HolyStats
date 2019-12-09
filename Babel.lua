local strings = {
    ['deDE'] = {
        -- Talents
        ['Spiritual Healing'] = 'Spirituelle Heilung',
        ['Improved Healing'] = 'Verbesserte Heilung',
        ['Improved Renew'] = 'Verbesserte Erneuerung',
        ['Mental Agility'] = 'Mentale Beweglichkeit',
        ['Holy Specialization'] = 'Macht des Glaubens',
        ['Meditation'] = 'Meditation',
        ['Improved Prayer of Healing'] = 'Verbesserte Gebet der Heilung',
        ['Healing Light'] = 'Heilendes Licht',
        ['Holy Power'] = 'Heilige Macht',
        ['Illumination'] = 'Göttliche Gunst',
        -- Skills
        ['Heal'] = 'Heilen',
        ['Greater Heal'] = 'Große Heilung',
        ['Prayer of Healing'] = 'Gebet der Heilung',
        ['Renew'] = 'Erneuerung',
        ['Flash Heal'] = 'Blitzheilung',
        ['Lesser Heal'] = 'Geringes Heilen',
        ['Flash of Light'] = 'Lichtblitz',
        ['Holy Light'] = 'Heiliges Licht',
        ['Holy Shock'] = 'Heiliger Schock',
        ['Rank 1'] = 'Rang 1',
        ['Rank 2'] = 'Rang 2',
        ['Rank 3'] = 'Rang 3',
        ['Rank 4'] = 'Rang 4',
        ['Rank 5'] = 'Rang 5',
        ['Rank 6'] = 'Rang 6',
        ['Rank 7'] = 'Rang 7',
        ['Rank 8'] = 'Rang 8',
        ['Rank 9'] = 'Rang 9',
        ['Rank 10'] = 'Rang 10',
    },
    ['enUS'] = {
        -- Talents
        ['Spiritual Healing'] = 'Spiritual Healing',
        ['Improved Healing'] = 'Improved Healing',
        ['Improved Renew'] = 'Improved Renew',
        ['Mental Agility'] = 'Mental Agility',
        ['Holy Specialization'] = 'Holy Specialization',
        ['Meditation'] = 'Meditation',
        ['Improved Prayer of Healing'] = 'Improved Prayer of Healing',
        ['Healing Light'] = 'Healing Light',
        ['Holy Power'] = 'Holy Power',
        ['Illumination'] = 'Illumination',
        -- Skills
        ['Heal'] = 'Heal',
        ['Greater Heal'] = 'Greater Heal',
        ['Prayer of Healing'] = 'Prayer of Healing',
        ['Renew'] = 'Renew',
        ['Flash Heal'] = 'Flash Heal',
        ['Lesser Heal'] = 'Lesser Heal',
        ['Flash of Light'] = 'Flash of Light',
        ['Holy Light'] = 'Holy Light',
        ['Holy Shock'] = 'Holy Shock',
        ['Rank 1'] = 'Rank 1',
        ['Rank 2'] = 'Rank 2',
        ['Rank 3'] = 'Rank 3',
        ['Rank 4'] = 'Rank 4',
        ['Rank 5'] = 'Rank 5',
        ['Rank 6'] = 'Rank 6',
        ['Rank 7'] = 'Rank 7',
        ['Rank 8'] = 'Rank 8',
        ['Rank 9'] = 'Rank 9',
        ['Rank 10'] = 'Rank 10',
    }
}

function b(s)
    local lang = 'enUS'
    if GetLocale() == 'deDE'
    then
        lang = GetLocale()
    end
    if lang == 'enUS'
    then
        return s
    end
    local val
    if strings[lang] ~= nil and strings[lang][s] ~= nil
    then
        val = strings[lang][s]
        -- print('Translation [' .. lang .. ']: ' .. s .. ' - '.. val)
    else
        val = s
        print('HolyStats: NoTranslation [' .. lang .. '] for ' .. s)
    end
    return val
end

function en(s)
    local lang = 'enUS'
    if GetLocale() == 'deDE'
    then
        lang = GetLocale()
    end
    if lang == 'enUS'
    then
        return s
    end

    for org, tr in pairs(strings[lang])
    do
        if tr == s
        then
            -- print('ReverseTranslation [' .. lang .. ']: ' .. s .. ' - ' .. org)
            return org
        end
    end
    -- print('HolyStats: NoReverseTranslation [' .. lang .. '] for ' .. s)
    return s
end
