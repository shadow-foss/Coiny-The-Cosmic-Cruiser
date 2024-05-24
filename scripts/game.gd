extends Node2D
signal no_of_coins(coins_on_screen)
#variables
#onready sets the variable when the game starts
#geting some nodes as variables to change it in script. example: to change score or play audio
#$node is used instead of get_node("node")
@onready var hud = $UI/HUD
@onready var coin_aud = $coin_sound
@onready var coin_cont = $coin_container
@onready var player = $Player
@onready var pause_menu = $UI/pause_menu

var coins_on_screen = 0
var score = 0
var lives = 3
var paused = false

func _process(delta): 
	if Input.is_action_just_pressed("pause_resume"): # when the escape key is pressed it calls pause func
		pause()
	emit_signal("no_of_coins",coins_on_screen ) # emits the signaml with no.of coins in scene as parameter

func _on_coin_spawner_coin_spawned(coin_inst, spawn_pos): #connected the signal from coin spawner. 
	coin_inst.connect("coin_collected", collected) #connects coin collected signal to colleced() func
	var too_close_to_player = true
	
	#while loop to make sure coins dont spawn on player
	while too_close_to_player: #or too_close_to_turret:
		if spawn_pos.distance_to(player.position) > 200.0: #gets distance between player and coin
			too_close_to_player = false # if distance is higher var is set false and loop breaks so coin is spawned
		else:
			spawn_pos = Vector2(randf_range(50,1850),randf_range(50,1000))#if its near to player spawn_pos is changed
	coin_inst.position = spawn_pos #assigning spawn_pos to actual coin after its confirmed
	coins_on_screen += 1#since coin is added var no.of coins is increased by one will be removed if collected in collected func
	coin_cont.add_child(coin_inst)#adds the coins as a child to the coin_container

func collected():
	coins_on_screen -=1 # if a coin is colleced is freed/ removed from scene so subractt from total coins
	coin_aud.play() #plays the coin_collected audio
	score += 1 #how much score should increase per coin
	hud.set_score(score) #sets the score to the score label 

func pause(): # func for pause_resume
	if paused:# gets the variable pause assigned as false at the start of code
		pause_menu.hide() #hides he pause menu
		Engine.time_scale = 1 # since its being resume engine time is 1
		paused = false # sets  that game has been resumed
	else: 
		pause_menu.show()#shows the pause menu
		Engine.time_scale = 0#sets engine time to zero since its paused
		paused = true# sets that game is paused
