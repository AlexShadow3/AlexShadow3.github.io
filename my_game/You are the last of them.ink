#theme: dark
#author: Alexandre BOBIS
# IMAGE: ../images/island.png

VAR food = 0
VAR newfood = 0
VAR water = 0
VAR newwater = 0
VAR wood = 0
VAR newwood = 0
VAR rock = 0
VAR newrock = 0
VAR random = 0
VAR puzzlePieces = 0
VAR waterPiecePuzzle = 0
VAR cavePiecePuzzle = 0
VAR explorationPiecePuzzle = 0
VAR monkeyPiecePuzzle = 0


PACIFIC OCEAN, 2020
Foreover Island

-> start

=== start ===

You are dreaming, dreaming of your wife and your two children. They are on a beach and you are taking a picture of them. But...

You're waking up, strongly breathing. You don't know where you are, you are looking around you but nothing, only a beach with sand, and a silent forest behind you.

You easily understand that you are alone, like in this video game you were playing when you were young.

You have a first choice to do... -> camping

=== camping ===

* [Camping on the beach] -> beach
# IMAGE: ../images/beach.png
* [Camping in the forest]-> forest
# IMAGE: ../images/forest.png

=== forest ===

It's not a sure place... -> camping

=== beach ===

It seems to be the greatest idea now. But you will need to build a little house, fish, cook, bake... The task will not be easy...

Now that we have our camp, we can decide...

+ [Cut wood] -> cut0
# IMAGE: ../images/cut_wood.png
+ [Fish] -> fish0
# IMAGE: ../images/fish.png

=== cut0 ===

You go to the forest to cut wood but... you have nothing to cut...

+ [Fish] ->fish0

=== fish0 ===

You take a stickwood on the floor and go into the sea to fish. You first retrieve your clothes and jumb in the water. You are not going to catch fishes, but crabs and shellfish.

Five minute past... A CRAB !!!
# IMAGE: ../images/crab.png
You have to catch it.

* [Catch]
~food += RANDOM(1, 3)
Well done, you caught it. Your current food supply is {food}.
->setup0

=== setup0 ===

We have food now... but we need to do a firecamp. Let's catch stickwood.
# IMAGE: ../images/firecamp.png

+ [Catch]
~newwood += RANDOM(1, 5)
~wood += newwood
You found {newwood} stickwood.
You have now {wood} stickwood
~newwood = 0

->checkwood

=== checkwood ===

{wood<3:
  You realize you don't have enough stickwood to build a fire camp. You need to go back and find more.-> setup0
- else:
  You have enough stickwood to build a fire camp.
  -> firecamp
}

=== firecamp ===

You prepare the wood by taking three stickwood
~wood -= 3
Now, you take two rocks in your hands and you rub them together ->rub

=== rub ===

# IMAGE: ../images/rub.png
+[Rub] *Rubs*
~random += RANDOM(1, 10)
{random<7:
    You need to rub again...
    ~random = 0
    ->rub
- else:
    You started the firecamp
    ~random = 0
}

# IMAGE: ../images/sunset.png
But the sun sets... it's the time to stay around the firecamp if you don't want to be turned into an ice cube...

Let's eat a crab you have caught and then sleep.
~food -= 1

It's the end of the first day... 
-> dream

=== dream ===

You are dreaming, dreaming of your wife and your two children. They are on a beach and you are taking a picture of them. But...

You're waking up, strongly breathing. You know where you are, you are looking around and you can see your firecamp, but it is turned off. You will need to turn it back on. 
-> next

=== next ===

You have {food} supplies of food, {wood} supplies of stickwood and {water} supplies of water. What do you want to do ?

+ [Fish] -> fish
+ [Catch wood] -> forest1
+ [Catch rocks] -> stone
{explorationPiecePuzzle == 0:
    + [Explore] -> explore0
- else:
    * [Explore] -> explore1
    + [Filter water] -> filterwater
    + [Drink] -> drink
}
+ [Eat] -> eat
+ [Sleep] -> sleep

=== sleep ===

You go to sleep...
But first, you need to rub the rocks
+[Rub] *Rubs*
~random += RANDOM(1, 10)
{random<7:
    You need to rub again...
    ~random = 0
    ->rub
- else:
    You started the firecamp
    ~random = 0
}

=== filterwater ===

# IMAGE: ../images/filter_water.png
You approach the sea and take a plastic bottle found on the beach. Fortunately, it seems to be safe... There is nothing else, so...

+ [Filter]
~newwater += RANDOM(1, 5)
~water += newwater
You filtered {newwater} of water.
You have now {water} supplies of water
~newwood = 0

->next

=== drink ===

{water<3:
  You realize you don't have enough water to drink. You need to have water.-> next
- else:
  You drink
  ~water -= 3
  -> next
}

=== eat ===

{food<3:
  You realize you don't have enough food to eat. You need to fish.-> next
- else:
  You eat
  ~food -= 3
  -> next
}

=== fish ===

You take your stickwood, retrieve your clothes and jump in the water.

+ [Catch]
~random += RANDOM(1, 100)
{random>99 && waterPiecePuzzle==0:
    What is that ??? You found a piece, like a piece of a circle puzzle...
    ~puzzlePieces += 1
    ~waterPiecePuzzle += 1
    ~random=0
    -> isthepuzzlecomplete
- else:
    ~random=0
    ~food += RANDOM(1, 3)
    Well done, you caught it. Your current food supply is {food}.
    -> next
}

=== forest1 ===

You go into the forest to take wood.
Monkeys are playing in the trees.

+ [Try to call the monkeys] -> monkeys0
    # IMAGE: ../images/monkey.png
+ [Catch wood] -> catchwood

=== monkeys0 ===

You notice that they speak the same language as you. Perhaps they have already known other survivors ?
A monkey offers you to exchange, here is the list of possible exchanges:
5 fishes against 3 stickwood
5 rocks against 3 stickwood
5 of wood against 6 of water
100 stickwood against a mystery object
-> exchange

=== exchange ===

+ [5 fishes against 3 stickwood] -> fishexchange
+ [5 rocks against 3 stickwood] -> rockexchange
+ [10 of wood against 6 of water]
{monkeyPiecePuzzle==0:
    + [100 stickwood against a mystery object] -> mysteryobject
- else:
    * [Piece already bought] ->exchange
}
+ [Catch wood] ->catchwood
+ [Return to the beach] -> next

=== fishexchange ===

{food>5:
   You realize you don't have enough fishes to exchange. You need to fish.-> exchange
- else:
   You gave it 5 fishes. It gave you 3 stickwood
   ~food -= 5
   ~wood += 3
   -> exchange
}

=== rockexchange ===

{rock>5:
   You realize you don't have enough rocks to exchange. You need to catch rocks.-> exchange
- else:
   You gave it 5 rocks. It gave you 3 stickwood
   ~rock -= 5
   ~wood += 3
   -> exchange
}

=== waterexchange ===

{wood>10:
   You realize you don't have enough wood to exchange. You need to cut wood or exchange it.-> exchange
- else:
   You gave it 10 wood. It gave you 6 of water.
   ~wood -= 10
   ~water += 6
   -> exchange
}

=== catchwood ===

~newwood += RANDOM(1, 5)
~wood += newwood
You found {newwood} stickwood.
You have now {wood} stickwood.
~newwood = 0
You return to the beach.
-> next

=== mysteryobject ===

{wood>100:
   You realize you don't have enough wood to exchange. You need to cut wood.-> exchange
- else:
   You gave it 100 supplies of wood. It gave you the mystery object, it's a piece, like a piece of a circle puzzle.
   ~wood -= 100
   -> isthepuzzlecomplete
}

=== stone ===

# IMAGE: ../images/stones.png
They are a lot of rocks on this lagoon.

+ [Pushing the stones]
~random += RANDOM(1, 100)
{random>99 && cavePiecePuzzle==0:
    What is that ??? You found a cave... You enter in it...
    ~random=0
    -> cave
- else:
    ~random=0
    ~newrock += RANDOM(1, 3)
    ~rock += newrock
    You found {newrock} rocks.
    You have now {rock} rocks.
    ~newrock = 0
}

=== cave ===

# IMAGE: ../images/cave.png
You are now in the cave. Something seems to light up the cave, you continue to advance and fall on a small room. In this room, there is... a piece, like a piece of a circle puzzle.
You take the piece and remember the film when Indiana Jones took the golden statuette...
You ear a loud noise, it seems that the cave is going to collapse.
You run, until the sunlight.
You have escape the cave, with the piece of puzzle, good job !
~puzzlePieces += 1
~cavePiecePuzzle +=1
-> isthepuzzlecomplete

=== explore0 ===

# IMAGE: ../images/tent.png
You decided to explore, so let's try to find Something
You walk for twenty minutes and fall on a tent. You try to call someone, but nothing...
You enter in it, there is just a parrot, it is asking for help, you approach him.
It is asking you for fishes, stones and letting him escape from his little cage...
{rock>=10 && fish>=10:
    You give it what you have and it thanks you.
    In return, it gives you a puzzle piece and a water filter.
    ~puzzlePieces += 1
    ~explorationPiecePuzzle = 1
    -> isthepuzzlecomplete
- else:
    You can not give it what you have...
    You return to the beach.
    -> next
}

=== explore1 ===

# IMAGE: ../images/tent.png
You decided to explore, so let's try to find Something
You walk for twenty minutes and fall on a tent. You try to call someone, but nothing...
You enter in it, there is a very old woman, she is asking for help, you approach her.
She is asking you for her parrot...

+ [You answer that you don't know] ->idonotknow
+ [You answer that you help it to escape from his jail] -> iknow


=== idonotknow ===

She lets you go. You shouldn't come back, who knows what she would do to you if she knew the truth...
You return to the beach
-> next

=== iknow ===

She orders you to never come back.
You return to the beach
-> next

=== isthepuzzlecomplete ===

You return to the beach...

{puzzlePieces==4:
    You have now the four pieces of the puzzle
    -> lastScene
}
{puzzlePieces==3:
    You have now three pieces of the puzzle
    -> next
}
{puzzlePieces==2:
    You have now two pieces of the puzzle
    -> next
}
{puzzlePieces==1:
    You have now one piece of the puzzle
    -> next
}

=== lastScene ===

You take the four pieces and try to assemble them, there is like a handprint drawn on it.
You put your hand and the puzzle starts to sparkle. 
You close your eyes, dazzled by the light
And... nothing more
Just the dark... again and again...
Then you fall asleep...

You are dreaming, dreaming of your wife and your two children. They are on a beach and you are taking a picture of them. But...

You're waking up, strongly breathing. You don't know where you are, you are looking around you but nothing, only a beach with sand, and a silent forest behind you...

-> END
