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

def decode(string)
  result = []
  array = string.split(" ").to_a
   array.map do |word|
    result.push(word[0].to_str)  
  end
  result.join.downcase
end








