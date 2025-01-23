#Libraries
extends IState

#Registration
class_name MorphState

#Method called once when starting state
func enter(_parent: CharacterBody2D) -> void:
	if _parent.DEBUG: print("Entering Morph")
	
	#Managging custom physics
	_parent.velocity = Vector2.ZERO
	
	#Morphing player into block
	_parent.PA.play_animation("Morph")

#Method called once when leaving state
func exit(_parent: CharacterBody2D) -> void:
	if _parent.DEBUG: print("Exiting Morph")
	
	#Eliminate self player
	_parent.queue_free()

#Method called repeatedly for state logic
func execute(_delta: float, _parent: CharacterBody2D) -> void:
	#Wait for morph animation
	await _parent.PA.animation_player.animation_finished
	
	#Closing state machine
	_parent.SM.terminate(_parent)
	
	#Generate object
	spawnObject(_parent)

func spawnObject(_parent: CharacterBody2D) -> void:
	var blockObject = _parent.block.instantiate()
	_parent.get_parent().add_child(blockObject)
	blockObject.position = _parent.position
