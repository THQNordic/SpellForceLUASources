local worldname = GdMain:GetWorldPtr():GetWorldName()
if not worldname then return end
worldname = gsub(worldname, ".map", "")
worldname = gsub(worldname, "map\\Campaign\\", "")
worldname = gsub(worldname, "map\\Lan\\", "")
worldname = gsub(worldname, "map\\test\\", "")

print("TestSpawn " .. worldname .. " units...")
return doscript("!test\\TestSpawn" .. worldname .. ".lua") or {}
