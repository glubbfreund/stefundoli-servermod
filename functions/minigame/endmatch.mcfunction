###############################################################################################################
#                                                                                                             #
# Endmatch script, dieses Skript dient dem "Custom Game" und muss einem Knopf mit redstone gesteuerten        #
# Kommandoblock zugeordnet werden, welcher das Spiel wieder beendet.                                          #
#                                                                                                             #
###############################################################################################################
#
#
# COMMANDOBLOCK: Impuls, bedingungslos, Redstone aktiviert 
#
# Infos zum Aufbau des Spiels:
# 
#         ZIELSCHEIBE
#              |
#    1. BLOCK MIT REDSTONE STAUB (1 Block unter der Zielscheibe) --------RS VERSTÄRKER------------> COMMANDOBLOCK (addarrow.mcfunction)
#              |
#             (..) 9x hintereinander 
#              |
#    9. BLOCK MIT REDSTONE STAUB (1 Block unter der Zielscheibe) --------RS VERSTÄRKER------------> COMMANDOBLOCK (matchloopxx.mcfunction) 
#              |
# REDSTONE LAMPE MIT REDSTONE STAUB (6x hintereinander und 1 Block unter Zielscheibe)
#                                   (am Ende also zusammen mit Blöcken 15 Stück => 1x RS Signalstärke)
#
#
#
# 1 Knopf mit COMMANDOBLOCK (startgame.mcfunction) 
# 1 Knopf mit COMMANDOBLOCK (endgame.mcfunction) 
#
#
# In der Tabelle matchvars wird der Wert matches gepflegt, steht dieser auf 1, läuft bereits ein Match. 
# hier wird also vor jedem Command dieser Zustand vorausgesetzt
# Der Ton funktioniert noch nicht, und muss nochmals überarbeitet werden.
execute at @p if score "§o§7Spieler" matchvars matches 1 run playsound balloon.pop
# Gebe Training beendet aus, wenn nur 1 Spieler das Spiel gespielt hat
# und entferne die Tabelle playermatch
execute at @p if score "§o§7Spieler" matchvars matches 1 run titleraw @p title {"rawtext":[{"text":"§6Training beendet"}]}
execute at @p if score "§o§7Spieler" matchvars matches 1 run scoreboard objectives remove playermatch 
# Ansonsten waren mehrere Spieler anwesend. Hier muss also geprüft werden,
# wer Sieger und wer Verlierer ist. Anschließend werden die Ergebnisse ausgegeben
execute at @a if score @p playermatch = "§o§7Sieger" matchvars run titleraw @p title {"rawtext":[{"text":"§2Matchsieg!"}]} 
execute at @a if score @p playermatch < "§o§7Sieger" matchvars run titleraw @p title {"rawtext":[{"text":"§4Niederlage!"}]}
# Der Sieger erhält zusätzliche XP
execute at @a if score @p playermatch = "§o§7Sieger" matchvars run xp 50 @p
execute at @a if score @p playermatch = "§o§7Sieger" matchvars run playsound random.levelup @p
# Der Verlierer eine gesonderte Akustik
execute at @a if score @p playermatch < "§o§7Sieger" matchvars run playsound bubble.pop
scoreboard objectives remove playermatch 
# Nun werden einige Werte wie Spieler und Sieger in der versteckten Matchvars zurückgesetzt 
scoreboard players reset "§o§7Spieler" matchvars 
scoreboard players reset "§o§7Sieger" matchvars 
scoreboard players reset "§o§7Rundengröße " matchvars 
scoreboard players reset "§o§7gezählte Pfeile" matchvars 
# Wichtig ist nun auch Match wieder auf 0 zu setzen, dies prüfen viele andere Skripte
scoreboard players set "§o§7Match" matchvars 0
