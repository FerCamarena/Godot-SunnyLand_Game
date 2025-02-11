#Libraries
extends IState

#Registration
class_name DieState

#Method called once when starting state
func enter(_parent: CharacterBody2D) -> void:
	if _parent.DEBUG: print("Entering Die")
	
	#Managging custom physics
	_parent.velocity = Vector2.ZERO
	
	#Disable collisions
	_parent.CS.disabled = true

#Method called once when leaving state
func exit(_parent: CharacterBody2D) -> void:
	if _parent.DEBUG: print("Exiting Die")
	
	#Eliminate self player
	_parent.queue_free()

#Method called repeatedly for state logic
func execute(_delta: float, _parent: CharacterBody2D) -> void:
	#Closing state machine
	_parent.SM.terminate(_parent)
