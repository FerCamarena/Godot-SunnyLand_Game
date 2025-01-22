#Libraries
extends IState

#Registration
class_name IdleState

#Attributes
var input_axis: float = 0.0

#Method called once when starting current state
func enter(owner: CharacterBody2D) -> void:
	if owner.debug: print("Entering Idle")

#Method called once when leaving current state
func exit(owner: CharacterBody2D) -> void:
	if owner.debug: print("Exiting Idle")

#Method called repeatedly for custom state physic logic
func execute(delta: float, owner: CharacterBody2D) -> void:
	#Custom input handling
	input_axis = Input.get_axis("move_left", "move_right")
	
	#Managing states
	if input_axis != 0:
		owner.SM.change_state("Move", owner)
	elif Input.is_action_just_pressed("jump"):
		owner.SM.change_state("Jump", owner)
