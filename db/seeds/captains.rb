
galactics = Team.find_by(name: "The Galactics")
vukosi = Player.create(first_name: "Vukosi", last_name: "Kazamula", team: galactics)
galactics_captain = vukosi

uns_captain = Player.where("last_name = ? AND first_name = ?", "Chapman", "Jack")
uns_captain.update(captain: true)
