#Libraries
extends IState

#Registration
class_name MorphState

#Method called once when starting state
func enter(_parent: CharacterBody2D) -> void:
	if _parent.DEBUG: print("Entering Morph")
	
	#Managging custom physics
	_parent.velocity = Vector2.ZERO
	
	#Disable collisions
	_parent.CS.disabled = true

#Method called once when leaving state
func exit(_parent: CharacterBody2D) -> void:
	if _parent.DEBUG: print("Exiting Morph")

#Method called repeatedly for state logic
	pass
func execute(_delta: float, _parent: CharacterBody2D) -> void:
