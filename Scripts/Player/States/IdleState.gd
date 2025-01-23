#Libraries
extends IState

#Registration
class_name IdleState

#Attributes
var input_axis: float = 0.0

#Method called once when starting state
func enter(owner: CharacterBody2D) -> void:
	if owner.debug: print("Entering Idle")

#Method called once when leaving state
func exit(owner: CharacterBody2D) -> void:
	if owner.debug: print("Exiting Idle")

#Method called repeatedly for state logic
func execute(delta: float, owner: CharacterBody2D) -> void:
	#Custom input handling
	input_axis = Input.get_axis("move_left", "move_right")
	
	#Applying custom gravity
	if not owner.is_on_floor() && owner.velocity.y >= owner.fall_speed:
		owner.velocity.y += owner.get_gravity().y * delta
	
	#Managing states
	if Input.is_action_just_pressed("jump"):
		owner.SM.change_state("Jump", owner)
	elif Input.is_action_just_pressed("morph"):
		owner.SM.change_state("Morph", owner)
	elif not owner.is_on_floor():
		owner.SM.change_state("Fall", owner)
	elif input_axis != 0:
		owner.SM.change_state("Move", owner)
