###############################################################################################################
#                                                                                                             #
# Evening script, dieses Prüft ob die "Bettgehzeit" und informiert die Spieler dementsprechend.               # 
# Dies Skript wird u.a. mit Daylight Sensor bei entsprechender Lichtsituation über einen Kommandoblock        # 
# und Redstone angesteuert und ist im eigentlichen Skript dementsprechend simpel.                             #
#                                                                                                             #
###############################################################################################################
#
#
# Info über die Redstoneschaltung:
#
# COMMANDOBLOCK  <--------NEGATION---------LEITENDER
# (mit bedrunner.mcfunction)                 BLOCK 
# (wiederholt, bedingungslos, redston          ^
#                                              |
# COMMANDOBLOCK                                | 
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
# Dieses Skript wurde aktiviert, also entsprechenden title und subtitle an alle ausgeben  
titleraw @a subtitle {"rawtext":[{"text":"§6Zeit die Betten aufzusuchen"}]}
titleraw @a title {"rawtext":[{"text":"§5Vradiazi!"}]}
