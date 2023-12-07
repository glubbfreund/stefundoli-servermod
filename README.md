# StefUNDOlis Servermod
Server Modification of our private Minecraft Bedrock Server. Features are:
- A lot of mobs are afraid of dogs and cats
- A function for longer daycycle with a custom behavior for allowing to skip the night by going to bed in the evening (Message appears if possible, needs redstone circuit, see https://www.youtube.com/watch?v=j4yZVKxPeTY&t=98s&ab_channel=ArcticSharkGames, sleep as in vanilla but you need to stay on the bed before clicking sleep)
- A 24h clock
- A custom game

Init with following commands after creating the redstone circuit (images and comments)
/scoreboard objectives add bed dummy "§2Interne Bettwerte" 
/scoreboard objectives add clock dummy "§3Interne Uhr"
/scoreboard objectives add matchvars dummy "§5Interne Matchwerte"
/scoreboard players add "§o§7Stundenverschiebung " clock 18000
/scoreboard players add "§o§7Stundenfaktor " clock 1000 
/scoreboard players add "§o§7Minutenfaktor " clock 100 
/scoreboard players add "§o§7Dezimalfaktor " clock 10 
/scoreboard players add "§o§7Zeitfaktor " clock 6 
/scoreboard players add "§o§7Match" matchvars 0 
