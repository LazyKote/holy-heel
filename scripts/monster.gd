class_name Monster extends Area2D

signal attack
signal monster_died


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	#if body.is_in_group("player"):
		#emit_signal("attack")
	
	if body is Player:
		body.kill()
	
	if body.is_in_group("bullet"):
		monster_got_hit()
		body.queue_free()
		emit_signal("monster_died")


func monster_got_hit():
	queue_free()
