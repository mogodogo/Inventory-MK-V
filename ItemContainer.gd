@abstract
class_name ItemContainer
extends Control

var Inventory : Array[ItemData]

enum ReturnType {Successful, CollidingError, BoundingError}

@abstract
class ItemData:
	var resource : Item
	@abstract func _init() -> void
#Crud System Create Read Update Delete

@abstract #prob should be private or smthing
func AddItem(AddedItem : ItemData) -> ReturnType

@abstract
func RemoveItem(RemovedItem : ItemData) -> ReturnType

#probably not very efficent way to do thing but idc
func MoveItem(MovedItem : ItemData, TargetContainer : ItemContainer):
	var MovedItemLocal : ItemData = MovedItem
	if RemoveItem(MovedItem) == ReturnType.Successful:
		if TargetContainer.AddItem(MovedItem) == ReturnType.Successful:
			TargetContainer.AddItem(MovedItem)
		else:
			AddItem(MovedItemLocal)

func EditItem(EditedItem : ItemData, ItemEditData : ItemData):
	if RemoveItem(EditedItem) == ReturnType.Successful:
		if AddItem(ItemEditData) == ReturnType.Successful:
			AddItem(ItemEditData)
		else:
			AddItem(EditedItem)
