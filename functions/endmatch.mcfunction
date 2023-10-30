execute at @p if score "§o§7Spieler" matchvars matches 1 run playsound balloon.pop
execute at @p if score "§o§7Spieler" matchvars matches 1 run titleraw @p title {"rawtext":[{"text":"§6Training beendet"}]}
execute at @p if score "§o§7Spieler" matchvars matches 1 run scoreboard objectives remove playermatch 
execute at @a if score @p playermatch = "§o§7Sieger" matchvars run titleraw @p title {"rawtext":[{"text":"§2Matchsieg!"}]} 
execute at @a if score @p playermatch < "§o§7Sieger" matchvars run titleraw @p title {"rawtext":[{"text":"§4Niederlage!"}]}
execute at @a if score @p playermatch = "§o§7Sieger" matchvars run xp 50 @p
execute at @a if score @p playermatch = "§o§7Sieger" matchvars run playsound random.levelup @p
execute at @a if score @p playermatch < "§o§7Sieger" matchvars run playsound bubble.pop
scoreboard objectives remove playermatch 
scoreboard players reset "§o§7Spieler" matchvars 
scoreboard players reset "§o§7Sieger" matchvars 
scoreboard players set "§o§7Rundengröße " matchvars 3
scoreboard players set "§o§7Match" matchvars 0
