#Libraries
extends IState

#Registration
class_name MorphState

#Method called once when starting state
func enter(owner: CharacterBody2D) -> void:
	if owner.debug: print("Entering Morph")
	
	#Managging custom physics
	owner.velocity = Vector2.ZERO
	
	#Disable collisions
	owner.CS.disabled = true

#Method called once when leaving state
func exit(owner: CharacterBody2D) -> void:
	if owner.debug: print("Exiting Morph")

#Method called repeatedly for state logic
func execute(delta: float, owner: CharacterBody2D) -> void:
	pass
