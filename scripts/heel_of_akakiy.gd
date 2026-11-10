extends Area2D

@onready var heel_anim  = $HeelSprite
@onready var damage_sound = $HeelDamage

@export var health : int
@export var candles : Array[AnimatedSprite2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	heel_anim.play("default")
	for candle in candles:
		candle.play("burn")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print_debug("player entered")


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("monster"):
		health -= 1
		candles[health].play("went_out")
		area.monster_diying()
		damage_sound.play()
		if health == 0:
			game_over()

func game_over():
	get_tree().call_deferred("change_scene_to_file", "res://scenes/game_over_screen.tscn")
