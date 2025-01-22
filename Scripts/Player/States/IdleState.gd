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
