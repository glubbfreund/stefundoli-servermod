###############################################################################################################
#                                                                                                             #
# Prüft, ob alle Spieler im Bett liegen um die Nacht zu überspringen u. gleichzeitig die Uhr neu zu stellen   #
#                                                                                                             #
###############################################################################################################
#
# 
# Info über die Redstoneschaltung:
#
# COMMANDOBLOCK  <--------NEGATION---------LEITENDER
# (mit bedrunner.mcfunction)                 BLOCK 
# (wiederholt, bedingungslos, redstone)        ^
# 				                               |
# COMMANDOBLOCK								   | 
# (mit evening.mcfunction)                     | 
# (impuls, bedingungslos, redstone)            |
# ^                                            |
# |--SEITLICH------------------------------- COMP <--SEITLICH-- COMP <-------- LICHTSENSOR (DUNKEL)
#                                              ^
#                                              |
#                                              |
#                                       LICHTSENSOR (HELL)
#
#
# Dieser Wert prüft, ob sich unter allen Spielern etwa -1.9 Blöcke ein Bett befindet um dann in der Tabelle bed
# den Wert Spieler im Bett zu erhöhen. Der Reset dieses Wertes erfolgt im Sleepcounter Skript
execute at @a if block ~~-1.9~ bed run scoreboard players add "§7§oSpieler im Bett " bed 1
# Wenn die Anzahl der Momentanen Spielern in der Tabelle bed gleich den Spielern im Bett ist, setze die Zeit "sunrise"
# der Wert Momentane Spieler wird im Skript Sleepcounter gezählt
execute if score "§7§oMomentane Spieler " bed = "§7§oSpieler im Bett " bed run time set sunrise
# Setze zudem die unabhängige Uhrzeit auf 24.000 (6 Uhr), original Minecraft Zeit wäre aber 23.000 (5 Uhr)
execute if score "§7§oMomentane Spieler " bed = "§7§oSpieler im Bett " bed run scoreboard players set "§o§7Rawcounter " clock 24000 
# Nun sende an alle Spieler ein Guten Morgen
execute if score "§7§oMomentane Spieler " bed = "§7§oSpieler im Bett " bed run titleraw @a subtitle {"rawtext":[{"text":"§6"}]}
execute if score "§7§oMomentane Spieler " bed = "§7§oSpieler im Bett " bed run titleraw @a title {"rawtext":[{"text":"§6Guten Morgen!"}]}
