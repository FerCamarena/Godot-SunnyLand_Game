#Libraries
extends IState

#Registration
class_name IdleState

#Attributes
var input_axis: float = 0.0

#Method called once when starting state
func enter(_parent: CharacterBody2D) -> void:
	if _parent.DEBUG: print("Entering Idle")

#Method called once when leaving state
func exit(_parent: CharacterBody2D) -> void:
	if _parent.DEBUG: print("Exiting Idle")

#Method called repeatedly for state logic
func execute(delta: float, _parent: CharacterBody2D) -> void:
	#Custom input handling
	input_axis = Input.get_axis("move_left", "move_right")
	
	#Applying custom gravity
	if not _parent.is_on_floor() && _parent.velocity.y >= _parent.fall_speed:
		_parent.velocity.y += _parent.get_gravity().y * delta
	
	#Managing states
	if Input.is_action_just_pressed("jump"):
		_parent.SM.change_state("Jump", _parent)
	elif Input.is_action_just_pressed("morph"):
		_parent.SM.change_state("Morph", _parent)
	elif not _parent.is_on_floor():
		_parent.SM.change_state("Fall", _parent)
	elif input_axis != 0:
		_parent.SM.change_state("Move", _parent)
