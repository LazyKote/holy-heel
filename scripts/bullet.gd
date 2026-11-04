extends CharacterBody2D
@onready var bullet_timer = $Timer

var pos : Vector2
var rot : float
var dir : float
var speed = 1000.0

func _ready() -> void:
	global_position = pos
	global_rotation = rot
	bullet_timer.timeout.connect(delete_bullet)

func _physics_process(delta: float) -> void:
	velocity = Vector2(speed, 0).rotated(dir)
	move_and_slide()

func delete_bullet():
	queue_free()
	
