#Libraries
extends IState

#Registration
class_name JumpState

#Attributes
var input_axis: float = 0.0

#Method called once when starting state
func enter(owner: CharacterBody2D) -> void:
	if owner.debug: print("Entering Jump")
	#Jumping
	if owner.is_on_floor():
		owner.velocity.y = owner.JUMP_FORCE

#Method called once when leaving state
func exit(owner: CharacterBody2D) -> void:
	if owner.debug: print("Exiting Jump")

#Method called repeatedly for state logic
func execute(delta: float, owner: CharacterBody2D) -> void:
	#Custom input handling
	input_axis = Input.get_axis("move_left", "move_right")
	
	#Applying custom gravity
	if not owner.is_on_floor():
		owner.velocity.y += owner.get_gravity().y * delta
	
	#Moving
	if input_axis != 0:
		if owner.velocity.x < owner.MOVE_SPEED * 2 and owner.velocity.x > owner.MOVE_SPEED * -2:
			owner.velocity.x += 16 * input_axis * owner.AERIAL_SPEED * delta
	
	#Managing states
	if owner.is_on_floor() and owner.velocity.y <= 0:
		if owner.velocity.x != 0:
			owner.SM.change_state("Move", owner)
		else:
			owner.SM.change_state("Idle", owner)
	elif owner.velocity.y >= -32:
		owner.SM.change_state("Float", owner)
