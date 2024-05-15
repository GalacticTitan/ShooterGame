extends Area2D

var rotation_speed: int = 5
var available_options = ['laser', 'laser', 'laser', 'laser', 'grenade', 'health']
var type = available_options[randi() % available_options.size()]

var direction: Vector2
var distance: int = randi_range(150, 250)

func _ready():
	match type:
		'laser':
			$Sprite2D.modulate = Color(0.1 ,0.2 , 0.8)
		'grenade':
			$Sprite2D.modulate = Color(0.8 ,0.2 , 0.1)
		'health':
			$Sprite2D.modulate = Color(0.2 ,0.8 , 0.1)
			#
	var target_pos = position + direction * distance
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", target_pos, 0.5)
	tween.tween_property(self, 'scale', Vector2(1,1), 0.3).from(Vector2(0,0))

func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(body):
	if body.get_name() == 'Player':
		match type:
			'laser':
				Globals.laser_amount += 5
			'grenade':
				Globals.grenade_amount += 1
			'health':
				Globals.health += 10
		queue_free()
	pass
