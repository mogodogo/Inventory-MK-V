extends ItemContainer
@export_range(1, 99, 1, "or_greater") var StackLimit : int

class SingleItemData extends ItemData:
	func _init(setResource : Item) -> void:
		resource = setResource

func _ready() -> void:
	AddItem(SingleItemData.new(load("uid://p5yndwyaw07m")))

func AddItem(AddedItem : ItemData) -> ReturnType:
	if Inventory:
		return ReturnType.BoundingError
	else:
		Inventory.push_back(AddedItem)
		add_child(ItemDisplay.NewDisplay(AddedItem.resource, size))
		return ReturnType.Successful

func RemoveItem(RemovedItem : ItemData) -> ReturnType:
	assert(get_child_count() < 2)
	get_child(0).queue_free()
	return ReturnType.Successful
