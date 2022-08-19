function stripMineRow()
  mineForward(200)
  turnAround()
  moveForward(200)

function anyDiamonds()
  local resp = 0
  local has_block, data = turtle.inspectUp()
  if has_block then
    if data.name == "minecraft:diamond_ore" or data.name == "minecraft:deepslate_diamond_ore" then
      resp += 1
    end
  end
  local has_block, data = turtle.inspect()
  if has_block then
    if data.name == "minecraft:diamond_ore" or data.name == "minecraft:deepslate_diamond_ore" then
      resp += 1
    end
  end
  local has_block, data = turtle.inspectDown()
  if has_block then
    if data.name == "minecraft:diamond_ore" or data.name == "minecraft:deepslate_diamond_ore" then
      resp += 1
    end
  end
  turtle.turnLeft()
  local has_block, data = turtle.inspect()
  if has_block then
    if data.name == "minecraft:diamond_ore" or data.name == "minecraft:deepslate_diamond_ore" then
      resp += 1
    end
  end
  turtle.turnLeft()
  turtle.turnLeft()
  local has_block, data = turtle.inspect()
  if has_block then
    if data.name == "minecraft:diamond_ore" or data.name == "minecraft:deepslate_diamond_ore" then
      resp += 1
    end
  end
  return resp
end

function whereDiamonds()
  resp = {}
  resp["f"] = false
  resp["u"] = false
  resp["d"] = false
  resp["l"] = false
  resp["r"] = false
  local has_block, data = turtle.inspectUp()
  if has_block then
    if data.name == "minecraft:diamond_ore" or data.name == "minecraft:deepslate_diamond_ore" then
      resp["u"] = true
    end
  end
  local has_block, data = turtle.inspect()
  if has_block then
    if data.name == "minecraft:diamond_ore" or data.name == "minecraft:deepslate_diamond_ore" then
      resp["f"] = true
    end
  end
  local has_block, data = turtle.inspectDown()
  if has_block then
    if data.name == "minecraft:diamond_ore" or data.name == "minecraft:deepslate_diamond_ore" then
      resp["d"] = true
    end
  end
  turtle.turnLeft()
  local has_block, data = turtle.inspect()
  if has_block then
    if data.name == "minecraft:diamond_ore" or data.name == "minecraft:deepslate_diamond_ore" then
      resp["l"] = true
    end
  end
  turtle.turnLeft()
  turtle.turnLeft()
  local has_block, data = turtle.inspect()
  if has_block then
    if data.name == "minecraft:diamond_ore" or data.name == "minecraft:deepslate_diamond_ore" then
      resp["r"] = true
    end
  end
  return resp
end

function mineForward(num)
  resp = {}
  resp["f"] = false
  resp["u"] = false
  resp["d"] = false
  resp["l"] = false
  resp["r"] = false
  while num > 0 do
    diamondDir = anyDiamonds()
    if diamondDir != resp then
      slurpThatVein(diamondDir)
    turtle.dig()
    moveForward(1)
    num -= 1
  end
end

function slurpThatVein()
end

function newRow()
  mineForward(2)
end
