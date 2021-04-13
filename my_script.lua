request = function()
  path = "/users/search?name_prefix=" .. string.char(math.random(97,122)) .. "&surname_prefix=" .. string.char(math.random(97,122))
  return wrk.format("GET", path)
end

