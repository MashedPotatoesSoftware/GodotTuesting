extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const MOTION_SPEED = 160 # Pixels/second

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_key_pressed(KEY_W):
		motion += Vector2(0, -1)
	if Input.is_key_pressed(KEY_S):
		motion += Vector2(0, 1)
	if Input.is_key_pressed(KEY_A):
		motion += Vector2(-1, 0)
	if Input.is_key_pressed(KEY_D):
		motion += Vector2(1, 0)
		
	motion = motion.normalized() * MOTION_SPEED

	move_and_slide(motion)