['DOTA Summit', 'EPICENTER 2017', 'The International 2017', 'StarLadder i-League Invitational', 'StarLadder i-League StarSeries Season 3'].each do |name|
  Tourney.create(name: name)
  p "---> #{name} tourney added"
end
