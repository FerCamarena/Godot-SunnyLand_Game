#Libraries
extends Node2D

#Attributes
@export var playerPrefab: PackedScene
@export var spawnPoint: Vector2i
var player: CharacterBody2D

#Method called once at start
func _ready() -> void:
	#Initialize player
	spawnPlayer()

#Method called on frame time updates
func _process(_delta: float) -> void:
	#Respawning if player died
	if !is_instance_valid(player):
		spawnPlayer()

#Method called to spawn a player instance
func spawnPlayer() -> void:
	player = playerPrefab.instantiate()
	add_child(player)
	player.position = spawnPoint
