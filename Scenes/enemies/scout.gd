extends CharacterBody2D

var player_nearby: bool = false

signal laser(pos, direction)

var can_laser: bool = true
var right_gun: bool = true
var health: int = 30
var invulnerable: bool = false

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player_nearby:
		look_at(Globals.player_pos)
		if can_laser:
			var marker = $LaserSpawnPositions.get_child(right_gun)
			right_gun = !right_gun
			var pos: Vector2 = marker.global_position
			var direction = (Globals.player_pos - position).normalized()
			laser.emit(pos, direction)
			can_laser = false
			$Timers/LaserCooldown.start()


func _on_attack_area_body_entered(_body):
	player_nearby = true


func _on_attack_area_body_exited(_body):
	player_nearby = false


func _on_laser_cooldown_timeout():
	can_laser = true


func hit():
	if not invulnerable:
		health -= 10
		invulnerable = true
		$Timers/InvulnerabilityCooldown.start()
		$Sprite2D.material.set_shader_parameter("progress", 1)
	if health <= 0:
		queue_free()


func _on_invulnerability_cooldown_timeout():
	invulnerable = false
	$Sprite2D.material.set_shader_parameter("progress", 0)
