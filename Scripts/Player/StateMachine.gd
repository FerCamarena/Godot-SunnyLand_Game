#Libraries
extends Node

#Registration
class_name StateMachine

#Attributes
var current_state: IState
var states: Dictionary = {
	"Idle": IdleState.new(),
	"Move": MoveState.new(),
	"Jump": JumpState.new(),
	"Float": FloatState.new(),
	"Fall": FallState.new(),
	"Spawn": SpawnState.new(),
	"Die": DieState.new()
}

#Method called for dynamically change between states
func change_state(new_state: String, owner: CharacterBody2D) -> void:
	#Exiting current state
	if current_state:
		current_state.exit(owner)
	#Error handling
	else:
		push_error("Current state invalid or not found")
	
	#Setting new state
	current_state = states.get(new_state)
	
	#Entering new state
	if current_state:
		current_state.enter(owner)
	#Error handling
	else:
		push_error("Current state invalid or not found")

#Method called to physic manage current state
func manage(delta: float, owner: CharacterBody2D) -> void:
	#Executing current state updates
	if current_state:
		current_state.execute(delta, owner)
	#Error handling
	else:
		push_error("Current state invalid or not found")
