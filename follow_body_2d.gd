extends CharacterBody2D

#@onready var player = get_node("res://character_body_2d.tscn")
var player_position
var target_position
var count
# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = get_parent()
	timer.timeout.connect(_on_timer_timeout)
	count = Global.count
	Global.count += 1
	#print(timer)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(count == 0):
		player_position = $"../../CharacterBody2D".position
	elif (count > 0):
		player_position = get_parent().get_child(count - 1).position
	#if(position.distance_to(player_position) > 3):

func _on_timer_timeout():
	position = player_position
