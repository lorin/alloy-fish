open util/ordering[House]

sig House {
    color: one Color
} 

fact allRelationsAreOneToOne {
	occupies.~occupies in iden
	color.~color in iden
	drinks.~drinks in iden
	smokes.~smokes in iden
	keeps.~keeps in iden
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
one sig PallMal, Dunhill, Marlboro, Winfield, Rothmans extends Cigarette {}

pred problemConstraints {

// The Brit lives in the red house
Red in Brit.occupies.color

/*
The Swede keeps dogs as pets
The Dane drinks tea
The green house is on the left of the white house
The green house's owner drinks coffee
The person who smokes Pall Mall rears birds
The owner of the yellow house smokes Dunhill
The man living in the centre house drinks milk
The Norwegian lives in the first house
The person who smokes Marlboro lives next to the one who keeps cats
The person who keeps horses lives next to the person who smokes Dunhill
The person who smokes Winfield drinks beer
The German smokes Rothmans
The Norwegian lives next to the blue house
The person who smokes Marlboro has a neigbor who drinks water
*/

}

run problemConstraints for exactly 5 House

