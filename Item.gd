@abstract
class_name Item
extends Resource


@export_category("Item Internal Data")
@export var Name : String
@export var CustomName : String = Name
@export var Size : Vector2i
@export var Icon : Texture2D
@export_range(1, 99, 1, "or_greater") var Stack : int
@export_range(1, 99, 1, "or_greater") var StackLimit : int
@export var Scene : PackedScene

##safe way of accessing name
func GetName() -> String: 
	return CustomName

func GetDisplay() -> Texture2D:
	if Icon:
		return Icon
	else:
		return null #replace with a sideways view of scene

func GetType() -> String:
	return ""
