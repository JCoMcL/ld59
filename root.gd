class_name Root
extends Control

var SCENES = {
	&"train": preload("res://interior.tscn"),
	&"1": preload("res://stations/temp_station_1.tscn"),
	&"2": preload("res://stations/temp_station_2.tscn")
}
@onready var backdrop = $Background

static func get_root(from: Node) -> Root:
	while from and from is not Root:
		from = from.get_parent()
	return from

func change_scene(id:StringName):
	assert(SCENES.has(id))
	if SCENES[id] is PackedScene:
		SCENES[id] = SCENES[id].instantiate()
	assert(SCENES[id] is Node)
	remove_child(backdrop)
	backdrop = SCENES[id]
	add_child(backdrop)
