
extends KinematicBody2D

# This is a demo showing how KinematicBody2D
# move_and_slide works.

# Member variables
const MOTION_SPEED = 160 # Pixels/second

func _process(delta):
	var spr = get_node("sprite")
	var clr = spr.get_modulate()
	clr.r8 = (clr.r8 + 1) % 255 
	clr.g8 = (clr.g8 - 1) % 255
	
	spr.set_modulate(clr)

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

func _on_PortalArea2D_body_entered(body):
	get_tree().change_scene("res://second.tscn")