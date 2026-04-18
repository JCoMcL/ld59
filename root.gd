class_name Root
extends Control

var SCENES = {
	&"train": preload("res://interior.tscn"),
	&"1": preload("res://stations/temp_station_1.tscn"),
	&"2": preload("res://stations/temp_station_2.tscn"),
	&"3": preload("res://stations/temp_station_3.tscn"),
	&"4": preload("res://stations/temp_station_4.tscn"),
	&"5": preload("res://stations/temp_station_5.tscn")
}

var TRAINS = {
	&"train1": ["1", "2", "3", "4"],
	&"train2": ["1", "2", "3", "4"],
	&"train3": ["1", "2", "3", "4"],
	&"train4": ["4", "5"]
}

var current_train = TRAINS.keys()[0]
var current_station = SCENES.keys()[1]

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
	print("train: %s, station: %s" % [current_train, id])
	print("other trains at station: %s" % ", ".join(get_other_trains(id)))
	print("table of trains at station: %s" % ", ".join(sort_trains_randomly()))

func get_trains(station_name:String) -> Array:
	var trains = []
	for train in TRAINS.keys():
		if TRAINS[train].has(station_name):
			trains.append(train)
	return trains

func get_other_trains(station:String) -> Array:
	var trains = []
	for train in TRAINS.keys():
		if TRAINS[train].has(station) and train != current_train:
			trains.append(train)
	return trains

func sort_trains_randomly():
	var trains = get_other_trains(current_station)
	trains.shuffle()
	trains.insert(0, current_train)
	return trains
