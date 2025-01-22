#Libraries
extends IState

#Registration
class_name DieState

#Method called once when starting state
func enter(owner: CharacterBody2D) -> void:
	if owner.debug: print("Entering Die")
	
	#Managging custom physics
	owner.velocity = Vector2.ZERO

#Method called once when leaving state
func exit(owner: CharacterBody2D) -> void:
	if owner.debug: print("Exiting Die")

#Method called repeatedly for state logic
func execute(delta: float, owner: CharacterBody2D) -> void:
	pass
