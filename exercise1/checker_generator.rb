function_symbols = ['cat', 'miacis', 'hyena', 'weasel', 'cynodictis', 'raccoon', 'bear', 'tomarctus', 'fox', 'wolf', 'dog']

function_symbols.repeated_permutation(2) do |a, b|
  puts "descendsFrom(#{a}, #{b})."
end
