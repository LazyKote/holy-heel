class_name MainUI extends CanvasLayer


@export var wave_counter_label : Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func wave_counter_update(wave_number):
	wave_counter_label.text = str(wave_number)
