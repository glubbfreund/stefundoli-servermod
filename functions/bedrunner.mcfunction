execute at @a if block ~~-1.9~ bed run scoreboard players add "§7§oSpieler im Bett " bed 1
execute if score "§7§oMomentane Spieler " bed = "§7§oSpieler im Bett " bed run time set sunrise
execute if score "§7§oMomentane Spieler " bed = "§7§oSpieler im Bett " bed run scoreboard players set "§o§7Rawcounter " clock 24000 
execute if score "§7§oMomentane Spieler " bed = "§7§oSpieler im Bett " bed run titleraw @a title {"rawtext":[{"text":"§l§6Guten Morgen!"}]}
