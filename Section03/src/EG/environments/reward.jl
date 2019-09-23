reward(prob::Float64; r=Nothing) = begin
  if r == Nothing
    r = rand()
  end

  Float64(r < prob)
end
