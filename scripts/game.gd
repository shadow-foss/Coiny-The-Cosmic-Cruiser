extends Node2D
signal no_of_coins(coins_on_screen)
signal alive(is_alive)
#variables
#onready sets the variable when the game starts
#geting some nodes as variables to change it in script. example: to change score or play audio
#$node is used instead of get_node("node")
@onready var hud = $UI/HUD
@onready var coin_aud = $coin_sound
@onready var coin_cont = $coin_spawner/coin_container
@onready var player = $Player
@onready var R_menu = $"UI/restart_menu"
@onready var turret = $turret
var coins_on_screen = 0
var score = 0
var lives = 3
var paused = false
var is_alive = true
func _process(delta): 
	emit_signal("alive", is_alive)
	emit_signal("no_of_coins",coins_on_screen ) # emits the signaml with no.of coins in scene as parameter



func _on_coin_spawner_coin_spawned(coin_inst): #connected the signal from coin spawner. 
	coin_inst.connect("coin_collected", collected) #connects coin collected signal to colleced() func
	coins_on_screen += 1#since coin is added var no.of coins is increased by one will be removed if collected in collected func
	coin_cont.add_child(coin_inst)#adds the coins as a child to the coin_container

func collected():
	coins_on_screen -=1 # if a coin is colleced is freed/ removed from scene so subractt from total coins
	coin_aud.play() #plays the coin_collected audio
	score += 1 #how much score should increase per coin
	hud.set_score(score) #sets the score to the score label 


func _on_player_took_damage():
	lives -= 1
	hud.set_life(lives)
	if lives <= 0:
		player.die()
		is_alive = false
		await get_tree().create_timer(2).timeout
		R_menu.show()
