extends Node2D

var missile = preload("res://scene/missile.tscn")
@onready var timer = $Cooldown
@onready var raycast = $RayCast2D
@onready var turret = $Shooting_part
@onready var muzzle = $Shooting_part/muzzle
@onready var missile_cont = $missile_container
var player 

func _ready():
	player = get_parent().find_child("Player")


func _physics_process(_delta):
	_aim()

 
func _aim():
	raycast.target_position = to_local(player.position)
	turret.rotation = to_local(player.position).angle()
 

func _shoot():
	var bullet = missile.instantiate()
	bullet.position = position
	bullet.direction = -(raycast.target_position).normalized()
	bullet.rotation = get_angle_to(player.position)
	missile_cont.add_child(bullet)


func _on_cooldown_timeout():
	_shoot()
