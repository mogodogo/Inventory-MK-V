@abstract
class_name ItemContainer
extends Control

var Inventory : Array[ItemData]

@abstract
class ItemData:
	var resource : Item

@abstract
func AddItem(AddedItem : ItemData) -> void

@abstract
func RemoveItem(RemovedItem : ItemData) -> void

@abstract
func EditItem(EditedItem : ItemData) -> void

@abstract
func CanAddItem(AddedItem : ItemData) -> bool

@abstract
func CanRemoveItem(RemovedItem : ItemData) -> bool

@abstract
func CanEditItem(EditedItem : ItemData) -> bool
