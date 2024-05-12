extends RigidBody2D


const speed: int = 500

func explode():
	$AnimationPlayer.play("Explosion")
