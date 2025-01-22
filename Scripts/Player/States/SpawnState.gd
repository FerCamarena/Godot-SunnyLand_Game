#Libraries
extends IState

#Registration
class_name SpawnState

#Method called once when starting state
func enter(owner: CharacterBody2D) -> void:
	if owner.debug: print("Entering Spawn")

#Method called once when leaving state
func exit(owner: CharacterBody2D) -> void:
	if owner.debug: print("Exiting Spawn")

#Method called repeatedly for state logic
func execute(delta: float, owner: CharacterBody2D) -> void:
	pass
