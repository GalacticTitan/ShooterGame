extends Area2D

@export var speed: int = 2000

var direction: Vector2 = Vector2.UP

func _ready():
	$SelfDestructTimer.start()

func _process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	if "hit" in body:
		body.hit()
	if body != null and body != $"../../Player":
		queue_free()

func _on_timer_timeout():
	print("timeout")
	queue_free()
