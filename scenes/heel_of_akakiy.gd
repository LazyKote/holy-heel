extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	print_debug("body")
	if body is Player:
		print_debug("player entered")


func _on_area_entered(area: Area2D) -> void:
	print_debug("area")
	if area.is_in_group("monster"):
		print_debug("monster entered")
