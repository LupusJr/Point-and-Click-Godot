extends Area2D

@export var item: InvItem
var mouse = false
var player = null
var playertest = false
@onready var label = $Label


func _ready():
	label.visible = false
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("left_click") && playertest == true && mouse == true:
		player.collect(item)
		queue_free()

func _on_mouse_entered():
	label.visible = true
	mouse = true


func _on_mouse_exited():
	label.visible = false
	mouse = false




func _on_body_entered(body):
	player = body
	playertest = true


func _on_body_exited(body):
	playertest = false

