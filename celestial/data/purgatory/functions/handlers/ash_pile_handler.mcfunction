# Handle Spawning Ash Pile
# Requires Data Pack: https://github.com/jojocielo/afk_datapack

# Spawn Ash Pile Toggle Trigger
## Enable `toggle` Trigger for all Players
scoreboard players enable @a toggle_ash
## Store Prev value of Spawn Ash Pile Toggle
execute as @a store result score @s was_ash_toggled run scoreboard players get @s is_ash_toggled
## Get Cur value of Spawn Ash Pile Toggle
execute as @a store success score @s is_ash_toggled run execute if score @s toggle_ash matches 1
## Keep Spawn Ash Pile Toggle Within Bounds
execute as @a if score @s toggle_ash matches ..-1 run scoreboard players set @s toggle_ash 0
execute as @a if score @s toggle_ash matches 2.. run scoreboard players set @s toggle_ash 0
## Check if Spawn Ash Pile Toggle Changed
execute as @a store success score @s did_ash_toggle_change run execute unless score @s is_ash_toggled = @s was_ash_toggled
## Handle Spawn Ash Pile Toggle
execute as @a if score @s did_ash_toggle_change matches 1 if score @s toggle_ash matches 0 run tag @s remove spawn_ash_pile
execute as @a if score @s did_ash_toggle_change matches 1 if score @s toggle_ash matches 1 run tag @s add spawn_ash_pile
execute as @a if score @s did_ash_toggle_change matches 1 if score @s toggle_ash matches 0 run tellraw @s {"text":"Disabled Ash", "color":"#AA0000"}
execute as @a if score @s did_ash_toggle_change matches 1 if score @s toggle_ash matches 1 run tellraw @s {"text":"Enabled Ash", "color":"#00AA33"}

# Increment Player ash_pile_timer
execute as @a[tag=spawn_ash_pile] run scoreboard players add @s ash_pile_timer 1

# If not is_location_same (tag) or spawn_ash_pile (tag), restart ash_pile_timer
execute as @a[tag=!is_location_same] run scoreboard players set @s ash_pile_timer 0
execute as @a[tag=!spawn_ash_pile] run scoreboard players set @s ash_pile_timer 0

# Set did_ash_pile_timer_go_off
execute as @a store success score @s did_ash_pile_timer_go_off run execute if score @s ash_pile_timer >= @s ash_pile_timer_threshold

# Handle did_ash_pile_timer_go_off
## Debug: Clients without supplementaries:ash
#execute as @a at @s if score @s did_ash_pile_timer_go_off matches 1 run setblock ~ ~2 ~ minecraft:snow keep
## Spawn Ash Pile
execute as @a at @s if score @s did_ash_pile_timer_go_off matches 1 run setblock ~ ~2 ~ supplementaries:ash keep
## Restart ash_pile_timer
execute as @a if score @s did_ash_pile_timer_go_off matches 1 run scoreboard players set @s ash_pile_timer 0
