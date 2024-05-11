extends Node2D


var xLocation = 0;
var returnBack: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
#1:09:33


func _on_gate_player_entered_gate():
	print("player has entered the gate")
