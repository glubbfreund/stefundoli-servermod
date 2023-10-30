###############################################################################################################
#                                                                                                             #
# Dieses Skript "zählt Pfeile" und Trackt die Runden. Muss an Redstonegesteuerten Commandblock gesetzt werden # 
#                                                                                                             #
###############################################################################################################
#
# Wenn das Skript läuft wurde der Commandblock angesteuert und damit der Pfeil gezählt
# Der Wert gezählte Pfeile wird im StartMatch Skript zurückgesetzt und in der versteckten
# Tabelle matchvars getrackt
scoreboard players add "§o§7gezählte Pfeile" matchvars 1
# eröhe den Wurf um 1, Zeigt für den Spieler sichtbar wie viele Würfe von 3 getätigt wurden
# und wird im Skript StartMatch initialisiert 
scoreboard players add "§o§7Pfeil Nummer " playermatch 1
# Wenn der Wert Wurf Nummer 4 erreicht, ist der nächste Spieler an der Reihe
# daher ddie Spieler im Umkreis informieren und den Wert "Wurf Nummer" zurücksetzen
execute if score "§o§7Pfeil Nummer " playermatch matches 4 run titleraw @a[r=40] title {"rawtext":[{"text":"§6Spielerwechsel!"}]}  
execute if score "§o§7Pfeil Nummer " playermatch matches 4 run scoreboard players set "§o§7Pfeil Nummer " playermatch 1 
# Nun ermitteln wir für die Spieler sichtbar die Rundennummer, das geschieht mathematisch. 
# Zuerst setzen wir den Wert gleich dem versteckten Wert gezählte Pfeile
scoreboard players operation "§o§7Runde Nummer " playermatch = "§o§7gezählte Pfeile" matchvars
# Anschließend multiplizieren wir diesen Wert mit der Anzahl der Spieler, 
# dieser Wert wurde im Skript StartMatch initialisiert (3, weil 3 pro Spieler) 
scoreboard players operation "§o§7Rundengröße " matchvars *= "§o§7Spieler" matchvars  
# Danach teilen wir die Rundennummer durch die Ermittelte Rundengröße
# und geben den ermittelten Wert für den Spieler sichtbar aus.
scoreboard players operation "§o§7Runde Nummer " playermatch /= "§o§7Rundengröße " matchvars  
scoreboard players add "§o§7Runde Nummer " playermatch 1
