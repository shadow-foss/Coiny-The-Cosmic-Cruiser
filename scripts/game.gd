extends Node2D
signal no_of_coins(coins_on_screen)
signal alive(is_alive)
#variables
#onready sets the variable when the game starts
#geting some nodes as variables to change it in script. example: to change score or play audio
#$node is used instead of get_node("node")
@onready var hud = $UI/HUD
@onready var coin_aud = $"moving stuffs"/coin_aud
@onready var coin_cont = $"moving stuffs"/coin_container
@onready var player = $Player
@onready var R_menu = $"UI/restart_menu"
var coins_on_screen = 0
var score = 0
var lives = 3
var paused = false
var is_alive = true
@onready var moving_stuffs = $"moving stuffs"
func _physics_process(delta): 
	moving_stuffs.position.x += 300* delta
	emit_signal("alive", is_alive)
	emit_signal("no_of_coins",coins_on_screen ) # emits the signaml with no.of coins in scene as parameter



func _on_coin_spawner_coin_spawned(coin_inst): 
	coin_inst.connect("coin_collected",collected) #connects coin collected signal to colleced() func
	coins_on_screen += 1#since coin is added var no.of coins is increased by one will be removed if collected in collected func
	coin_cont.add_child(coin_inst)#adds the coins as a child to the coin_container

func collected(deleted):
	if deleted == 1:
		coins_on_screen -=1
	elif deleted == 0:
		coins_on_screen -=1# if a coin is colleced is freed/ removed from scene so subractt from total coins
		coin_aud.play()
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




