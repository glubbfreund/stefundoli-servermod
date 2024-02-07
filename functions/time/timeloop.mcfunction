###############################################################################################################
#                                                                                                             #
# Uhrzeitscript von Oliver Leis, dies ist das Herz der Zeit und Uhrfunktion!                                  #
#                                                                                                             #
###############################################################################################################
#
# folgende Werte sind in der Tabelle clock fest eingetragen:
# Stundenverschiebung = 18.000
# Stundenfaktor       =  1.000
# Minutenfaktor       =    100
# Dezimalfaktor       =     10
#
# Dieses Skript wird durch einen Commandoblock angesteuert. 
# (wiederholend, bedingungslos, immer aktiv, Tick Verzögerung=3)
#
# Addiere 1 für den ingame Zeittick, ist aber unabhängig vom Rawcounter!
# nur wenn kein Match läuft.
execute if score "§o§7Match" matchvars matches 0 run time add 1
# wenn der Rawcounter 42.000 erreicht ist es Mitternacht, also zurück auf 0 (18.000)!
execute if score "§o§7Rawcounter " clock matches 42000 run scoreboard players set "§o§7Rawcounter " clock 18000
# Bei jeder ausführung dem Rawcounter 1 hinzufügen
# nur wenn kein Match läuft.
execute if score "§o§7Match" matchvars matches 0 run scoreboard players add "§o§7Rawcounter " clock 1 

# Wir müssen nun viele Schritte durchführen, es ist sehr aufwendig
# da das Scripten bei Bedrock sehr beschränkt funktional ist, daher
# ist bei der Zeitberechnung und den Schritten Geduld gefragt!
scoreboard players operation "§o§7Stunden " clock = "§o§7Rawcounter " clock
# Nun ziehen wir die 18.000 ab (Stundenverschiebung)
scoreboard players operation "§o§7Stunden " clock -= "§o§7Stundenverschiebung " clock
# wir arbeiten uns zur Stundenzahl in dem wir zuerst durch Stundenfaktor (1000) rechnen
scoreboard players operation "§o§7Stunden " clock /= "§o§7Stundenfaktor " clock
# Wir benötigen um die Uhr korrekt darzustellen von jeder einzelnen Zahlenstelle 
# den Wert, Tausenderstelle der Zeit ist der Anfang
# zuerst setzen wir den Wert gleich Rawcounter (Umständlichkeit, siehe oben)
scoreboard players operation "§o§7Tausenderstelle d. Zeit " clock = "§o§7Rawcounter " clock
# Nun teilen wir den Wert durch 1000 (Stundenfaktor)
scoreboard players operation "§o§7Tausenderstelle d. Zeit " clock /= "§o§7Stundenfaktor " clock
# und multiplizieren diesen wirder mit 1000 (Stundenfaktor)
# um die Nachkommastellen los zu werden
scoreboard players operation "§o§7Tausenderstelle d. Zeit " clock *= "§o§7Stundenfaktor " clock
# Nun erstellen wir uns einen Rawcounter für die Minuten
# also setzen wir den Wert zuerst gleich Rawcounter
scoreboard players operation "§o§7Minuten Rawcounter " clock = "§o§7Rawcounter " clock
# Natürlich hilft das wenig, deshalb ziehen wir die zuvor ermittelten 
# Tausenderstellen einfach ab
scoreboard players operation "§o§7Minuten Rawcounter " clock -= "§o§7Tausenderstelle d. Zeit " clock
# Nun berechnen wir die Minuten, zuerst setzen wir diese gleich dem neuen
# Minuten Rawcounter
scoreboard players operation "§o§7Minuten " clock = "§o§7Minuten Rawcounter " clock
# Multiplizieren dann mit 6 (Zeitfaktor)
scoreboard players operation "§o§7Minuten " clock *= "§o§7Zeitfaktor " clock
# und teilen dann durch 100 (Minutenfaktor)
scoreboard players operation "§o§7Minuten " clock /= "§o§7Minutenfaktor " clock

# Nun können jeweils die einzelnen Dezimalstellen berechnet werden
# damit die Uhr korrekt ausgegeben werden kann
scoreboard players operation "§o§7MinutenZehner " clock = "§o§7Minuten " clock
scoreboard players operation "§o§7MinutenEiner " clock = "§o§7Minuten " clock
scoreboard players operation "§o§7MinutenZehner " clock /= "§o§7Dezimalfaktor " clock
scoreboard players operation "§o§7MinutenEiner " clock %= "§o§7Dezimalfaktor " clock
scoreboard players operation "§o§7StundenZehner " clock = "§o§7Stunden " clock
scoreboard players operation "§o§7StundenEiner " clock = "§o§7Stunden " clock
scoreboard players operation "§o§7StundenZehner " clock /= "§o§7Dezimalfaktor " clock
scoreboard players operation "§o§7StundenEiner " clock %= "§o§7Dezimalfaktor " clock

# Nun geben wir dauerhaft die Zeit bei jedem Spieler in der sog. "actionbar" aus, 
# dies erfolgt aber ausschießlich wenn KEIN match stattfindet
# hierbei werden die zuvor ermittelten Dezimalstellen EINZELN ausgegeben
execute if score "§o§7Match" matchvars matches 0 run titleraw @a actionbar {"rawtext":[{"text":"§f\n\n\n\n"},{"score":{"name":"§o§7StundenZehner ","objective":"clock"}},{"score":{"name":"§o§7StundenEiner ","objective":"clock"}},{"text":":"},{"score":{"name":"§o§7MinutenZehner ","objective":"clock"}},{"score":{"name":"§o§7MinutenEiner ","objective":"clock"}}]}
