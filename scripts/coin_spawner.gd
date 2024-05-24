extends Node2D

signal coin_spawned(coin_inst)#sends a signal coin is spawned
var coin = preload("res://scene/coin.tscn") #preloading the coin scene as coin
var number_coins = 0 #creates a variable

func spawn_coin(): #custom func
	var coin_inst = coin.instantiate() #instantiates the coin scene
	var spawn_pos = Vector2(randf_range(50,1850),randf_range(50,1000))#gets an random position for spawn
	#better dont change the random values it WORKS
	emit_signal("coin_spawned", coin_inst, spawn_pos)#emits signal coin spawned with parameters spawn_position,coin_instance



func _on_timer_timeout(): #connects timeout signal of timer node in coin_spawner
	if number_coins <= randf_range(10,16): #gets random max value for no of coins
		spawn_coin()
	else:
		pass 
		#adjusting timer in coin_spawner node increases frequency of coins being spawned


func _on_game_no_of_coins(number):
	number_coins = number# the number from signal is assigned to a local var in script since it cant be accessed outside signal
