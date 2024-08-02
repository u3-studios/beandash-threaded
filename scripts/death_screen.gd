extends Node2D



func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")
	
func _ready():
	if Verdier.points > Verdier.highscore:
		Verdier.highscore = Verdier.points
		Verdier.points = 0
	$Control/Highscore.text = "Highscore: " + str(Verdier.highscore)


func _on_quit_pressed():
	get_tree().quit()
