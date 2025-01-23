#Libraries
extends IState

#Registration
class_name MoveState

#Attributes
var input_axis: float = 0.0

#Method called once when starting state
func enter(_parent: CharacterBody2D) -> void:
	if _parent.DEBUG: print("Entering Move")

#Method called once when leaving state
func exit(_parent: CharacterBody2D) -> void:
	if _parent.DEBUG: print("Exiting Move")

#Method called repeatedly for state logic
func execute(_delta: float, _parent: CharacterBody2D) -> void:
	#Custom input handling
	input_axis = Input.get_axis("move_left", "move_right")
	
	#Apply custom gravity
	apply_gravity(_delta, 1, _parent)
	
	#Moving
	if input_axis != 0:
		if _parent.velocity.x < _parent.move_speed * 2 and _parent.velocity.x > _parent.move_speed * -2:
			_parent.velocity.x += 16 * input_axis * _parent.move_speed * _delta
	
	#Managing states
	if is_zero_approx(_parent.velocity.x):
		_parent.SM.change_state("Idle", _parent)
	elif not _parent.is_on_floor():
		_parent.SM.change_state("Fall", _parent)
	elif Input.is_action_just_pressed("jump"):
		_parent.SM.change_state("Jump", _parent)
	elif Input.is_action_just_pressed("morph"):
		_parent.SM.change_state("Morph", _parent)
