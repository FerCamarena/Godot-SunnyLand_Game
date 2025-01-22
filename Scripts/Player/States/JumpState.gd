#Libraries
extends IState

#Registration
class_name JumpState

#Attributes
var input_axis: float = 0.0

#Method called once when starting current state
func enter(owner: CharacterBody2D) -> void:
	if owner.debug: print("Entering Jump")

#Method called once when leaving current state
func exit(owner: CharacterBody2D) -> void:
	if owner.debug: print("Exiting Jump")

#Method called repeatedly for custom state physic logic
func execute(delta: float, owner: CharacterBody2D) -> void:
	#Custom input handling
	input_axis = Input.get_axis("move_left", "move_right")
	
	#Managing states
	if owner.is_on_floor() and owner.velocity.y <= 0:
		if owner.velocity.x != 0:
			owner.SM.change_state("Move", owner)
		else:
			owner.SM.change_state("Idle", owner)
