# Handle on (Re)Load for ash_pile_handler.mcfunction

# Add and Set Spawn Ash Pile Objectives
scoreboard objectives add toggle_ash trigger
scoreboard objectives add was_ash_toggled dummy
scoreboard objectives add is_ash_toggled dummy
scoreboard objectives add did_ash_toggle_change dummy
scoreboard objectives add ash_pile_timer dummy
scoreboard objectives add did_ash_pile_timer_go_off dummy
# Note: 1 tick ~= 50ms => 20 ticks ~= 1s => 600 ticks ~= 30s
scoreboard objectives add ash_pile_timer_threshold dummy
scoreboard players set @a ash_pile_timer_threshold 600

# Debug: Show Spawn Ash Pile Objectives
#scoreboard objectives setdisplay sidebar toggle_ash
#scoreboard objectives setdisplay sidebar was_ash_toggled
#scoreboard objectives setdisplay sidebar is_ash_toggled
#scoreboard objectives setdisplay sidebar did_ash_toggle_change
#scoreboard objectives setdisplay sidebar ash_pile_timer
#scoreboard objectives setdisplay sidebar did_ash_pile_timer_go_off
#scoreboard objectives setdisplay sidebar ash_pile_timer_threshold
