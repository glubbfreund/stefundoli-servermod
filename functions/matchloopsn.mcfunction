execute if block ~2 ~1 ~-1 lit_redstone_lamp run scoreboard players add @p[hasitem={item=bow,location=slot.weapon.mainhand}] playermatch 1
execute if block ~2 ~1 ~-2 lit_redstone_lamp run scoreboard players add @p[hasitem={item=bow,location=slot.weapon.mainhand}] playermatch 1
execute if block ~2 ~1 ~-3 lit_redstone_lamp run scoreboard players add @p[hasitem={item=bow,location=slot.weapon.mainhand}] playermatch 1
execute if block ~2 ~1 ~-4 lit_redstone_lamp run scoreboard players add @p[hasitem={item=bow,location=slot.weapon.mainhand}] playermatch 1
execute if block ~2 ~1 ~-5 lit_redstone_lamp run scoreboard players add @p[hasitem={item=bow,location=slot.weapon.mainhand}] playermatch 1
execute if block ~2 ~1 ~-6 lit_redstone_lamp run scoreboard players add @p[hasitem={item=bow,location=slot.weapon.mainhand}] playermatch 1
execute if block ~2 ~1 ~-1 lit_redstone_lamp run title @a[r=40] actionbar §g1 Punkt 
execute if block ~2 ~1 ~-2 lit_redstone_lamp run title @a[r=40] actionbar §g2 Punkte
execute if block ~2 ~1 ~-3 lit_redstone_lamp run title @a[r=40] actionbar §g3 Punkte 
execute if block ~2 ~1 ~-4 lit_redstone_lamp run title @a[r=40] actionbar §g4 Punkte 
execute if block ~2 ~1 ~-5 lit_redstone_lamp run title @a[r=40] actionbar §g5 Punkte 
execute if block ~2 ~1 ~-6 lit_redstone_lamp run title @a[r=40] actionbar §g6 Punkte 
execute as @p[hasitem={item=bow,location=slot.weapon.mainhand}] if block ~2 ~1 ~-4 lit_redstone_lamp run xp 1 @p[hasitem={item=bow,location=slot.weapon.mainhand}]
execute as @p[hasitem={item=bow,location=slot.weapon.mainhand}] if block ~2 ~1 ~-5 lit_redstone_lamp run xp 2 @p[hasitem={item=bow,location=slot.weapon.mainhand}]
execute as @p[hasitem={item=bow,location=slot.weapon.mainhand}] if block ~2 ~1 ~-6 lit_redstone_lamp run xp 3 @p[hasitem={item=bow,location=slot.weapon.mainhand}]
execute as @p[hasitem={item=bow,location=slot.weapon.mainhand}] if block ~2 ~1 ~-4 lit_redstone_lamp run playsound random.orb @p[hasitem={item=bow,location=slot.weapon.mainhand}]
execute as @p[hasitem={item=bow,location=slot.weapon.mainhand}] if block ~2 ~1 ~-5 lit_redstone_lamp run playsound random.orb @p[hasitem={item=bow,location=slot.weapon.mainhand}]
execute as @p[hasitem={item=bow,location=slot.weapon.mainhand}] if block ~2 ~1 ~-6 lit_redstone_lamp run playsound random.orb @p[hasitem={item=bow,location=slot.weapon.mainhand}] 
execute if score @p[hasitem={item=bow,location=slot.weapon.mainhand}] playermatch > "§o§7Sieger" matchvars run scoreboard players operation "§o§7Sieger" matchvars = @p[hasitem={item=bow,location=slot.weapon.mainhand}] playermatch 
