nato_table = {
  a: "Alpha",
  b: "Beta",
  c: "Charlie",
  d: "Delta",
  e: "Echo",
  f: "Foxtrot",
  g: "Golf", 
  h: "Hotel",
  i: "India",
  j: "Juliett",
  k: "Kilo",
  l: "Lima",
  m: "Mike",
  n: "November",
  o: "Oscar",
  p: "Papa",
  q: "Quebec",
  r: "Romeo",
  s: "Sierra",
  t: "Tango",
  u: "Uniform",
  v: "Victor",
  w: "Whiskey",
  x: "Xray",
  y: "Yankee",
  z: "Zulu",
}


def string_to_array(string)
  array = string.each_char.to_a 
  array.map do |letter|
    #can also write it as string.chars.each do |letter|
    letter.to_sym
  end
end

def encode(hash, string)
  result = []
  string_to_array(string).map do |letter| 
    result.push(hash[letter.downcase])
  end
  result = result.join(" ")
  result
end