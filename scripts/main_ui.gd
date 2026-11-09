extends CanvasLayer
@export var wave_counter_label : Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wave_counter_label = get_tree().current_scene.get_node("WaveCounterLabel")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func wave_counter_update(wave_number):
	wave_counter_label.text = str(wave_number)
