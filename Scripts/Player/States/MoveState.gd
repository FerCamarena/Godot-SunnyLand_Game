#Libraries
extends IState

#Registration
class_name MoveState

#Attributes
var input_axis: float = 0.0

#Method called once when starting state
func enter(owner: CharacterBody2D) -> void:
	if owner.debug: print("Entering Move")

#Method called once when leaving state
func exit(owner: CharacterBody2D) -> void:
	if owner.debug: print("Exiting Move")

#Method called repeatedly for state logic
func execute(delta: float, owner: CharacterBody2D) -> void:
	#Custom input handling
	input_axis = Input.get_axis("move_left", "move_right")
	
	#Applying custom gravity
	if not owner.is_on_floor() && owner.velocity.y >= owner.fall_speed:
		owner.velocity.y += owner.get_gravity().y * delta
	
	#Moving
	if input_axis != 0:
		if owner.velocity.x < owner.move_speed * 2 and owner.velocity.x > owner.move_speed * -2:
			owner.velocity.x += 16 * input_axis * owner.move_speed * delta
	
	#Managing states
	if is_zero_approx(owner.velocity.x):
		owner.SM.change_state("Idle", owner)
	elif not owner.is_on_floor():
		owner.SM.change_state("Fall", owner)
	elif Input.is_action_just_pressed("jump"):
		owner.SM.change_state("Jump", owner)
