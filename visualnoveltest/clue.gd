extends Area2D

var found = false


func add_to_journal():
	var journal = get_tree().current_scene
	journal.get_node("Panel").add_clue(get_name())
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and not found:
		found = true
		add_to_journal()
