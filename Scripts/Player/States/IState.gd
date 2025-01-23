#Libraries
extends Node

#Registration
class_name IState

#Abstract method called once when starting current state
func enter(_parent: CharacterBody2D) -> void:
	assert(false, "Must be implemented in a subclass")

#Abstract method called once when leaving current state
func exit(_parent: CharacterBody2D) -> void:
	assert(false, "Must be implemented in a subclass")

#Abstract method called repeatedly for custom state physic logic
func execute(_delta: float, _parent: CharacterBody2D) -> void:
	assert(false, "Must be implemented in a subclass")

func apply_gravity(_delta: float, _modifier: float, _parent: CharacterBody2D) -> void:
	#Modifying gravity when valid
	if not _parent.is_on_floor() && _parent.velocity.y >= _parent.fall_speed:
		_parent.velocity.y += _parent.get_gravity().y * _delta * _modifier
