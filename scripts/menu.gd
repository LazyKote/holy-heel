extends Control


@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	animation_player.play("game_name_anim")


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
