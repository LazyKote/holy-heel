class_name Bullet extends CharacterBody2D


var pos : Vector2
var rot : float
var dir : float
@export var speed = 500.0

@onready var bullet_timer = $Timer


func _ready() -> void:
	global_position = pos
	global_rotation = rot
	bullet_timer.timeout.connect(_delete_bullet)


func _physics_process(delta: float) -> void:
	velocity = Vector2(speed, 0).rotated(dir)
	move_and_slide()


func _delete_bullet():
	queue_free()
