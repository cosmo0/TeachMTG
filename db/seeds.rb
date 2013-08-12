# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Initialize card types

CardType.find_or_create_by_name "Creature"
CardType.find_or_create_by_name "Land"
CardType.find_or_create_by_name "Enchantment"
CardType.find_or_create_by_name "Artifact"
CardType.find_or_create_by_name "Instant"
CardType.find_or_create_by_name "Sorcery"

# Beginner's decks

deck_white = Deck.find_or_create_by_slug category: "b",
             title: "White: Auras",
             slug: "white"
Card.create deck: deck_white,
            card_type: CardType.find_by_name("Land"),
            quantity: 24,
            name: "Plains"
Card.create deck: deck_white,
            card_type: CardType.find_by_name("Creature"),
            quantity: 4,
            name: "Elite Vanguard"
Card.create deck: deck_white,
            card_type: CardType.find_by_name("Enchantment"),
            quantity: 4,
            name: "Ethereal Armor"
Card.create deck: deck_white,
            card_type: CardType.find_by_name("Instant"),
            quantity: 2,
            name: "Rebuke"

Deck.find_or_create_by_slug category: "b",
            title: "Blue: Tempo",
            slug: "blue"

Deck.find_or_create_by_slug category: "b",
            title: "Black: Sacrifice",
            slug: "black"

Deck.find_or_create_by_slug category: "b",
            title: "Red: Goblins",
            slug: "red"

Deck.find_or_create_by_slug category: "b",
            title: "Green: Ramp",
            slug: "green"

# Advanced decks

Deck.find_or_create_by_slug category: "a",
            title: "White and blue: Auras",
            slug: "white-blue"

Deck.find_or_create_by_slug category: "a",
            title: "Blue and green: Tempo",
            slug: "blue-green"

Deck.find_or_create_by_slug category: "a",
            title: "Black and white: Sacrifice",
            slug: "black-white"

Deck.find_or_create_by_slug category: "a",
            title: "Red and black: Goblins",
            slug: "red-black"

Deck.find_or_create_by_slug category: "a",
            title: "Green and red: Ramp",
            slug: "green-red"
