function update () -- periodic function that will be called
  local current_pos = ahrs:get_position() -- fetch the current position of the vehicle
  local home = ahrs:get_home()            -- fetch the home position of the vehicle
  if current_pos and home then            -- check that both a vehicle location, and home location are available
    local distance = current_pos:get_distance(home) -- calculate the distance from home in meters
    if distance > 1000 then -- if more then 1000 meters away
      distance = 1000;      -- clamp the distance to 1000 meters
    end
    gcs:send_text( 0,  "we got it!" ) -- set the servo assigned function 96 (scripting3) to a proportional value
  end

  return update, 1000 -- request "update" to be rerun again 1000 milliseconds (1 second) from now
end

return update, 100