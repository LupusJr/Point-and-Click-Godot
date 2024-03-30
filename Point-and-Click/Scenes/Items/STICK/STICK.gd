extends Area2D

@onready var label = $Label
@export var item: InvItem
var player = null
var mouse = false
var playertest = false

func _ready():
	label.visible = false

func _process(_delta):
	if Input.is_action_just_pressed("left_click") && playertest == true && mouse == true:
			player.collect(item)
			queue_free()

func _on_body_entered(body):
	player = body
	playertest = true

func _on_body_exited(body):
	playertest = false

func _on_mouse_entered():
	label.visible = true
	mouse = true

func _on_mouse_exited():
	label.visible = false
	mouse = false
