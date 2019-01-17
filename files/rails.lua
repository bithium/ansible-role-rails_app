--[[
This script makes lighttpd serve the files in the public folder
of a rails app.
--]]

--
-- Helper functions
--

function file_exists(path)
  local attr = lighty.stat(path)
  if (attr and attr.is_file) then
    return true
  else
    return false
  end
end

--
-- MAIN
--

-- print("Path: " .. lighty.env["physical.path"])

if (file_exists(lighty.env["physical.path"])) then
  return 200
end
