extends Control

signal back_to_main_game

var clues = []
var vbox

func set_clues(clues_list):
	clues = clues_list
	update_journal()
	
func update_journal():
	for clue in clues:
		var label = Label.new()
		label.text = clue
		vbox.add_child(label)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	vbox = get_node("clueList")
	var back_button = get_node("back")
	var callable = Callable(self, "_on_BackButton_pressed")
	back_button.connect("pressed", callable)

func _on_BackButton_pressed():
	queue_free_children()
	emit_signal("back_to_main_game")
	queue_free()

func queue_free_children():
	for child in vbox.get_children():
		child.queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
