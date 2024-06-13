extends Panel

var selfscene
var found_clues = []
# Called when the node enters the scene tree for the first time.
func _ready():
	var journal_button = get_node("menu/Journal")
	var callable = Callable(self, "_on_JournalButton_pressed")
	journal_button.connect("pressed", callable)

func _on_JournalButton_pressed():
	self.visible = false
	#SceneManager.goto_scene("res://Journal")
	var journal_scene = load("res://Journal.tscn").instantiate()
	var callable = Callable(self, "return_from_journal")
	journal_scene.connect("back_to_main_game", callable)
	get_tree().root.add_child(journal_scene)
	journal_scene.set_clues(found_clues)
	selfscene = get_tree().current_scene
	get_tree().current_scene = journal_scene
	
func add_clue(clue_name):
	print(clue_name)
	if clue_name not in found_clues:
		found_clues.append(clue_name)
		
func return_from_journal():
	self.visible = true
	get_tree().current_scene = selfscene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
