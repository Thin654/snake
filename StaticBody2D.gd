extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	var rng = RandomNumberGenerator.new()
	var x_position = rng.randf_range(50, 650)
	var y_position = rng.randf_range(50,650)
	$".".position = Vector2(x_position, y_position)
	var scene = preload("res://follow_body_2d.tscn").instantiate()
	$"../Timer".add_child(scene)
	
	
