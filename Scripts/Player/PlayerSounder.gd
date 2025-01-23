#Libraries
extends Node

#Regitration
class_name PlayerSounder

#Components
var audio_player: AudioStreamPlayer2D

#Attributes
var sounds: Dictionary = {}

#Method for playing custom sounds
func play_sound(new_sound: String) -> void:
	#Playing stored sound
	if new_sound in sounds:
		audio_player.stream = sounds[new_sound]
		audio_player.play()
	#Error handling
	else:
		push_error("Sound invalid or not found: " + new_sound)
