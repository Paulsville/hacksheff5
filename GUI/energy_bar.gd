extends Node2D

onready var bar = $Bar
onready var tween = $Tween

var animated_health = 0

func _ready():
	var player_max_health = $"../../Player".ENERGY_MAX
	bar.max_value = player_max_health
	animated_health = player_max_health
	
func _process(delta):
	bar.value = animated_health

func _on_player_energy_updated(health):
	tween.interpolate_property(self, "animated_health", animated_health, health, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN)
	if not tween.is_active():
    	tween.start()
