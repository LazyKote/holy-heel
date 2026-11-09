extends Area2D

@onready var heel_anim  = $HeelSprite

@export var health : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	heel_anim.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print_debug("player entered")


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("monster"):
		print_debug("monster entered")
		health -= 1
		print_debug("health = ", health)
		if health == 0:
			game_over()

func game_over():
	get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")
