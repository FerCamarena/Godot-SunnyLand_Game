#Libraries
extends IState

#Registration
class_name MoveState

#Attributes
var input_axis: float = 0.0

#Method called once when starting current state
func enter(owner: CharacterBody2D) -> void:
	if owner.debug: print("Entering Move")

#Method called once when leaving current state
func exit(owner: CharacterBody2D) -> void:
	if owner.debug: print("Exiting Move")

#Method called repeatedly for custom state physic logic
func execute(delta: float, owner: CharacterBody2D) -> void:
	#Custom input handling
	input_axis = Input.get_axis("move_left", "move_right")
	
	#Managing states
	if is_zero_approx(owner.velocity.x) and is_zero_approx(input_axis):
		owner.SM.change_state("Idle", owner)
