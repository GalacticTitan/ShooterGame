extends Node2D

class_name LevelParent


var laser_scene: PackedScene = preload("res://Scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://Scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://Scenes/items/item.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open", _on_container_opened)

func _on_container_opened(pos, direction):
	var item = item_scene.instantiate()
	item.position = pos
	$Items.call_deferred('add_child', item)


func _on_player_shoot_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)
	$UI.update_laser_text()

func _on_player_throw_grenade(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()


func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1).set_trans(Tween.TRANS_ELASTIC)


func _on_house_player_exit():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 1).set_trans(Tween.TRANS_ELASTIC)
