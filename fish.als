open util/ordering[House]

sig House {
    color: one Color
}

abstract sig Person {
	occupies: one House,
    drinks: one Beverage,
    smokes: one Cigarette,
    keeps: one Pet
}
one sig Brit, Swede, Dane, Norwegian, German extends Person {}

abstract sig Color {}
one sig White, Yellow, Blue, Red, Green extends Color {}

abstract sig Beverage {}
one sig Tea, Coffee, Milk, Beer, Water extends Beverage {}

abstract sig Pet {}
one sig Birds, Cats, Dogs, Horses, Fish extends Pet {}

abstract sig Cigarette {}
one sig PallMall, Dunhill, Marlboro, Winfield, Rothmans extends Cigarette {}

fact allRelationsAreOneToOne {
	color.~color in iden
	occupies.~occupies in iden
	drinks.~drinks in iden
	smokes.~smokes in iden
	keeps.~keeps in iden
}

pred problemConstraints {

    // The Brit lives in the red house
    Red in Brit.occupies.color

    //The Swede keeps dogs as pets
    Dogs in Swede.keeps

    // The Dane drinks tea
    Tea in Dane.drinks

    // The green house is on the left of the white house
    Green in prev[color.White].color

    // The green house's owner drinks coffee
    Coffee in (occupies.(color.Green)).drinks

    // The person who smokes Pall Mall rears birds
    Birds in (smokes.PallMall).keeps

    // The owner of the yellow house smokes Dunhill
    Dunhill in (occupies.(color.Yellow)).smokes

    // The man living in the centre house drinks milk
    (drinks.Milk).occupies in first[].next.next

    // The Norwegian lives in the first house
    Norwegian in occupies.first[]

    // The person who smokes Marlboro lives next to the one who keeps cats
    (smokes.Marlboro).occupies in (keeps.Cats).occupies.(next + prev)

    // The person who keeps horses lives next to the person who smokes Dunhill
    (keeps.Horses).occupies in (smokes.Dunhill).occupies.(next + prev)

    // The person who smokes Winfield drinks beer
    Beer in (smokes.Winfield).drinks

    // The German smokes Rothmans
    German in smokes.Rothmans

    // The Norwegian lives next to the blue house
    Blue in Norwegian.occupies.(next+prev).color

    // The person who smokes Marlboro has a neigbor who drinks water
    (drinks.Water).occupies in (smokes.Marlboro).occupies.(next+prev)

}

run problemConstraints for exactly 5 House

