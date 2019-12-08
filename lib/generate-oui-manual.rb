require 'csv'
require 'pry'
require 'json'

oui_hash = CSV.open('./data/oui.csv').readlines.drop(1).map do | line |
  oui = line[0].chars.each_slice(2).map do |pair|
    pair.join('') + ':'
  end
  oui = oui.join[0...-1]
  {"id": oui, "organization": line[1]}
end

File.open("data/oui-manual.json","w") do |f|
  f.write(JSON.pretty_generate(oui_hash))
end
