extends Node3D

var spike_pre = load("res://scenes/spikes.tscn")
var wall_pre = load("res://scenes/wall.tscn")
var timer : float = 0
var loop : bool = true

var spawnAmount : int = 1

var waitTime : int = 5

func _process(delta):
	if loop == true:
		loop = false
		spawnAmount = randi_range(1, 4)
		print(spawnAmount)
		for i in spawnAmount:
			var spikeInstance = spike_pre.instantiate()
			add_child(spikeInstance)
			spikeInstance.global_position = $obstacleSpawnMarker.global_position
			await get_tree().create_timer(0.2).timeout
			
		if randi_range(0,1) == 1:
			await get_tree().create_timer(randf_range(0.2, 0.6)).timeout
			var instanceOfWall = wall_pre.instantiate()
			add_child(instanceOfWall)
			instanceOfWall.global_position = $obstacleSpawnMarker.global_position
		
	timer += delta
	if timer >= waitTime:
		waitTime = randi_range(2, 5)
		loop = true
		timer = 0
