extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal shootLaser(pos, direction)
signal throwGrenade(pos, direction)

@export var max_speed: int = 500
var speed: int  = max_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	Globals.player_pos = global_position
	
	look_at(get_global_mouse_position())
	
	var playerDirection = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("pirimary action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		$CPUParticles2D.emitting = true
		var laser_markers = $LaserStartPositions.get_children()
		var selected_marker = laser_markers[randi() % laser_markers.size()]
		shootLaser.emit(selected_marker.global_position, playerDirection)
		can_laser = false
		$LaserReloadTimer.start()
		
	if Input.is_action_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		var laser_markers = $LaserStartPositions.get_children()
		var selected_marker = laser_markers[1]
		throwGrenade.emit(selected_marker.global_position, playerDirection)
		can_grenade = false
		$GrenadeReloadTImer.start()

func _on_timer_timeout():
	can_laser = true


func _on_grenade_reload_t_imer_timeout():
	can_grenade = true

func hit():
	Globals.health -= 10
