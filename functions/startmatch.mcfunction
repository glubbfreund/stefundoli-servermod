execute at @a[r=4] if score "§o§7Match" matchvars matches 1 run title @a[r=4] actionbar §l§4Es läuft bereits ein Match!
execute at @a[r=4] if score "§o§7Match" matchvars matches 1 run playsound bubble.pop
execute unless score "§o§7Match" matchvars matches 1 run scoreboard objectives add playermatch dummy "§6Match"
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players add "§o§7Spieler" matchvars 0
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players add @a[r=4] playermatch 0
execute at @a[r=4] unless score "§o§7Match" matchvars matches 1 run scoreboard players add "§o§7Spieler" matchvars 1 
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players set "§o§7Runde Nummer " playermatch 1 
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players set "§o§7gezählte Pfeile" matchvars 0 
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players set "§o§7Wurf Nummer " playermatch 1 
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players set "§o§7Rundengröße " matchvars 3 
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players add "§o§7Sieger" matchvars 0
execute unless score "§o§7Match" matchvars matches 1 run scoreboard objectives setdisplay sidebar playermatch
execute unless score "§o§7Match" matchvars matches 1 run playsound firework.launch
execute unless score "§o§7Match" matchvars matches 1 run title @a[r=4] actionbar §l§6Match gestartet!
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players add "§o§7Match" matchvars 1
