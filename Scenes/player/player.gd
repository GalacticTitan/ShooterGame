extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	if Input.is_action_pressed("pirimary action") and can_laser:
		print("shoot laser")
		can_laser = false
		$LaserReloadTimer.start()
		
	if Input.is_action_pressed("secondary action") and can_grenade:
		print("shoot grenade")
		can_grenade = false
		$GrenadeReloadTImer.start()

func _on_timer_timeout():
	can_laser = true


func _on_grenade_reload_t_imer_timeout():
	can_grenade = true
