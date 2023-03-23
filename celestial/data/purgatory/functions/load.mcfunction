# Called on World (Re)Load

# Notify Chat of (Re)Load
#execute run tellraw @a {"text":"(Re)Loaded Celestial data pack", "color":"#0033AA"}

# Call Handler Loaders
execute run function purgatory:handler_loaders/ash_pile_handler_loader
