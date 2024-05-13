extends Node

signal health_change
signal laser_change
signal grenade_change

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
		health = value
		health_change.emit()
