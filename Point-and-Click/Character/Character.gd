extends CharacterBody2D


const speed = 30
@onready var nav_agent_2d = $NavigationAgent2D
var clickPosition = Vector2()
var dir


func _physics_process(_delta):
	
	if Input.is_action_just_pressed("left_click"):
		clickPosition = get_global_mouse_position()
		buildpath()
		
	if position.distance_to(clickPosition) > 0.5:
		dir = to_local(nav_agent_2d.get_next_path_position()).normalized()
		velocity = dir * speed
	else:
		velocity = dir * 0
	move_and_slide()
		
func buildpath():
	nav_agent_2d.target_position = clickPosition
