extends Node2D

class_name LevelParent


var laser_scene: PackedScene = preload("res://Scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://Scenes/projectiles/grenade.tscn")


func _on_player_shoot_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)

func _on_player_throw_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade) 


func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1).set_trans(Tween.TRANS_ELASTIC)
	print("player entered")


func _on_house_player_exit():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 1).set_trans(Tween.TRANS_ELASTIC)
	print("player exit")
