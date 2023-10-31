###############################################################################################################
#                                                                                                             #
# Dieses Skript stellt den Gameloop für das Minigame bereit und Prüft die entsprechende Punktzahl der Spieler #
# Leider ist dieses Skript aktuell noch doppelt vorhanden und unterscheidet sich nur dahingehend, wo dieses   #
# im Spiel verwendet wird. Dies wird künftig behoben, soll aber eine Quick&Dirty lösung ermöglichen. Bei der  #
# Verwendung ist auf die Himmelsrichtung des Spielfeldes Rücksicht zu nehmen.                                 #
# Dieses Skript wird bei Spielfeldern in Richtung Ost nach West verwendet.
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
# Im ersten Block werden die Redstone Lampen geprüft die sich relativ zum Commandoblock an der entsprechenden
# Stelle befinden und anhand der Zielscheibe und der Redstone Stärke angesprochen werden
# Dabei wird geprüft welcher der Spieler den Bogen in der Hand hat
execute if block ~-1 ~1 ~-2 lit_redstone_lamp run scoreboard players add @a[x=~7,y=~1,z=~-2, r=1] playermatch 1
execute if block ~-2 ~1 ~-2 lit_redstone_lamp run scoreboard players add @a[x=~7,y=~1,z=~-2, r=1] playermatch 1
execute if block ~-3 ~1 ~-2 lit_redstone_lamp run scoreboard players add @a[x=~7,y=~1,z=~-2, r=1] playermatch 1
execute if block ~-4 ~1 ~-2 lit_redstone_lamp run scoreboard players add @a[x=~7,y=~1,z=~-2, r=1] playermatch 1
execute if block ~-5 ~1 ~-2 lit_redstone_lamp run scoreboard players add @a[x=~7,y=~1,z=~-2, r=1] playermatch 1
execute if block ~-6 ~1 ~-2 lit_redstone_lamp run scoreboard players add @a[x=~7,y=~1,z=~-2, r=1] playermatch 1
# Nun alle Spieler, wieder mit ensprechender Prüfung der Redstonelampen zuvor im Umkreis von 40 Blöcken informieren
execute if block ~-1 ~1 ~-2 lit_redstone_lamp run title @a[r=40] actionbar §g1 Punkt 
execute if block ~-2 ~1 ~-2 lit_redstone_lamp run title @a[r=40] actionbar §g2 Punkte
execute if block ~-3 ~1 ~-2 lit_redstone_lamp run title @a[r=40] actionbar §g3 Punkte 
execute if block ~-4 ~1 ~-2 lit_redstone_lamp run title @a[r=40] actionbar §g4 Punkte 
execute if block ~-5 ~1 ~-2 lit_redstone_lamp run title @a[r=40] actionbar §g5 Punkte 
execute if block ~-6 ~1 ~-2 lit_redstone_lamp run title @a[r=40] actionbar §g6 Punkte 
# Bei hohen Punktzahlen geben wir XP und einen entsprechenden Ton an den Jeweiligen Spieler aus
execute as @a[x=~7,y=~1,z=~-2, r=1] if block ~-4 ~1 ~-2 lit_redstone_lamp run xp 1 @a[x=~7,y=~1,z=~-2, r=1]
execute as @a[x=~7,y=~1,z=~-2, r=1] if block ~-5 ~1 ~-2 lit_redstone_lamp run xp 2 @a[x=~7,y=~1,z=~-2, r=1]
execute as @a[x=~7,y=~1,z=~-2, r=1] if block ~-6 ~1 ~-2 lit_redstone_lamp run xp 3 @a[x=~7,y=~1,z=~-2, r=1] 
execute as @a[x=~7,y=~1,z=~-2, r=1] if block ~-4 ~1 ~-2 lit_redstone_lamp run playsound random.orb @a[x=~7,y=~1,z=~-2, r=1]
execute as @a[x=~7,y=~1,z=~-2, r=1] if block ~-5 ~1 ~-2 lit_redstone_lamp run playsound random.orb @a[x=~7,y=~1,z=~-2, r=1] 
execute as @a[x=~7,y=~1,z=~-2, r=1] if block ~-6 ~1 ~-2 lit_redstone_lamp run playsound random.orb @a[x=~7,y=~1,z=~-2, r=1] 
# Sollte der Score höher sein als der bisher höchste, den Sieger neu zuordnen 
execute if score @a[x=~7,y=~1,z=~-2, r=1] playermatch > "§o§7Sieger" matchvars run scoreboard players operation "§o§7Sieger" matchvars = @a[x=~7,y=~1,z=~-2, r=1] playermatch 
