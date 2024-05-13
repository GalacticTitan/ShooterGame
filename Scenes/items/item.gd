extends Area2D

var rotation_speed: int = 5
var available_options = ['laser', 'laser', 'laser', 'laser', 'grenade', 'health']
var type = available_options[randi() % available_options.size()]


func _ready():
	match type:
		'laser':
			$Sprite2D.modulate = Color(0.1 ,0.2 , 0.8)
		'grenade':
			$Sprite2D.modulate = Color(0.8 ,0.2 , 0.1)
		'health':
			$Sprite2D.modulate = Color(0.2 ,0.8 , 0.1)

func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(body):
	match type:
		'laser':
			Globals.laser_amount += 5
		'grenade':
			Globals.grenade_amount += 1
		'health':
			Globals.health += 10
	queue_free()
