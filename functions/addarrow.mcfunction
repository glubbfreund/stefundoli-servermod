scoreboard players add "§o§7gezählte Pfeile" matchvars 1
scoreboard players add "§o§7Wurf Nummer " playermatch 1
execute if score "§o§7Wurf Nummer " playermatch matches 4 run titleraw @a[r=40] title {"rawtext":[{"text":"§6Spielerwechsel!"}]}  
execute if score "§o§7Wurf Nummer " playermatch matches 4 run scoreboard players set "§o§7Wurf Nummer " playermatch 1 
scoreboard players operation "§o§7Runde Nummer " playermatch = "§o§7gezählte Pfeile" matchvars
scoreboard players operation "§o§7Rundengröße " matchvars *= "§o§7Spieler" matchvars  
scoreboard players operation "§o§7Runde Nummer " playermatch /= "§o§7Rundengröße " matchvars  
scoreboard players add "§o§7Runde Nummer " playermatch 1
