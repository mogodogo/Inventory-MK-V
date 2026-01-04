@abstract
class_name ItemContainer
extends Control

var Inventory : Array[ItemData]

@abstract
class ItemData:
	var resource : Item

@abstract
func AddItem(AddedItem : ItemData)

@abstract
func RemoveItem(RemovedItem : ItemData)

@abstract
func EditItem(EditedItem : ItemData)
