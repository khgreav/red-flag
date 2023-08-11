extends CharacterBody2D

@export var start_pos: Vector2 = Vector2(0, 1)
@export var movement_speed: float = 200.0
@export var jump_height: float = 20.0


@onready var animation_tree = $AnimationTree

func _ready():
	on_input_update_animation(start_pos)

func _physics_process(_delta):
	var direction = Vector2(
		Input.get_action_strength('move_right') - Input.get_action_strength('move_left'),
		Input.get_action_strength('move_down') - Input.get_action_strength('move_up')
	)
	on_input_update_animation(direction)
		
	velocity = direction * movement_speed
	
	move_and_slide()

func on_input_update_animation(input : Vector2):
	if (input != Vector2.ZERO):
		animation_tree.set('parameters/Walk/blend_position', input)
