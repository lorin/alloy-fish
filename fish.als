open util/ordering[House]

abstract sig House {
    occupant: one Person,
    color: one Color
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
one sig Birds, Cats, Dogs, Horses, Fish

abstract sig Cigarette {}
one sig PallMal, Dunhill, Marlboro, Winfield, Rothmans extends Cigarette {}

run {} for exatly 5 Person

