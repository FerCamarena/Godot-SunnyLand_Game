#Libraries
extends CharacterBody2D

#DEV
var debug: bool = false

#Componenets
var SM: StateMachine = StateMachine.new()
var PA: PlayerAnimator = PlayerAnimator.new()
var PS: PlayerSounder = PlayerSounder.new()

#Attributes
const MOVE_SPEED: float = 160.0
const AERIAL_SPEED: float = 160.0
const JUMP_FORCE: float = -320.0
const FRICTION: float = 240.0


#Method called once at start
func _ready() -> void:
	#Setting default state
	SM.current_state = SM.states.get("Idle")
	
	#Storing child node references
	PA.animation_player = $Animator
	PS.audio_player = $Listener

#Frame time update
func _process(delta: float) -> void:
	#Delegate logic to current state
	SM.manage(delta, self)

