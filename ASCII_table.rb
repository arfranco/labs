##Print a Table for a Hash

## toy = print_hash{brit: :dogs, tim: :whiskey, jo: :ping_pong}
## example: print_hash(toy)
## prints the following:

## +-----------------+
## | key  | value    |
## |-----------------|
## | brit | dogs     |
## | tim  | whiskey  |
## | jo   | ping_pong|
## +-----------------+

def max_length(names)
  names.map { |name| name.length }.max
end

def print_dashes(max_k, max_v)
  # 2 spaces for key and value, 3 spaces for pipes
  total = max_k + max_v + 7
  puts "-" * total
end

def print_line(key, value, max_k, max_v)
  puts "| #{key.center(max_k)} | #{value.center(max_v)} |"
end

def print_kv_pairs(hash, max_k, max_v)
  hash.each do |key, value|
    print_line(key.to_s, value.to_s, max_k, max_v)
  end
end

def print_hash(hash)
  longest_key = max_length(hash.keys)
  longest_val = max_length(hash.values)

  print_dashes(longest_key, longest_val)
  print_kv_pairs(hash, longest_key, longest_val)
  print_dashes(longest_key, longest_val)
end