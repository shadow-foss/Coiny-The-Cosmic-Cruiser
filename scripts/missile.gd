extends Area2D

var direction = Vector2.RIGHT
var speed = 350

var player 

func _ready():
	player = get_parent().find_child("Player")
 
func _physics_process(delta):
	position += direction * speed* delta
	position.x += 250 * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	queue_free()
	body.take_damage()
