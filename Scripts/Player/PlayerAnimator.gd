#Libraries
extends Node

#Registration
class_name PlayerAnimator

#Components
@onready var animation_player: AnimationPlayer = $Animator

#Method for calling custom animations to play
func play_animation(new_animation: String) -> void:
	#Playing stored animation
	if animation_player.has_animation(new_animation):
		animation_player.play(new_animation)
	#Error handling
	else:
		push_error("Animation invalid or not found: " + new_animation)
