@abstract
class_name ItemContainer
extends Control

var Inventory : Array[ItemData]

enum ReturnType {Successful, CollidingError, BoundingError}

@abstract
class ItemData:
	var resource : Item
#Crud System Create Read Update Delete
@abstract
func AddItem(AddedItem : ItemData) -> ReturnType

@abstract
func RemoveItem(RemovedItem : ItemData) -> ReturnType

@abstract
func EditItem(EditedItem : ItemData, ItemEditData : ItemData) -> ReturnType
