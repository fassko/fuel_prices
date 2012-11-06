require 'rubygems'
require 'hpricot'
require 'open-uri'

doc = open("http://www.statoil.lv/lv/produkti_un_pakalpojumi/degviela/degvielas_cenas/") { |f| Hpricot(f) }

print "Automātiskās DUS: \n"

aut = doc.at('//div[@class="insideHeading"]/h3[text()~="automātiskajās"]')

print "95 Ultima " + aut.following[1].children[3].inner_text + "\n"

print "98 Ultima " + aut.following[3].children[1].children[1].inner_text.slice(5..-1) + "\n"

print "D Fortis  " + aut.following[5].children[3].inner_text

print "\n\nPilna servisa DUS:\n"

pilna = doc.at('//div[@class="insideHeading"]/h3[text()~="pilna"]')

print "95 Ultima " + pilna.following[3].children[3].inner_text + "\n"

print "98 Ultima " + pilna.following[5].children[3].inner_text + "\n"

print "D Fortis  " + pilna.following[7].children[3].inner_text + "\n"

print "D Fortis+ " + pilna.following[9].children[3].inner_text