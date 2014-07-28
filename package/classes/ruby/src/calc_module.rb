def calc_min_max(n)
  min = calc(n, 0, 0, 50, 0.9)
  max = calc(n, 31, 252, 50, 1.1)
  jun = calc(n, 31, 252, 50, 1.0)
  return [min, max]
end

def calc_hp_min_max(n)
  min = calc_hp(n, 0, 0, 50)
  max = calc_hp(n, 31, 252, 50)
  return [min, max]
end

def calc(n, individual, training, level, hosei)
  n = n.to_i
  return (((n * 2 + individual + training / 4) * level / 100 + 5) * hosei).to_i.to_s
end

def calc_hp(n, individual, training, level)
  n = n.to_i
  return ((n * 2 + individual + training / 4) * level / 100 + level + 10).to_i.to_s
end
