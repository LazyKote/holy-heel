class_name Monster extends Area2D

@onready var anim = $AnimatedSprite2D
@onready var death_sound = $AudioStreamPlayer2D

signal attack
signal monster_died

@export var health = 3
var is_dead: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	#if body.is_in_group("player"):
		#emit_signal("attack")
	if is_dead:
		return
		
	if body is Player:
		anim.play("attack")
		body.kill()
	
	if body.is_in_group("bullet"):
		monster_got_hit()
		body.queue_free()


func monster_got_hit():
	if is_dead:
		return
	health -=1
	anim.play("attack")
	if health <=0:
		monster_diying()

func monster_diying():
	is_dead = true
	death_sound.play()
	emit_signal("monster_died")
	anim.play("death")
	await anim.animation_finished
	queue_free()
