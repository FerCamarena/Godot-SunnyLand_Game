#Libraries
extends IState

#Registration
class_name FallState

#Attributes
var input_axis: float = 0.0

#Method called once when starting state
func enter(owner: CharacterBody2D) -> void:
	if owner.debug: print("Entering Fall")

#Method called once when leaving state
func exit(owner: CharacterBody2D) -> void:
	if owner.debug: print("Exiting Fall")

#Method called repeatedly for state logic
func execute(delta: float, owner: CharacterBody2D) -> void:
	#Custom input handling
	input_axis = Input.get_axis("move_left", "move_right")
	
	#Applying custom gravity
	if not owner.is_on_floor():
		owner.velocity.y += owner.get_gravity().y * delta * 1.5
	
	#Moving
	if input_axis != 0:
		if owner.velocity.x < owner.move_speed * 2 and owner.velocity.x > owner.move_speed * -2:
			owner.velocity.x += 16 * input_axis * owner.aero_speed * delta
	
	#Managing states
	if owner.is_on_floor():
		if owner.velocity.x != 0:
			owner.SM.change_state("Move", owner)
		else:
			owner.SM.change_state("Idle", owner)
