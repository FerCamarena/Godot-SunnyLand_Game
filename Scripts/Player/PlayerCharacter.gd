#Libraries
extends CharacterBody2D

#DEV
var debug: bool = false

#Componenets
var SM: StateMachine = StateMachine.new()
var PA: PlayerAnimator = PlayerAnimator.new()
var PS: PlayerSounder = PlayerSounder.new()

#Attributes
const MOVE_SPEED: int = 160
const AERIAL_SPEED: int = 160
const JUMP_FORCE: int = -400
const FALL_SPEED: int = -400
const FRICTION: int = 240


#Method called once at start
func _ready() -> void:
	#Setting default state
	SM.current_state = SM.states.get("Idle")
	
	#Storing child node references
	PA.animation_player = $Animator
	PS.audio_player = $Sounder

#Frame time update
func _process(delta: float) -> void:
	#Delegate logic to current state
	SM.manage(delta, self)

#Fixed time update
func _physics_process(delta: float) -> void:
	#Energy loss
	velocity.x = move_toward(velocity.x, 0, 5 * FRICTION * delta)
	
	#Applying velocity
	move_and_slide()
