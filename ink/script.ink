VAR lizard = false
VAR ferret = false
VAR goldfish_count = 0
VAR pet_food = false
VAR human_food = false
VAR cage_bought = false

-> pet_store.beginning
=== pet_store ===
= beginning 
You are standing in front of a petshop. You are looking to purchase a pet. In the front windows, little animals {~run|mill|graze} about. You are excited about the prospect of getting a new companion.

- (front)

* [Examine the front] A sign states "The Animal Kingdom" in dark green.
-> front

* [Examine the animals] There's rabbits in the window! How cute!
-> front

* ->

You open the door and step inside
-> entrance

= entrance
The petshop is spacious. Shelfs of colorful cages line the store. In the back is a pleasant blue glow from the aquariums. You see cages of reptiles, mammals, fish, and more. There's a register at the front.

- (selection)

+ [Check out the reptiles] You decide that you might want a reptile.
-> reptiles

+ [Check out the mammals] You decide that you might want a fluffy mammal.
-> mammals

+ [Check out the fish] You decide you might want a fish.
-> fish

* [Check out] You decide you are done shopping.
-> check_out

- (selection_2)

+ {not pet_food && not human_food} [Browse for food] You decide you might want to shop for some animal food.
-> food

+ {not cage_bought} [Browse for a cage] Of course, your future pet needs a place to live.
-> cage

* [Check out] You decide you are done shopping.
-> check_out

= cage
You see numerous colorful cages.

* [Purchase a cage] You purchase a cage for your new pet!
~ cage_bought = true

+ [Look in another section] You decide to look around.

- 
-> selection_2

= food

* [Buy food for yourself] You decide to buy some pet food for yourself.
~ human_food = true
-> food

* {ferret or lizard or goldfish_count > 0} [Buy food for your pet] You buy food for your pet.
~ pet_food = true
-> food

+ {not pet_food or not human_food} [Look in another section] You decide to look around.
-> entrance.selection_2

* ->
You've bought enough food. You decide to look around in another section.
-> entrance.selection_2

= check_out
You decide it's time to check out.

{
- not lizard and not ferret and not goldfish_count : "That'll be zero dollars," the cashier says.
- else: "Thank you for your purchase," the cashier says.
}

You decide to return home
-> home

= home
You return home with <> {
- not lizard and not ferret and not goldfish_count : nothing. What're you even doing at a pet store? 
-> END
- else: your new {goldfish_count>0:goldfish}{ferret:ferret}{lizard:skink}.
}

{
- not cage: Unfortunately, your new pet has nowhere to stay... Whoops!
- else: Thankfully, you remembered to buy a cage!
}

{
- not pet_food: For some reason, you decided against buying pet food. You monster!
- else: Your new pet munches down on some yummy pet food. How cute...
}

{human_food: You munch down on your recently purchased dog treats... bacon flavored. How wonderful it is to treat yourself to a delicious meal.}

-> END

= mammals
You walk over to the mammal section. You see a {~fat hampster chewing lazily on a sunflower seed|bunny nippling on a long thing of hay)}. However, the playful ferrets catch your eye.

- (mammal_selection)

* [Examine the ferrets closely] One ferret is blond, the other is brown, but they are both long and round. They chase each other quickly through it's enclosure.
-> mammal_selection

* [Purchase a ferret] You decide to purchase a ferret. It is just too dang playful.
~ ferret = true
Having decided to purchase a ferret, you leave the mammal section.
-> entrance.selection_2

+ [Look in another section] Before deciding just yet on a pet, you decide to look around.
-> entrance.selection

= fish
You walk over to the aquariums. There's a bathroom in the corner. You see a {~pearlescent betta fish swimming aimlessly|small shrimp cleaning the aquarium glass}. However, you decide you may want a goldfish.

- (goldfish_selection)

* [Examine the fish closely] The goldfish are small, yet fat. There orange scales are lustrous.
-> goldfish_selection

* [Purchase a goldfish] You decide to purchase a goldfish. It's just too dang orange.
~ goldfish_count = 1
- - (goldfish) There {are three more|are two more|is one more|is no more} goldfish swimming in the tank. Would you like to purchase another?
+ + {goldfish_count < 4} [Yes] You decide to purchase another goldfish.
~ goldfish_count += 1
-> goldfish

+ + {goldfish_count < 4} [No] You decide against purchasing another goldfish.
-> goldfish

* * -> 
You decide to head back to the entrance.
-> entrance.selection_2

+ [Go to the bathroom] You enter the bathroom
-> bathroom

+ [Look in another section] Before deciding just yet on a pet, you decide to look around.
-> entrance.selection

= bathroom
It's small, dark, and damp. The toilet is slightly yellow with age. The mirror is cracked and dirty. It smells like an animal cage.

- (bathroom_selection)

* [Pee] You take a nice long pee.

* * [Wash your hands] Squeaky clean!

* * [Decide not to] You're nasty!

- - 
-> bathroom_selection

+ [Examine yourself] {!You are one beautiful specimen!|Such strinking features!|Enough looking in the mirror...}. You grow tired of looking in the mirror.
-> bathroom_selection

+ [Return to the aquariums] You decide to return to the aquariums.
-> fish


= reptiles
You walk over to the reptilian section. You see a {&bearded dragon bathing in a sun lamp|king snake curled up under a log|chameleon ambling up a branch}. However, one particular creature catches your eye, a blue tongued skink staring lazily up to you.

- (reptile_selection)

* [Examine the creature closely] You the lizard is thin, flat, and speckled with brown. It tastes the air with it's startingly blue tongue. 
-> reptile_selection

* [Purchase the lizard] You decide to purchase the lizard. It's tongue is just too dang blue!
~ lizard = true
Having decided to purchase the lizard, you leave the reptile section.
-> entrance.selection_2

+ [Look in another section] Before deciding just yet on a pet, you decide to look around.
-> entrance.selection