# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Initialize card types

CardType.create name: "Creature"
CardType.create name: "Land"
CardType.create name: "Enchantment"
CardType.create name: "Artifact"
CardType.create name: "Instant"
CardType.create name: "Sorcery"

# Beginner's decks

Deck.create category: "b",
  title: "White: Auras",
  slug: "white"

Deck.create category: "b",
  title: "Blue: Tempo",
  slug: "blue"

Deck.create category: "b",
  title: "Black: Sacrifice",
  slug: "black"

Deck.create category: "b",
  title: "Red: Goblins",
  slug: "red"

Deck.create category: "b",
  title: "Green: Ramp",
  slug: "green"

# Advanced decks

Deck.create category: "a",
  title: "White and blue: Auras",
  slug: "white-blue"

Deck.create category: "a",
  title: "Blue and green: Tempo",
  slug: "blue-green"

Deck.create category: "a",
  title: "Black and white: Sacrifice",
  slug: "black-white"

Deck.create category: "a",
  title: "Red and black: Goblins",
  slug: "red-black"

Deck.create category: "a",
  title: "Green and red: Ramp",
  slug: "green-red"
