###############################################################################################################
#                                                                                                             #
# Prüft, ob alle Spieler im Bett liegen um die Nacht zu überspringen u. gleichzeitig die Uhr neu zu stellen   #
#                                                                                                             #
###############################################################################################################
#
# Dieses Skript wird durch einen Commandoblock angesteuert. 
# (wiederholend, bedingungslos, immer aktiv, Verzögerung 100)
#
# Reset des Wertes Momentane Spieler um dann diesen zu setzen. Es wird bei allen
# Spielern der Befehl add 1 ausgeführt, damit der genannte Wert erhöht wird. 
scoreboard players set "§7§oMomentane Spieler " bed 0
execute at @a run scoreboard players add "§7§oMomentane Spieler " bed 1
# Resette den Wert Spieler im Bett, erhöht wird dieser dann im Bedrunner Skript
scoreboard players set "§7§oSpieler im Bett " bed 0
