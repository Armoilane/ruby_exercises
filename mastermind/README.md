Welcome to Mastermind as a part of the Odin Project curriculum.

The game works as it should on the command line without decorations.

Feedback is given in text and numbers. 

The AI portion of this game is unfinished. It does guess randomly at the moment and keeps track of hits with the same feedback as is given to the player, but doesn't adjust its guesses in any intelligent way.

First I thought to make the AI see the correct colors as they were met, but then I thought of that as cheating and made an attempt to solve the puzzle by having it only keep track of the black and white feedback as the player does. That ended up getting me to trouble after the first few iterations. 

There are counters in the AI to keep track of the black and white hits in each guess as well as keep the guess from the previous round. All the previous guesses should propably be kept track of to allow for more educated guesses later on. 

The methods giving feedback are the same for the player and the AI so they could be taken into a separate module after a bit of refactoring to keep it DRY.