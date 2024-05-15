extends Node

signal health_change
signal laser_change
signal grenade_change


var player_vulnerable: bool = true
var laser_amount = 20:
	set(value):
		laser_amount = value
		laser_change.emit()
var grenade_amount = 10:
	set(value):
		grenade_amount = value
		grenade_change.emit()
var health = 100 :
	set(value):
		if value > health:
			health = min(value, 100)
		elif player_vulnerable:
			health = value
			player_vulnerable = false
			player_vulnerable_timer()
			health_change.emit()
		
var player_pos: Vector2

func player_vulnerable_timer():
	await get_tree().create_timer(0.5).timeout
	player_vulnerable = true
