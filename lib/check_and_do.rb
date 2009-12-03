def check_and_do condition, *args
  if condition.call(*args)
    yield *args
  end
end