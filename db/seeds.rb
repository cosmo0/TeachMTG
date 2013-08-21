# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

##### Initialize card types

type_creature = CardType.find_or_create_by_name "Creature"
type_land = CardType.find_or_create_by_name "Land"
type_enchantment = CardType.find_or_create_by_name "Enchantment"
type_artifact = CardType.find_or_create_by_name "Artifact"
type_instant = CardType.find_or_create_by_name "Instant"
type_sorcery = CardType.find_or_create_by_name "Sorcery"

##### Beginner's decks

# White

deck_white = Deck.find_or_create_by_slug category: "B", title: "White: Auras", slug: "white"
Card.create deck: deck_white, card_type: type_land, quantity: 24, name: "Plains"
Card.create deck: deck_white, card_type: type_creature, quantity: 4, name: "Elite Vanguard"
Card.create deck: deck_white, card_type: type_enchantment, quantity: 4, name: "Ethereal Armor"
Card.create deck: deck_white, card_type: type_instant, quantity: 2, name: "Rebuke"

# Blue

deck_blue = Deck.find_or_create_by_slug category: "B", title: "Blue: Tempo", slug: "blue"

# Black

deck_black = Deck.find_or_create_by_slug category: "B", title: "Black: Attrition", slug: "black"

# Red

deck_red = Deck.find_or_create_by_slug category: "B", title: "Red: Goblins", slug: "red"

# Green

deck_green = Deck.find_or_create_by_slug category: "B", title: "Green: Ramp", slug: "green"

##### Advanced decks

# White/Blue

deck_wu = Deck.find_or_create_by_slug category: "A", title: "White and blue: Auras", slug: "white-blue"

# Blue/Green

deck_ug = Deck.find_or_create_by_slug category: "A", title: "Blue and green: Tempo", slug: "blue-green"

# Black/White

deck_bw = Deck.find_or_create_by_slug category: "A", title: "Black and white: Attrition", slug: "black-white"

# Red/Black

deck_rb = Deck.find_or_create_by_slug category: "A", title: "Red and black: Goblins", slug: "red-black"

# Red/Green

deck_rg = Deck.find_or_create_by_slug category: "A", title: "Green and red: Ramp", slug: "green-red"
