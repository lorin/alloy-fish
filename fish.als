open util/ordering[House]

sig House {
    occupant: one Person,
    color: one Color
} 

fact oneHousePerOccupant{
	occupant.~occupant in iden
}

fact oneHousePerColor {
	color.~color in iden
}

abstract sig Person {
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

run {}

