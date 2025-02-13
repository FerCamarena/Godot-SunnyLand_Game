#Libraries
extends IState

#Registration
class_name FloatState

#Attributes
var input_axis: float = 0.0

#Method called once when starting state
func enter(_parent: CharacterBody2D) -> void:
	if _parent.DEBUG: print("Entering Float")

#Method called once when leaving state
func exit(_parent: CharacterBody2D) -> void:
	if _parent.DEBUG: print("Exiting Float")

#Method called repeatedly for state logic
func execute(_delta: float, _parent: CharacterBody2D) -> void:
	#Custom input handling
	input_axis = Input.get_axis("move_left", "move_right")
	
	#Applying custom gravity
	apply_gravity(_delta, .75, _parent)
	
	#Moving
	if input_axis != 0:
		if _parent.velocity.x < _parent.move_speed * 2 and _parent.velocity.x > _parent.move_speed * -2:
			_parent.velocity.x += 16 * input_axis * _parent.aero_speed * _delta
	
	#Managing states
	if _parent.is_on_floor() and _parent.velocity.y <= 0:
		if _parent.velocity.x != 0:
			_parent.SM.change_state("Move", _parent)
		else:
			_parent.SM.change_state("Idle", _parent)
	elif Input.is_action_just_pressed("morph"):
		_parent.SM.change_state("Morph", _parent)
	elif _parent.velocity.y >= 32:
		_parent.SM.change_state("Fall", _parent)
