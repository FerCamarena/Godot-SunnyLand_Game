#Libraries
extends IState

#Registration
class_name SpawnState

#Method called once when starting state
func enter(_parent: CharacterBody2D) -> void:
	if _parent.debug: print("Entering Spawn")

#Method called once when leaving state
func exit(_parent: CharacterBody2D) -> void:
	if _parent.debug: print("Exiting Spawn")

#Method called repeatedly for state logic
func execute(_delta: float, _parent: CharacterBody2D) -> void:
	pass
