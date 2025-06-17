extends Node

@export var spawn_dzik = preload("res://scenes/dzik.tscn")

var coal = 90
var secondsPassed = 0
var dzikCount = 0
var wave = 0
var spawnedDziks = 0
var hp = 100

func _on_timer_timeout() -> void:
	secondsPassed += 1

func damagePowerPlant():
	print("ouch")
	$healthCounter.text =  "%d" % hp
	if hp <= 0:
		get_tree().change_scene_to_file("res://scenes/gameover.tscn")


func finishWave():
	wave += 1
	dzikCount = 3*wave
	spawnedDziks = 0
	coal += 10*wave
	$coalCounter.text = "%d" % coal
	$falaCounter.text = "%d" % wave
	print("Wave %d" % wave)
	if wave % 5 == 0:
		# faster wave
		$dzikSpawnTimer.start(0.5)
		$falaCounter.add_theme_color_override("default_color", "ff2222")
	else:
		$dzikSpawnTimer.start(1)
		$falaCounter.add_theme_color_override("default_color", "ebca00")
		
func _ready() -> void:
	finishWave() # On first start
	
func _on_dzik_spawn_timer_timeout() -> void:
	if spawnedDziks < dzikCount:
		var dzik = spawn_dzik.instantiate()
		$"../Path2D".add_child(dzik)
		spawnedDziks += 1
		#print("Spawned a dzik")
		print(spawnedDziks, dzikCount)
	else:
		spawnedDziks = 0
		$dzikSpawnTimer.stop()
		print(spawnedDziks, dzikCount)

func _on_path_2d_child_exiting_tree(node: Node) -> void:
	#print("Killed a dzik")
	coal += 5
	$coalCounter.text = "%d" % coal
	
	if $"../Path2D".get_child_count() == 1: # 1, bo count sie zmniejsza dopiero po wywolaniu tej funkcji
		
		if(spawnedDziks == dzikCount):
			print("Killed all dziks")
			finishWave()
