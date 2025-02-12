#Libraries
extends CharacterBody2D

#DEV
@export var DEBUG: bool = false

#Componenets
@onready var SM: StateMachine = StateMachine.new()
@onready var PA: PlayerAnimator = PlayerAnimator.new()
@onready var PS: PlayerSounder = PlayerSounder.new()
@export var CS: CollisionShape2D
@export var HB: Area2D

#Attributes
@export var move_speed: int = 160
@export var aero_speed: int = 160
@export var jump_force: int = -420
@export var fall_speed: int = -420
@export var resistance: int = 160

@export var block: PackedScene

#Method called once at start
func _ready() -> void:
	#Initializing components
	PA.animation_player = $Animator
	PS.audio_player = $Sounder
	
	#Setting default state
	SM.current_state = SM.states.get("Idle")

#Method called on frame time updates
func _process(_delta: float) -> void:
	#Delegate logic to current state
	SM.manage(_delta, self)

#Method called on fixed time updates
func _physics_process(_delta: float) -> void:
	#Handling dangers harm
	if not HB.get_overlapping_areas().is_empty():
		for area in HB.get_overlapping_areas():
			var layer = area.collision_layer
			if (layer & (1 << 8)
			or layer & (1 << 9)
			or (layer & (1 << 10) and is_on_floor() and area.get_parent().linear_velocity.y > 0)):
				SM.change_state("Die", self)
	
	#Energy loss
	velocity.x = move_toward(velocity.x, 0, 5 * resistance * _delta)
	
	#Applying velocity
	move_and_slide()
