/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/
VAR sanity = 20
VAR play_name = " "
->naming
== naming ==
Choose your name traveler

* [Sam]
~ play_name = "Sam"
-> ocean

* [bubbles]
~ play_name = "Bubbles"
-> ocean

*[Finny]
~ play_name = "Finny"
-> ocean

== ocean ==
Just a small fish named {play_name} in the big ocean with a few notable areas around you.

 + [Go and explore north of the vast ocean.] -> North
 
 + [Go and explore south of the vast ocean.] -> South
 
 +[Go and explore East of the vast ocean] -> East
 
 + {sanity < 20} [You can now see something up west you couldn't before, go west?] -> west
 
 * [Go to the myersterious treasure chest, who knows what surpises await you.] -> Treasure
 
 + {Treasure} [Go to the empty treasure chest] -> empty
 
 == North ==
 You see a shipwreck in the distantce
 + {not Treasure}There is a shark in the way do you keep going anyways? -> Eaten
 
 + {(Treasure && not shark_free)} [Use the bait to get rid of the shark] -> shark_free
 + {shark_free} [Go to shipwreck] -> shark_free
 
 + [Go Back] -> ocean
 
 == South ==
 There is a school of other fishes.
 + [Join them] -> school
 + [Go Back] -> ocean
 
 == East ==
* There is a cool looking doll by the coral reef, but something tells you it means bad business, do you pick it up?
~sanity = 10 
-> ocean

+ {sanity == 20} [Go Back] -> ocean

+ {sanity < 20} [There is just bad vibes here now, probably best not to stay here for long] -> ocean
 
 == west ==
 How strange in the corner of your you see what looks like to be a tarot card, maybe you will get a good reading?
 *[pick up tarot card] 
 ~sanity = 0
 -> Oh_no
 
 +[Go back because this is getting weird] -> ocean
 
 == Oh_no ==
 You picked up the card and it is revealed to be the devil card, all the sudden you feel so much worse than before.
 + {sanity == 0} [Run away] -> mines
 
 == mines ==
 While you were running away since now you are really freaked out, {play_name} ran straight into a mine triggering a large explosion, but fortunately it was just {play_name} that was caught in it
 ->END

 
 == Treasure ==
Upon apporaching the chest you noticed that all it had was just bait, but you take it just in case it is useful.
+ [Go Back] -> ocean

== empty ==
You already took everything the chest had.
+ [Go Back] -> ocean

== shark_free ==
You can access the abandoned shipwreck now
+ Explore the wreck. -> wreck
+ [Go Back] -> ocean

== wreck ==
As you explore the ship you noticed a big red button with faded text that you can't make out.
+ [Push the button] -> boom
+ [Go back] -> shark_free

== boom ==
The button activated a loud blaring alarm, that is saying something, but you can barely hear it. Although it never mattered since the ship released a nuke destorying everything around you which also includes you {play_name} the fish.
-> END

== school ==
Class is offically in session for you, so get ready for this for next upcoming years of your life :)
-> END

== Eaten ==
The shark eats you whole :(
-> END