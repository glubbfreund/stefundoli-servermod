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
execute if block ~-1 ~1 ~-2 lit_redstone_lamp run scoreboard players add @p[hasitem={item=bow,location=slot.weapon.mainhand}] playermatch 1
execute if block ~-2 ~1 ~-2 lit_redstone_lamp run scoreboard players add @p[hasitem={item=bow,location=slot.weapon.mainhand}] playermatch 1
execute if block ~-3 ~1 ~-2 lit_redstone_lamp run scoreboard players add @p[hasitem={item=bow,location=slot.weapon.mainhand}] playermatch 1
execute if block ~-4 ~1 ~-2 lit_redstone_lamp run scoreboard players add @p[hasitem={item=bow,location=slot.weapon.mainhand}] playermatch 1
execute if block ~-5 ~1 ~-2 lit_redstone_lamp run scoreboard players add @p[hasitem={item=bow,location=slot.weapon.mainhand}] playermatch 1
execute if block ~-6 ~1 ~-2 lit_redstone_lamp run scoreboard players add @p[hasitem={item=bow,location=slot.weapon.mainhand}] playermatch 1
execute if block ~-1 ~1 ~-2 lit_redstone_lamp run title @a[r=40] actionbar §g1 Punkt 
execute if block ~-2 ~1 ~-2 lit_redstone_lamp run title @a[r=40] actionbar §g2 Punkte
execute if block ~-3 ~1 ~-2 lit_redstone_lamp run title @a[r=40] actionbar §g3 Punkte 
execute if block ~-4 ~1 ~-2 lit_redstone_lamp run title @a[r=40] actionbar §g4 Punkte 
execute if block ~-5 ~1 ~-2 lit_redstone_lamp run title @a[r=40] actionbar §g5 Punkte 
execute if block ~-6 ~1 ~-2 lit_redstone_lamp run title @a[r=40] actionbar §g6 Punkte 
execute as @p[hasitem={item=bow,location=slot.weapon.mainhand}] if block ~-4 ~1 ~-2 lit_redstone_lamp run xp 1 @p[hasitem={item=bow,location=slot.weapon.mainhand}]
execute as @p[hasitem={item=bow,location=slot.weapon.mainhand}] if block ~-5 ~1 ~-2 lit_redstone_lamp run xp 2 @p[hasitem={item=bow,location=slot.weapon.mainhand}]
execute as @p[hasitem={item=bow,location=slot.weapon.mainhand}] if block ~-6 ~1 ~-2 lit_redstone_lamp run xp 3 @p[hasitem={item=bow,location=slot.weapon.mainhand}] 
execute as @p[hasitem={item=bow,location=slot.weapon.mainhand}] if block ~-4 ~1 ~-2 lit_redstone_lamp run playsound random.orb @p[hasitem={item=bow,location=slot.weapon.mainhand}]
execute as @p[hasitem={item=bow,location=slot.weapon.mainhand}] if block ~-5 ~1 ~-2 lit_redstone_lamp run playsound random.orb @p[hasitem={item=bow,location=slot.weapon.mainhand}] 
execute as @p[hasitem={item=bow,location=slot.weapon.mainhand}] if block ~-6 ~1 ~-2 lit_redstone_lamp run playsound random.orb @p[hasitem={item=bow,location=slot.weapon.mainhand}] 
execute if score @p[hasitem={item=bow,location=slot.weapon.mainhand}] playermatch > "§o§7Sieger" matchvars run scoreboard players operation "§o§7Sieger" matchvars = @p[hasitem={item=bow,location=slot.weapon.mainhand}] playermatch 
