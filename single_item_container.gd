extends ItemContainer
@export_range(1, 99, 1, "or_greater") var StackLimit : int

func AddItem(AddedItem : ItemData) -> ReturnType:
	if !Inventory:
		return ReturnType.Successful
	else:
		return ReturnType.BoundingError

func RemoveItem(RemovedItem : ItemData) -> ReturnType:
	return ReturnType.Successful
