extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var temp
var direction

func _ready():
	set_position($".".position)
	
func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
	#	velocity.y += gravity * delta
	

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	direction = (Vector2(input_dir.x, input_dir.y)).normalized()
	if(direction and temp != direction):
		temp = direction
		$"../Timer".start()
		
		#velocity.y = 0
		#velocity.x = direction * SPEED
	#elif direction_y:
	#	set_position(Vector2(0,50 * direction_y) + get_position())
	
	#player_position = player.position
	#target_position = (player_position - position).normalized()
	#if(position.distance_to(player_position) > 3):
	#	move_and_slide()
	


func _on_timer_timeout():
	set_position(Vector2(54 * temp.x,0) + get_position())
	set_position(Vector2(0,54 * temp.y) + get_position())


func _on_area_borders_body_entered(body):
	set_position(Vector2(295,241))
	queue_free_children($"../Timer")
	Global.count = 0
	
static func queue_free_children(node: Node) -> void:
	for child in node.get_children():
		child.queue_free()


func _on_area_2d_body_entered(body):
	if(body != $"."):
		set_position(Vector2(295,241))
		queue_free_children($"../Timer")
		Global.count = 0
