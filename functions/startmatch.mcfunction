###############################################################################################################
#                                                                                                             #
# Startmatch script, dieses Skript dient dem "Custom Game" und muss einem Knopf mit redstone gesteuerten      #
# Kommandoblock zugeordnet werden, welcher das Spiel startet                                                  #
#                                                                                                             #
###############################################################################################################
#
# In der Tabelle matchvars wird der Wert matches gepflegt, steht dieser auf 1, läuft bereits ein Match
# hier sollte also eine Warnung an alle Spieler im Umkreis ausgegeben werden. 
# Der Ton ist scheinbar ungültig und muss noch korrigiert werden.
execute at @a[r=4] if score "§o§7Match" matchvars matches 1 run title @a[r=4] actionbar §l§4Es läuft bereits ein Match!
execute at @a[r=4] if score "§o§7Match" matchvars matches 1 run playsound bubble.pop
# Ab jetzt wird jede Zeile nur dann ausgeführt, wenn tatsächlich kein Match läuft
# hier wird eine Tabelle playermatch erzeugt, diese wird als tatsächlich sichtbare Anzeige für die Spieler verwendet.    
execute unless score "§o§7Match" matchvars matches 1 run scoreboard objectives add playermatch dummy "§6Match"
# Matchvars dagegen ist eine versteckte Tabelle die dem zwischenspeichern von Werten gilt. 
# Zuerst pflegen wir hier die Anzahl der Spieler ein, welche wir aber initial auf 0 setzen
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players add "§o§7Spieler" matchvars 0
# Nun fügen wir alle Spieler im Umkreis von 4 Blöcken dem Match hinzu
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players add @a[r=4] playermatch 0
# und hier erhöhen wir den Spielerzähler bei jedem Spieler der sich im Umkreis von 4 Blöcken befindet um 1
execute at @a[r=4] unless score "§o§7Match" matchvars matches 1 run scoreboard players add "§o§7Spieler" matchvars 1 
# Hier wird der Wert Runde Nummer in die sichtbare Tabelle eingetragen damit die Spieler wissen, die 
# wie vielte "Runde" gespielt wurde, sprich wie oft jeder Spieler dran war. 
# Die Berechnung des Wertes erfolgt im Matchloop
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players set "§o§7Runde " playermatch 1 
# Wie viele Pfeile wurden geworfen? Versteckter Wert, welcher im AddArow script gezählt wird
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players set "§o§7gezählte Pfeile" matchvars 0 
# Wurf Nummer wird auch im AddArrow script gezählt, wird aber dem Spieler gezeigt. Hier kann der SPieler sehen, 
# bei Welchem Wurf er ist, 1, 2, oder 3. 
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players set "§o§7Pfeil " playermatch 1 
# Rundengröße berechnet, wie groß eine Runde ist. Startwert ist 3, welcher als Berechnungsgrundlage dient. 
# Berechnung erfolgt anschließend in AddArrow und wird mit der Spielerzahl multipliziert. (bsp. 2 mal 3 bedeutet Rundengröße 6 Pfeile)
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players set "§o§7Rundengröße " matchvars 3 
# Anschließend multiplizieren wir diesen Wert mit der Anzahl der Spieler, 
# dieser Wert wurde im Skript StartMatch initialisiert (3, weil 3 pro Spieler) 
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players operation "§o§7Rundengröße " matchvars *= "§o§7Spieler" matchvars  
# Der Siegerwert, wird im Matchloop benötigt um den Sieger versteckt (matchvars) zu tracken 
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players add "§o§7Sieger" matchvars 0
# Playermatch soll sichtbar sein, daher muss dieser nun angezeigt werden 
execute unless score "§o§7Match" matchvars matches 1 run scoreboard objectives setdisplay sidebar playermatch
# Sound abspielen (funktioniert noch nicht) und alle teilnehmenden Spieler über Spielstart informieren
execute unless score "§o§7Match" matchvars matches 1 run playsound firework.launch
execute unless score "§o§7Match" matchvars matches 1 run title @a[r=4] actionbar §l§6Match gestartet!
# Matchmarker auf ein setzen damit die Skripte wissen, dass aktuell ein Spiel läuft
execute unless score "§o§7Match" matchvars matches 1 run scoreboard players add "§o§7Match" matchvars 1
