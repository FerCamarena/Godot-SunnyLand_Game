#Libraries
extends Node

#Registration
class_name IState

#Abstract method called once when starting current state
func enter(owner: CharacterBody2D) -> void:
	assert(false, "Must be implemented in a subclass")

#Abstract method called once when leaving current state
func exit(owner: CharacterBody2D) -> void:
	assert(false, "Must be implemented in a subclass")

#Abstract method called repeatedly for custom state physic logic
func execute(delta: float, owner: CharacterBody2D) -> void:
	assert(false, "Must be implemented in a subclass")
