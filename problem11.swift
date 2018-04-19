
import Foundation

/** 
Crossing the bridge, you've barely reached the other side of the stream when a program comes up to you, clearly in distress. "It's my child process," she says, "he's gotten lost in an infinite grid!"

Fortunately for her, you have plenty of experience with infinite grids.

Unfortunately for you, it's a hex grid.

The hexagons ("hexes") in this grid are aligned such that adjacent hexes can be found to the north, northeast, southeast, south, southwest, and northwest:

  \ n  /
nw +--+ ne
  /    \
-+      +-
  \    /
sw +--+ se
  / s  \
You have the path the child process took. Starting where he started, you need to determine the fewest number of steps required to reach him. (A "step" means to move from the hex you are in to any adjacent hex.)

For example:

ne,ne,ne is 3 steps away.
ne,ne,sw,sw is 0 steps away (back where you started).
ne,ne,s,s is 2 steps away (se,se).
se,sw,se,sw,sw is 3 steps away (s,s,sw).

--- Part Two ---

How many steps away is the furthest he ever got from his starting position?
*/

let input = """
se,n,n,n,n,n,se,se,nw,nw,sw,sw,nw,nw,se,n,nw,sw,se,nw,sw,sw,se,s,nw,sw,s,sw,s,s,s,s,s,s,s,ne,s,sw,s,s,sw,s,s,se,se,s,ne,sw,nw,se,s,s,se,ne,s,se,se,s,se,sw,se,se,se,se,se,se,se,se,se,n,se,se,se,se,se,se,se,se,se,ne,se,se,sw,se,nw,ne,n,se,n,ne,ne,ne,ne,nw,se,ne,ne,ne,ne,ne,ne,ne,ne,nw,ne,ne,n,ne,ne,sw,n,ne,ne,s,nw,ne,ne,ne,s,ne,sw,ne,n,n,se,ne,ne,n,ne,n,nw,n,sw,n,n,ne,s,n,n,n,sw,nw,se,n,n,s,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,nw,n,nw,n,nw,nw,n,n,n,n,sw,nw,nw,nw,sw,sw,nw,n,nw,s,nw,ne,ne,sw,nw,s,n,n,nw,n,nw,n,nw,n,nw,n,nw,nw,sw,nw,s,ne,s,nw,nw,n,nw,nw,sw,nw,nw,sw,nw,se,nw,nw,nw,sw,ne,nw,nw,nw,s,nw,s,sw,nw,nw,nw,n,nw,nw,s,ne,nw,sw,nw,se,nw,nw,nw,nw,nw,nw,nw,nw,nw,nw,nw,s,s,nw,nw,sw,sw,nw,nw,se,sw,nw,n,nw,nw,sw,nw,n,nw,nw,nw,nw,nw,nw,sw,sw,n,nw,sw,sw,sw,sw,n,nw,se,nw,sw,nw,nw,sw,nw,sw,sw,nw,sw,nw,n,sw,sw,ne,sw,n,nw,sw,sw,nw,sw,sw,sw,nw,sw,sw,nw,sw,n,sw,sw,sw,s,sw,sw,sw,sw,sw,s,sw,sw,sw,sw,se,sw,sw,sw,sw,sw,sw,n,sw,sw,se,sw,sw,sw,sw,sw,nw,sw,sw,ne,n,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,s,nw,sw,sw,sw,se,s,sw,sw,sw,sw,s,sw,sw,sw,sw,sw,n,sw,s,sw,sw,se,s,nw,sw,sw,s,s,s,sw,s,sw,sw,s,sw,s,s,sw,sw,sw,sw,s,n,nw,s,s,ne,sw,s,nw,s,s,s,sw,sw,sw,s,sw,s,se,ne,ne,s,nw,sw,ne,s,s,sw,s,s,s,nw,sw,se,sw,s,n,sw,s,s,s,s,sw,s,s,se,nw,s,s,s,s,n,s,s,s,s,s,nw,s,s,s,s,s,s,s,s,sw,nw,nw,s,s,s,s,s,s,s,s,s,s,s,s,sw,s,n,s,s,se,s,nw,n,s,s,s,s,nw,s,s,s,s,s,se,se,ne,s,nw,s,s,se,ne,s,ne,s,se,s,n,ne,s,s,s,se,ne,nw,sw,s,se,se,se,s,s,sw,s,n,s,sw,se,s,se,s,ne,se,se,se,se,se,se,sw,nw,s,se,s,s,sw,nw,sw,se,se,ne,s,s,n,se,se,se,se,se,s,ne,s,s,se,s,n,s,nw,se,se,se,s,s,s,s,se,s,se,se,se,s,se,se,sw,se,s,sw,se,se,sw,s,s,nw,se,se,se,se,se,n,s,se,s,s,se,se,s,n,s,se,se,sw,se,nw,se,se,ne,sw,se,se,nw,se,s,ne,se,se,sw,s,se,se,sw,sw,se,se,se,se,se,se,ne,se,se,s,nw,se,s,se,s,se,se,sw,se,se,se,ne,se,s,nw,nw,se,se,se,se,s,se,se,ne,se,se,n,se,nw,n,se,se,n,se,s,se,ne,se,se,se,se,se,se,ne,se,se,nw,se,sw,ne,ne,se,se,se,se,ne,se,se,se,ne,se,n,nw,nw,se,se,s,n,se,se,n,se,ne,ne,ne,se,ne,se,se,se,s,se,se,ne,se,se,se,s,se,se,se,n,ne,se,ne,n,se,se,nw,ne,se,se,se,nw,nw,se,se,ne,ne,ne,se,se,se,se,s,nw,se,se,nw,ne,sw,se,se,se,se,ne,ne,ne,s,se,sw,nw,se,sw,se,se,s,ne,ne,n,n,ne,se,se,se,se,s,ne,ne,ne,s,sw,se,nw,se,ne,sw,se,ne,ne,ne,s,ne,ne,ne,se,se,ne,ne,ne,nw,se,se,se,se,sw,se,se,s,ne,ne,se,n,ne,se,se,n,se,sw,ne,se,ne,ne,se,ne,ne,se,se,sw,ne,ne,se,n,n,ne,ne,se,sw,ne,se,ne,ne,s,ne,ne,ne,se,ne,ne,ne,ne,ne,ne,nw,sw,n,ne,ne,ne,ne,n,ne,ne,ne,nw,se,ne,se,ne,se,ne,sw,ne,se,ne,ne,ne,ne,se,ne,ne,nw,ne,se,ne,ne,ne,ne,ne,s,ne,ne,ne,ne,n,nw,ne,se,n,ne,sw,ne,ne,sw,se,ne,ne,ne,se,ne,se,se,se,nw,ne,ne,se,ne,ne,ne,ne,ne,nw,ne,n,sw,ne,ne,ne,ne,ne,se,ne,nw,ne,ne,ne,ne,ne,s,ne,ne,ne,ne,n,ne,ne,ne,ne,ne,sw,ne,ne,ne,ne,ne,ne,ne,ne,sw,ne,ne,se,ne,ne,ne,ne,ne,se,s,n,ne,nw,ne,ne,ne,sw,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,n,ne,ne,sw,ne,ne,ne,ne,ne,ne,ne,n,ne,ne,ne,ne,ne,ne,ne,ne,s,ne,ne,n,ne,n,ne,ne,ne,n,ne,ne,n,ne,ne,ne,ne,ne,s,n,ne,n,ne,ne,ne,ne,ne,ne,n,ne,ne,n,ne,nw,ne,ne,ne,ne,ne,sw,ne,nw,n,n,ne,n,n,n,ne,ne,sw,sw,sw,ne,se,n,ne,ne,n,ne,ne,ne,ne,sw,ne,s,ne,ne,se,ne,n,se,ne,n,n,n,n,n,ne,n,ne,ne,n,sw,nw,s,ne,ne,se,ne,n,ne,nw,n,n,n,n,ne,s,n,sw,nw,ne,ne,n,ne,ne,ne,nw,ne,n,n,ne,n,nw,n,ne,se,n,n,se,ne,n,ne,ne,n,ne,ne,sw,n,nw,ne,sw,n,ne,n,n,ne,s,n,n,ne,ne,ne,n,se,n,n,nw,nw,ne,ne,n,sw,sw,ne,n,n,sw,n,se,ne,n,ne,n,ne,n,s,n,ne,ne,n,ne,n,ne,n,ne,se,n,ne,n,n,n,n,n,ne,nw,n,n,n,n,ne,ne,n,ne,ne,nw,n,n,sw,n,n,ne,n,n,n,n,n,n,ne,ne,n,ne,n,n,se,ne,n,n,nw,s,n,n,ne,nw,n,n,ne,ne,ne,n,n,sw,ne,nw,ne,sw,ne,n,ne,n,n,sw,sw,n,ne,s,n,n,se,se,n,sw,n,ne,n,ne,ne,ne,ne,n,ne,n,n,n,nw,s,n,n,n,n,s,n,n,n,s,n,sw,s,n,n,ne,s,n,ne,n,n,ne,n,n,ne,n,sw,n,n,n,n,sw,s,n,n,s,n,n,n,n,n,n,n,n,n,ne,se,se,ne,n,n,se,n,n,s,n,n,n,n,n,n,n,n,nw,n,n,n,n,n,n,ne,n,se,n,n,ne,n,n,n,n,n,sw,n,ne,n,n,s,n,n,nw,n,n,n,n,n,s,n,ne,n,nw,n,se,n,sw,n,n,n,n,se,nw,n,n,nw,s,sw,n,n,n,n,n,n,n,n,n,n,n,n,ne,se,n,n,se,n,n,n,n,n,n,nw,n,n,nw,n,ne,n,nw,nw,n,ne,sw,n,n,n,n,n,n,n,n,n,ne,n,n,n,nw,n,se,sw,n,nw,nw,n,n,n,nw,n,n,n,ne,nw,nw,sw,n,n,sw,nw,nw,n,se,n,ne,n,n,sw,nw,n,s,n,n,n,n,sw,n,n,nw,n,nw,n,n,n,s,nw,n,nw,n,n,n,n,n,n,ne,n,n,n,n,n,nw,n,sw,se,nw,nw,n,n,ne,n,s,n,n,n,n,nw,n,n,sw,n,nw,n,ne,nw,n,n,n,nw,s,nw,nw,ne,n,n,n,n,nw,n,nw,nw,n,n,n,nw,n,n,s,nw,n,s,nw,n,n,n,n,nw,n,n,n,nw,nw,n,nw,ne,n,n,nw,s,nw,ne,n,nw,s,n,ne,n,ne,nw,n,se,ne,nw,se,n,ne,nw,n,n,n,n,nw,n,se,nw,nw,n,n,nw,se,n,n,nw,nw,nw,n,nw,nw,n,nw,sw,nw,nw,s,nw,nw,se,n,s,nw,sw,nw,n,ne,ne,n,nw,sw,nw,nw,nw,n,s,n,n,n,nw,nw,nw,nw,sw,nw,nw,n,se,n,ne,n,n,n,nw,n,nw,ne,nw,n,nw,nw,nw,s,ne,n,n,nw,nw,ne,n,n,nw,s,nw,nw,n,n,nw,n,se,nw,nw,nw,nw,n,nw,nw,nw,n,nw,sw,nw,nw,s,nw,n,n,n,nw,nw,nw,n,n,n,nw,nw,nw,nw,n,n,sw,n,nw,nw,n,nw,n,nw,n,s,nw,nw,nw,nw,n,nw,n,nw,nw,nw,nw,nw,s,nw,ne,se,ne,s,nw,se,nw,n,se,se,nw,se,ne,n,n,nw,nw,nw,n,nw,n,n,nw,nw,n,nw,s,nw,n,n,s,sw,nw,s,n,n,n,n,n,sw,sw,s,ne,n,nw,n,n,s,ne,sw,nw,nw,nw,nw,nw,nw,se,n,nw,nw,nw,nw,nw,n,n,n,nw,nw,nw,nw,ne,nw,nw,nw,n,n,n,nw,s,s,nw,nw,se,nw,n,n,ne,s,n,nw,n,nw,nw,nw,n,nw,ne,n,nw,nw,s,n,nw,n,nw,nw,nw,nw,sw,nw,ne,nw,nw,sw,nw,se,n,nw,nw,ne,nw,se,nw,s,nw,nw,nw,nw,nw,n,nw,nw,nw,nw,nw,ne,nw,nw,n,nw,nw,nw,ne,n,nw,nw,nw,nw,nw,n,ne,nw,nw,sw,se,nw,n,nw,nw,sw,nw,s,nw,nw,nw,ne,nw,nw,nw,ne,nw,nw,nw,se,se,nw,ne,sw,s,nw,nw,n,nw,ne,nw,se,nw,nw,sw,nw,nw,ne,nw,nw,nw,nw,nw,nw,n,nw,n,n,nw,nw,n,nw,se,se,nw,ne,sw,sw,ne,n,nw,nw,s,nw,ne,ne,se,nw,nw,nw,nw,nw,nw,nw,ne,nw,sw,s,nw,nw,nw,nw,nw,nw,nw,ne,ne,nw,nw,nw,nw,nw,nw,nw,nw,nw,ne,nw,sw,ne,n,nw,nw,nw,nw,sw,nw,nw,nw,ne,nw,nw,nw,nw,nw,nw,nw,s,nw,sw,nw,nw,sw,nw,nw,nw,nw,nw,nw,nw,sw,nw,se,sw,nw,nw,nw,nw,sw,nw,nw,s,nw,nw,nw,se,nw,ne,nw,sw,nw,nw,nw,nw,ne,nw,nw,nw,nw,s,se,nw,nw,nw,nw,nw,nw,nw,nw,nw,nw,nw,sw,nw,nw,sw,sw,nw,nw,nw,nw,nw,nw,nw,sw,n,nw,nw,sw,nw,ne,s,nw,se,n,ne,nw,nw,sw,nw,nw,s,sw,s,ne,sw,nw,nw,ne,nw,nw,nw,nw,nw,sw,sw,nw,nw,nw,nw,n,ne,sw,nw,nw,sw,sw,se,nw,nw,nw,nw,nw,nw,nw,nw,n,nw,nw,se,sw,nw,ne,nw,nw,sw,nw,ne,nw,ne,nw,nw,nw,nw,sw,nw,nw,sw,nw,ne,se,nw,nw,nw,sw,nw,nw,nw,nw,sw,nw,nw,s,nw,sw,nw,nw,ne,nw,nw,sw,nw,nw,sw,nw,nw,n,se,nw,sw,nw,sw,nw,sw,sw,nw,n,nw,sw,nw,nw,se,nw,nw,nw,nw,nw,nw,ne,nw,se,sw,sw,sw,nw,sw,nw,nw,sw,nw,nw,nw,nw,nw,nw,nw,nw,sw,nw,nw,s,nw,s,nw,sw,sw,sw,nw,n,nw,sw,sw,se,nw,nw,nw,n,nw,sw,nw,sw,nw,nw,nw,nw,n,nw,sw,sw,nw,nw,nw,sw,sw,sw,nw,nw,sw,s,sw,sw,nw,sw,sw,nw,ne,ne,nw,se,se,nw,sw,nw,sw,sw,nw,nw,nw,sw,sw,nw,nw,sw,n,sw,n,nw,nw,sw,sw,sw,nw,nw,nw,sw,sw,sw,ne,sw,nw,nw,nw,n,nw,se,nw,sw,s,sw,nw,nw,sw,sw,se,sw,sw,nw,sw,sw,nw,nw,nw,nw,sw,nw,nw,sw,nw,nw,sw,sw,nw,sw,sw,s,nw,sw,nw,n,nw,nw,nw,nw,sw,sw,nw,sw,nw,n,nw,sw,se,sw,sw,sw,sw,ne,sw,nw,nw,nw,sw,sw,sw,sw,sw,nw,sw,sw,sw,nw,nw,nw,s,sw,nw,sw,s,s,nw,nw,nw,sw,s,nw,sw,n,nw,s,nw,sw,s,sw,sw,nw,nw,nw,nw,nw,sw,nw,s,ne,n,nw,nw,sw,nw,nw,nw,sw,nw,sw,sw,sw,sw,nw,nw,nw,sw,se,sw,nw,nw,nw,n,sw,se,sw,nw,nw,sw,sw,sw,sw,sw,sw,sw,se,sw,sw,nw,se,sw,sw,sw,sw,se,sw,sw,sw,n,se,sw,nw,sw,sw,ne,sw,sw,sw,ne,nw,nw,sw,sw,sw,sw,sw,nw,sw,n,se,sw,s,ne,sw,nw,nw,nw,sw,nw,se,sw,s,sw,nw,sw,nw,sw,sw,se,nw,se,sw,nw,nw,sw,ne,sw,sw,ne,sw,sw,sw,sw,sw,n,s,sw,nw,sw,nw,nw,ne,ne,nw,sw,sw,sw,sw,nw,ne,sw,nw,sw,nw,sw,sw,sw,sw,nw,sw,sw,nw,ne,sw,sw,se,sw,ne,sw,sw,sw,sw,sw,nw,sw,sw,sw,sw,nw,sw,sw,nw,nw,sw,nw,nw,sw,nw,sw,ne,sw,sw,nw,sw,nw,nw,ne,sw,n,nw,sw,nw,sw,nw,sw,nw,n,sw,sw,sw,sw,sw,sw,sw,sw,nw,sw,s,nw,sw,sw,sw,sw,nw,s,sw,sw,sw,ne,nw,sw,ne,s,se,nw,sw,ne,sw,sw,ne,sw,ne,sw,sw,sw,sw,sw,sw,nw,sw,sw,nw,sw,sw,sw,sw,n,sw,sw,sw,nw,sw,sw,sw,sw,sw,sw,nw,sw,sw,sw,sw,sw,sw,sw,sw,n,sw,s,sw,sw,nw,sw,nw,ne,sw,n,sw,nw,sw,n,sw,sw,ne,sw,sw,sw,sw,sw,sw,sw,ne,sw,sw,nw,sw,sw,sw,n,se,se,sw,sw,sw,n,sw,sw,sw,sw,sw,sw,sw,n,sw,sw,sw,sw,se,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,ne,sw,sw,sw,sw,sw,sw,nw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,n,sw,sw,sw,s,nw,sw,sw,nw,se,sw,ne,sw,sw,nw,n,sw,sw,sw,sw,sw,se,sw,sw,sw,sw,ne,nw,sw,sw,sw,s,sw,s,n,s,se,s,sw,sw,sw,sw,sw,sw,sw,nw,ne,s,sw,ne,sw,s,sw,sw,sw,sw,nw,sw,sw,sw,se,sw,sw,sw,sw,ne,sw,se,sw,sw,sw,se,s,sw,sw,sw,sw,sw,s,s,sw,s,sw,sw,sw,sw,sw,nw,nw,sw,sw,sw,sw,sw,sw,sw,sw,sw,ne,sw,sw,sw,sw,sw,sw,sw,n,s,sw,sw,sw,nw,sw,sw,sw,s,sw,sw,sw,sw,se,sw,sw,sw,ne,sw,s,sw,sw,s,sw,sw,sw,sw,s,sw,sw,sw,sw,s,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,s,sw,nw,sw,sw,nw,sw,sw,n,sw,sw,sw,sw,nw,sw,n,sw,sw,sw,s,s,sw,sw,n,sw,sw,n,sw,sw,sw,sw,sw,sw,s,sw,sw,sw,n,sw,sw,sw,s,sw,n,sw,s,sw,s,sw,n,s,n,sw,sw,s,n,sw,sw,sw,sw,sw,sw,sw,s,sw,sw,sw,sw,sw,s,s,sw,sw,sw,sw,sw,sw,s,sw,s,sw,sw,sw,n,sw,sw,se,sw,s,sw,sw,n,n,n,sw,sw,sw,sw,s,s,s,ne,sw,se,sw,s,n,sw,s,sw,sw,nw,s,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,se,sw,sw,sw,n,sw,sw,sw,sw,se,sw,sw,s,sw,sw,sw,sw,se,s,sw,sw,ne,nw,sw,sw,sw,sw,s,s,sw,n,s,sw,sw,sw,sw,s,sw,sw,sw,s,sw,s,sw,s,sw,sw,sw,sw,sw,sw,sw,sw,sw,n,sw,s,sw,se,sw,sw,se,sw,sw,sw,sw,ne,sw,sw,sw,sw,se,sw,se,s,sw,n,sw,s,s,sw,s,n,ne,sw,s,s,se,s,s,ne,n,s,s,sw,sw,s,ne,sw,sw,sw,sw,sw,sw,n,s,sw,s,sw,sw,sw,s,s,sw,s,sw,sw,n,sw,sw,sw,s,ne,ne,s,sw,sw,sw,s,sw,sw,n,se,sw,sw,sw,s,sw,s,sw,n,s,s,s,n,sw,sw,sw,sw,sw,sw,s,sw,s,s,sw,ne,s,sw,ne,sw,s,sw,s,s,se,sw,sw,sw,s,s,sw,s,sw,sw,sw,s,n,s,s,sw,s,sw,sw,s,s,sw,sw,s,n,s,sw,s,sw,sw,s,sw,se,n,n,n,sw,s,sw,s,sw,s,s,sw,sw,sw,nw,sw,s,s,n,se,sw,nw,sw,sw,sw,sw,sw,sw,sw,sw,s,sw,sw,s,sw,sw,sw,sw,s,s,s,s,sw,s,sw,nw,nw,sw,s,sw,se,se,sw,nw,ne,sw,n,s,s,ne,sw,sw,s,sw,sw,ne,sw,sw,s,nw,s,sw,sw,s,sw,s,se,s,nw,s,sw,s,sw,se,s,s,s,nw,se,s,s,s,s,n,nw,s,n,s,sw,sw,nw,s,sw,nw,s,s,sw,nw,sw,se,s,se,sw,s,s,sw,sw,s,n,s,s,n,sw,sw,s,s,s,sw,s,sw,sw,s,s,sw,n,sw,sw,s,sw,s,s,sw,s,sw,nw,s,sw,s,s,sw,sw,sw,s,sw,s,s,s,ne,sw,sw,s,s,s,s,s,s,sw,nw,s,s,s,sw,s,s,sw,n,s,s,sw,s,n,sw,nw,sw,ne,s,sw,s,s,s,se,sw,sw,nw,n,sw,ne,sw,sw,s,nw,sw,s,s,sw,s,sw,sw,s,sw,nw,s,se,s,s,s,nw,s,ne,s,sw,s,s,s,s,s,s,s,ne,s,nw,s,sw,sw,s,s,s,s,s,ne,s,ne,s,se,sw,n,s,s,se,ne,se,s,s,sw,s,se,s,s,sw,s,s,sw,s,nw,se,s,sw,s,sw,sw,s,se,s,sw,s,sw,nw,nw,s,s,sw,ne,s,s,se,s,s,s,s,s,sw,ne,sw,s,s,s,s,s,s,sw,s,s,s,sw,s,s,s,s,s,s,sw,s,s,sw,s,sw,se,sw,sw,sw,sw,se,nw,s,nw,ne,s,s,s,se,sw,sw,s,ne,s,s,s,s,s,s,se,n,sw,s,sw,sw,s,sw,s,sw,s,s,s,s,s,nw,sw,sw,s,se,sw,se,s,sw,s,ne,s,s,s,s,s,s,ne,sw,nw,s,ne,sw,s,s,s,ne,sw,n,s,n,s,s,sw,s,sw,s,sw,ne,s,sw,s,sw,s,s,s,s,sw,s,s,s,s,s,s,s,s,s,s,s,sw,s,sw,sw,s,sw,sw,s,s,s,se,s,sw,s,sw,n,s,sw,s,s,s,sw,se,s,s,ne,s,s,sw,s,n,nw,n,sw,n,s,s,se,sw,ne,s,s,s,n,s,n,s,ne,s,sw,sw,s,sw,nw,s,sw,s,s,s,sw,s,n,s,s,s,s,s,sw,s,s,s,sw,s,s,s,se,n,s,n,sw,s,s,s,s,ne,se,sw,s,se,ne,ne,s,s,sw,sw,s,s,s,s,n,ne,s,s,s,ne,s,s,s,sw,sw,s,s,sw,sw,s,s,s,sw,sw,s,s,s,sw,s,sw,s,s,s,s,s,nw,s,s,s,s,nw,s,nw,s,s,s,s,s,sw,n,nw,s,s,s,nw,s,n,n,s,sw,s,sw,s,s,se,s,s,ne,nw,n,s,n,s,s,sw,s,s,s,s,s,s,s,s,nw,sw,s,s,s,s,se,se,s,s,s,se,sw,s,s,s,ne,s,s,s,s,n,s,s,se,s,s,s,s,n,s,s,s,s,sw,nw,s,s,n,s,s,s,s,s,s,s,n,sw,s,ne,s,s,s,s,ne,s,ne,s,s,nw,s,s,s,s,se,s,s,s,s,n,s,s,s,s,s,s,s,s,s,s,sw,s,s,s,s,ne,s,sw,sw,sw,s,s,s,s,s,s,s,se,s,s,s,nw,n,s,sw,s,sw,s,s,n,s,ne,s,s,s,s,s,s,n,s,se,s,s,s,s,se,s,se,s,s,s,s,s,s,s,s,s,s,n,nw,s,s,s,s,sw,sw,s,sw,s,n,s,nw,s,s,ne,s,s,nw,s,s,s,s,se,s,s,s,s,s,ne,s,sw,nw,s,s,s,s,s,s,s,s,s,s,se,s,s,s,s,sw,s,s,s,s,s,se,s,s,s,s,se,ne,s,se,s,s,se,s,ne,nw,s,n,s,se,n,s,s,s,s,se,s,s,s,se,se,s,s,s,se,se,s,se,sw,s,s,ne,s,ne,s,s,se,s,s,s,s,s,nw,s,s,s,s,s,s,nw,s,ne,s,s,s,ne,se,s,se,sw,s,s,s,s,n,s,s,sw,s,s,s,s,s,nw,s,ne,s,se,n,se,s,s,ne,s,s,s,s,s,s,se,s,s,s,nw,s,se,s,s,se,s,s,s,se,s,s,ne,se,s,s,s,s,s,ne,s,s,s,se,s,s,s,s,s,s,s,s,sw,ne,s,nw,s,s,se,se,se,se,se,s,se,s,s,s,ne,se,s,s,nw,s,s,s,se,ne,s,ne,n,nw,s,s,sw,s,s,s,se,s,se,s,nw,s,s,s,s,ne,ne,nw,s,s,s,se,s,s,s,se,se,s,s,se,nw,s,s,s,se,n,s,s,s,s,ne,s,s,s,se,s,s,se,s,ne,nw,se,se,s,ne,s,se,s,sw,s,s,s,n,s,s,s,se,se,ne,se,sw,s,se,s,s,s,s,se,nw,s,s,n,s,s,s,s,s,se,s,s,n,s,se,s,s,n,s,ne,sw,s,ne,se,nw,se,s,s,n,se,s,nw,se,se,s,ne,s,se,s,se,s,s,sw,s,se,sw,s,s,se,s,n,se,s,s,s,se,sw,s,s,s,nw,se,se,s,sw,se,se,s,se,s,nw,nw,s,se,se,s,s,s,s,n,s,s,se,s,sw,s,n,s,s,nw,se,s,s,s,s,se,s,s,s,s,s,s,ne,n,n,s,s,n,s,nw,s,se,s,s,se,se,se,sw,s,s,s,s,s,s,s,s,s,se,se,s,nw,se,nw,nw,se,sw,s,s,s,s,se,s,s,se,s,s,s,n,sw,n,s,nw,s,se,se,se,s,s,se,se,s,nw,se,se,s,se,se,s,se,se,s,nw,se,s,nw,se,s,s,s,nw,se,se,nw,ne,sw,s,se,se,se,s,ne,s,se,se,s,s,s,se,se,s,se,s,s,s,se,se,se,n,se,s,se,se,se,n,se,se,s,se,ne,s,s,sw,s,se,se,sw,s,s,n,s,s,se,ne,se,se,se,s,se,s,se,se,se,sw,s,s,s,s,se,s,s,nw,s,s,se,se,se,ne,sw,s,s,s,se,nw,s,se,s,se,s,s,se,s,se,s,se,se,se,ne,se,s,se,se,s,sw,se,se,se,s,s,nw,s,se,s,se,se,s,s,se,n,se,se,s,s,se,s,s,ne,se,se,s,s,s,se,s,s,se,sw,s,s,se,se,se,n,se,s,n,s,nw,s,s,s,s,ne,s,s,s,se,se,se,s,nw,s,s,se,s,nw,s,s,se,se,s,s,s,s,s,n,s,s,s,s,se,s,se,sw,s,s,se,s,se,s,s,s,sw,s,se,se,se,s,se,s,se,se,n,sw,sw,se,s,s,s,se,s,se,se,s,s,s,ne,se,se,se,nw,se,s,s,se,se,ne,se,s,se,s,s,sw,s,se,se,sw,se,se,s,se,nw,s,se,n,s,s,se,nw,s,s,s,s,s,se,se,ne,s,se,n,se,s,se,se,s,se,se,se,ne,s,se,se,ne,s,sw,se,se,s,ne,s,s,nw,ne,se,se,s,se,se,se,se,se,s,nw,n,s,s,s,se,s,s,s,s,s,sw,nw,nw,nw,se,s,s,se,sw,se,s,s,se,se,s,s,se,se,nw,ne,se,se,se,se,se,se,se,ne,s,ne,se,s,s,se,se,s,se,s,se,sw,se,se,s,se,ne,nw,n,se,se,se,s,ne,se,s,s,se,se,s,se,sw,s,se,se,sw,se,s,ne,se,se,s,s,s,s,s,n,s,s,ne,se,se,s,se,sw,sw,se,se,se,se,s,s,s,se,s,se,se,s,n,nw,s,s,s,s,s,se,se,n,se,s,s,s,s,se,s,se,se,se,se,s,s,sw,se,se,s,s,ne,se,n,n,se,ne,se,s,se,n,se,s,s,se,s,se,s,se,s,se,s,se,se,s,s,nw,s,s,se,nw,s,se,se,se,ne,s,s,sw,nw,se,se,sw,sw,se,se,se,ne,nw,se,se,se,se,sw,s,se,se,se,s,se,n,s,se,se,s,s,s,n,se,s,se,se,sw,sw,se,se,se,se,s,s,se,sw,s,nw,n,se,se,se,se,nw,s,n,se,sw,se,n,s,se,se,s,se,s,se,se,s,s,se,se,se,se,s,se,se,s,n,se,se,se,se,nw,s,nw,n,se,s,s,s,se,se,se,s,se,se,s,s,s,se,se,se,se,ne,s,s,se,se,s,se,n,se,nw,se,se,se,se,ne,se,se,nw,se,se,se,s,se,ne,se,n,se,se,se,n,se,s,se,sw,se,se,se,se,se,n,se,se,se,se,s,s,s,sw,se,se,se,s,sw,se,s,se,n,se,se,ne,se,s,se,ne,s,s,n,n,s,se,se,se,s,se,se,se,se,s,se,sw,se,se,s,s,se,se,ne,se,se,nw,se,s,se,s,ne,nw,se,se,se,se,sw,s,s,se,nw,se,s,se,se,se,se,s,ne,se,ne,se,n,ne,se,s,se,se,se,se,se,se,se,se,s,se,se,se,se,se,ne,se,se,s,n,s,s,se,se,se,se,se,se,sw,s,sw,ne,se,s,se,sw,s,se,se,nw,se,se,se,s,se,sw,se,nw,n,n,se,se,se,se,s,se,se,se,nw,se,se,sw,se,sw,se,se,se,se,se,se,n,se,se,se,se,se,se,se,se,s,nw,se,se,se,se,se,se,se,s,se,sw,sw,se,se,s,se,se,se,se,se,se,se,se,s,se,se,se,nw,se,se,se,se,se,se,ne,n,se,se,se,nw,s,sw,se,sw,s,se,se,s,se,se,se,se,se,se,se,s,se,se,se,nw,se,n,se,sw,se,se,se,se,se,se,se,n,se,se,s,nw,n,se,se,se,se,s,se,se,nw,se,s,se,se,se,sw,se,se,s,s,s,se,se,se,nw,s,se,se,s,s,n,se,se,se,n,se,se,sw,n,se,se,s,se,se,se,s,sw,ne,se,se,se,se,se,se,se,se,ne,se,s,ne,n,ne,sw,n,s,nw,sw,se,nw,se,se,se,sw,se,se,se,se,se,se,se,se,n,se,se,se,se,s,se,se,se,ne,se,se,se,se,se,se,s,se,se,se,se,se,se,s,se,nw,s,nw,se,se,se,se,se,se,s,se,se,se,se,nw,se,se,se,sw,se,se,sw,se,se,se,se,se,s,se,se,se,se,se,se,n,se,se,se,se,se,n,se,se,se,se,se,se,se,se,s,se,se,s,sw,s,se,se,se,se,se,se,se,se,se,s,se,se,se,se,nw,se,se,n,se,se,n,se,se,se,se,ne,se,sw,se,nw,se,se,n,se,se,se,se,se,se,s,sw,nw,nw,nw,sw,s,n,nw,n,nw,n,ne,s,ne,n,ne,ne,ne,ne,ne,se,s,ne,ne,ne,ne,sw,se,ne,se,se,se,se,ne,se,s,se,n,se,s,se,se,se,s,s,se,s,s,se,se,s,se,s,sw,s,ne,s,nw,s,n,s,s,se,nw,s,sw,se,s,sw,s,sw,s,ne,s,n,ne,sw,sw,sw,sw,s,s,nw,sw,sw,sw,sw,sw,sw,sw,nw,sw,sw,ne,sw,sw,nw,se,sw,sw,sw,nw,nw,s,sw,sw,nw,nw,sw,sw,se,nw,nw,sw,sw,n,nw,nw,s,nw,nw,sw,sw,nw,nw,se,nw,nw,nw,nw,nw,sw,s,sw,sw,sw,nw,nw,sw,s,nw,nw,nw,s,n,nw,nw,nw,n,nw,nw,nw,n,n,nw,nw,sw,nw,ne,nw,nw,se,nw,nw,ne,n,nw,nw,n,nw,nw,nw,n,n,nw,nw,n,nw,se,nw,n,n,n,ne,n,n,n,n,nw,n,n,s,sw,n,nw,n,n,n,n,sw,n,nw,nw,n,n,n,n,n,nw,n,sw,n,n,n,n,n,n,n,nw,n,n,n,n,n,n,n,ne,n,ne,n,n,ne,ne,ne,n,ne,ne,n,se,n,nw,n,n,n,se,s,n,n,ne,s,n,s,ne,s,n,ne,ne,se,n,ne,ne,ne,s,sw,ne,ne,n,n,n,ne,n,n,n,nw,sw,ne,n,ne,n,ne,nw,ne,sw,ne,ne,ne,ne,ne,n,ne,n,ne,sw,n,ne,ne,ne,ne,s,n,sw,ne,s,ne,s,ne,n,ne,s,ne,ne,n,ne,sw,ne,ne,ne,ne,ne,s,ne,sw,ne,s,s,ne,ne,ne,nw,se,ne,nw,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,se,ne,se,s,ne,ne,s,ne,ne,ne,ne,ne,ne,se,ne,ne,nw,nw,ne,se,ne,sw,ne,ne,ne,n,ne,ne,ne,se,nw,ne,ne,ne,ne,nw,ne,s,se,s,se,se,se,n,sw,nw,se,se,se,sw,n,ne,se,sw,ne,ne,se,ne,ne,s,se,se,ne,se,ne,ne,se,ne,se,nw,se,se,se,ne,ne,s,sw,nw,se,se,se,se,se,se,ne,se,se,se,se,se,se,se,se,se,se,se,sw,nw,s,ne,se,se,se,se,ne,se,se,se,s,se,se,se,n,se,se,se,se,se,n,se,se,se,se,nw,se,se,se,se,sw,se,se,se,se,n,se,se,se,ne,se,se,ne,sw,se,se,se,n,n,se,se,se,se,s,sw,se,se,se,se,s,se,se,se,se,se,s,sw,se,n,se,se,se,s,s,ne,se,ne,nw,n,se,se,n,s,s,s,ne,s,se,se,ne,s,se,se,se,se,s,sw,s,s,se,ne,sw,s,s,se,se,n,se,se,se,se,s,se,s,sw,s,s,se,s,s,se,s,se,s,s,s,s,s,s,se,s,s,s,se,s,se,s,s,se,s,n,nw,ne,se,s,s,nw,se,s,se,s,ne,s,s,ne,s,se,s,s,s,s,n,s,s,s,se,se,sw,se,s,s,n,s,se,se,s,se,s,s,s,s,s,s,se,s,nw,se,ne,s,s,n,se,s,s,s,n,s,ne,ne,s,s,s,s,s,s,nw,s,s,s,n,se,s,s,nw,s,s,s,s,s,s,s,s,s,s,se,n,ne,s,s,se,s,nw,s,s,nw,s,s,s,s,ne,s,s,s,s,s,se,s,s,s,s,s,s,n,sw,s,n,s,s,s,s,nw,se,n,s,s,s,s,ne,ne,s,s,se,s,sw,s,s,s,s,s,sw,s,s,sw,s,s,s,s,s,s,s,s,s,sw,s,s,s,sw,s,s,sw,sw,se,nw,se,s,s,s,s,s,sw,s,s,s,n,s,s,s,n,sw,sw,sw,s,sw,s,s,nw,s,n,s,sw,s,n,s,sw,sw,s,sw,s,s,ne,s,s,s,s,s,s,sw,sw,sw,nw,sw,ne,s,s,s,sw,sw,sw,sw,s,sw,sw,sw,nw,sw,sw,sw,sw,s,sw,s,nw,s,sw,sw,s,s,s,sw,sw,sw,s,s,sw,s,s,s,sw,s,sw,sw,s,sw,s,sw,s,sw,s,sw,s,s,sw,ne,sw,sw,sw,n,nw,s,sw,sw,s,sw,sw,s,sw,sw,s,sw,s,sw,s,sw,sw,s,n,s,s,sw,s,sw,sw,s,s,sw,sw,s,s,nw,sw,sw,n,sw,sw,sw,sw,sw,sw,ne,sw,s,sw,sw,sw,s,nw,s,s,sw,sw,sw,sw,sw,s,sw,sw,sw,sw,n,sw,sw,sw,sw,sw,se,sw,sw,sw,n,sw,sw,nw,sw,sw,sw,ne,s,s,sw,sw,s,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,sw,se,sw,sw,sw,sw,n,sw,sw,ne,sw,sw,sw,sw,sw,sw,sw,sw,se,sw,sw,s,sw,ne,sw,n,sw,n,se,sw,sw,se,ne,sw,sw,sw,sw,sw,s,sw,sw,sw,sw,sw,sw,nw,nw,sw,sw,sw,nw,sw,se,sw,ne,sw,sw,sw,sw,nw,sw,sw,sw,sw,sw,sw,ne,sw,sw,sw,n,ne,sw,se,sw,nw,sw,sw,sw,nw,sw,sw,sw,sw,n,se,sw,sw,sw,nw,sw,sw,ne,sw,sw,sw,sw,n,ne,nw,s,sw,sw,sw,n,se,ne,sw,sw,sw,sw,sw,nw,ne,sw,nw,s,sw,sw,nw,sw,se,ne,sw,ne,nw,sw,sw,sw,sw,nw,sw,sw,sw,sw,nw,sw,s,sw,n,sw,ne,nw,ne,sw,sw,n,sw,sw,sw,nw,sw,sw,sw,sw,ne,nw,sw,sw,sw,sw,sw,sw,sw,nw,nw,sw,nw,sw,se,sw,sw,nw,sw,sw,se,ne,sw,sw,sw,ne,nw,sw,nw,nw,nw,nw,sw,sw,nw,sw,nw,sw,nw,nw,nw,nw,sw,nw,se,sw,sw,n,sw,n,sw,sw,sw,sw,nw,nw,nw,n,nw,nw,nw,nw,nw,nw,sw,sw,sw,nw,sw,n,nw,n,n,sw,sw,nw,ne,nw,sw,nw,nw,sw,sw,se,nw,nw,sw,nw,nw,nw,ne,nw,se,sw,n,nw,s,nw,sw,nw,nw,nw,sw,nw,s,nw,sw,nw,nw,ne,nw,sw,sw,se,nw,sw,s,nw,sw,nw,ne,nw,nw,nw,nw,nw,nw,nw,s,nw,nw,sw,sw,sw,nw,nw,sw,sw,nw,s,nw,sw,nw,nw,nw,nw,sw,nw,se,nw,sw,nw,ne,nw,nw,nw,nw,se,n,se,nw,sw,nw,nw,nw,nw,nw,nw,nw,nw,nw,nw,nw,se,sw,nw,sw,s,nw,se,sw,nw,nw,sw,nw,nw,nw,nw,sw,n,nw,nw,sw,nw,sw,n,sw,ne,n,nw,nw,sw,nw,sw,nw,nw,sw,sw,sw,nw,nw,nw,sw,se,sw,nw,sw,nw,nw,nw,s,sw,nw,nw,sw,nw,nw,nw,sw,sw,nw,nw,nw,nw,n,nw,sw,sw,se,nw,nw,nw,n,nw,nw,nw,nw,s,sw,sw,nw,nw,nw,ne,nw,nw,nw,se,nw,nw,nw,nw,sw,s,nw,nw,nw,nw,nw,nw,n,nw,nw,nw,nw,nw,nw,se,nw,ne,nw,sw,nw,nw,nw,nw,n,nw,nw,nw,nw,nw,nw,nw,nw,nw,nw,sw,se,nw,nw,nw,n,nw,nw,nw,nw,nw,nw,nw,n,n,nw,nw,sw,ne,nw,ne,nw,n,nw,n,n,nw,nw,nw,n,nw,nw,nw,ne,nw,nw,s,nw,nw,nw,s,ne,sw,nw,s,nw,nw,nw,nw,nw,ne,sw,nw,se,nw,s,nw,nw,nw,n,nw,nw,se,nw,s,nw,se,nw,nw,s,nw,nw,nw,s,nw,nw,se,nw,nw,nw,nw,n,ne,nw,ne,sw,nw,se,nw,nw,sw,s,nw,n,ne,n,nw,nw,sw,nw,nw,n,nw,nw,nw,nw,nw,nw,nw,n,nw,nw,nw,n,nw,nw,nw,nw,nw,nw,n,nw,n,n,n,nw,n,nw,nw,nw,n,nw,nw,n,nw,nw,nw,n,n,nw,nw,nw,nw,nw,n,nw,n,n,nw,nw,nw,nw,nw,nw,n,nw,n,nw,nw,nw,n,se,n,n,s,se,n,nw,n,nw,nw,n,n,nw,nw,s,n,ne,n,nw,s,nw,sw,nw,nw,nw,n,nw,se,nw,nw,nw,n,n,n,nw,nw,n,nw,nw,n,nw,n,nw,sw,nw,nw,n,ne,nw,nw,nw,nw,nw,ne,n,n,n,n,n,n,n,nw,n,sw,nw,ne,n,n,nw,nw,nw,nw,n,s,n,ne,n,n,n,nw,n,nw,n,nw,n,se,nw,n,n,n,nw,nw,ne,n,n,se,nw,nw,nw,n,nw,n,nw,n,se,nw,se,n,nw,nw,n,nw,se,nw,n,n,n,n,nw,n,sw,nw,n,nw,n,n,n,n,nw,n,nw,n,se,nw,ne,n,se,n,sw,n,nw,nw,n,nw,s,n,nw,n,nw,n,nw,n,n,nw,n,nw,n,n,n,nw,ne,nw,n,nw,n,nw,nw,s,nw,nw,nw,n,nw,nw,n,nw,n,nw,nw,n,nw,nw,n,ne,n,nw,n,nw,n,n,nw,n,n,nw,nw,n,n,nw,n,nw,n,n,n,nw,n,n,n,n,n,n,n,nw,n,n,n,s,nw,nw,n,n,s,n,n,n,sw,n,nw,nw,n,n,n,s,nw,nw,n,n,sw,nw,ne,ne,sw,n,n,n,sw,n,ne,se,n,n,n,n,ne,nw,n,n,se,n,n,n,sw,nw,s,sw,n,n,n,nw,n,n,n,s,n,n,nw,n,nw,n,n,n,ne,n,nw,n,n,n,n,nw,n,n,ne,s,n,sw,se,n,n,n,ne,nw,sw,nw,n,sw,n,n,n,n,nw,n,n,n,n,nw,nw,n,ne,n,n,ne,n,n,n,nw,sw,n,n,nw,n,n,n,n,n,n,n,n,n,n,n,nw,n,nw,n,n,n,n,n,n,n,n,n,n,nw,n,ne,n,se,n,n,nw,n,sw,se,se,n,n,n,s,n,n,s,n,s,ne,se,n,n,nw,n,n,n,n,n,ne,n,s,n,n,n,ne,s,nw,n,n,n,n,n,n,n,nw,n,n,n,n,n,n,n,n,n,n,ne,n,n,n,s,n,n,n,n,n,n,n,n,s,s,n,n,n,n,n,n,n,ne,n,ne,n,n,n,n,n,n,n,n,s,n,ne,n,n,n,n,n,n,n,n,n,n,n,ne,n,n,n,sw,ne,n,n,sw,n,n,n,n,se,n,n,n,n,n,s,n,n,n,ne,n,nw,ne,n,ne,ne,n,nw,ne,n,n,n,n,n,n,ne,n,se,n,ne,ne,n,n,n,n,n,n,se,n,n,sw,n,n,n,n,ne,n,s,n,n,s,nw,ne,ne,n,n,n,n,n,n,n,n,nw,ne,n,n,sw,n,n,n,n,nw,n,s,n,s,n,n,n,n,s,nw,n,se,n,n,n,nw,sw,n,ne,n,s,ne,ne,ne,ne,n,n,nw,n,n,ne,se,n,n,n,ne,n,n,s,nw,n,n,sw,n,n,n,n,n,n,n,n,n,se,n,n,n,sw,n,n,n,n,ne,n,nw,n,se,n,se,n,se,n,ne,n,n,se,n,n,ne,n,s,n,nw,sw,se,ne,ne,n,n,n,n,ne,n,n,s,n,s,ne,se,n,n,n,n,nw,n,n,n,n,n,n,n,ne,n,n,n,ne,n,n,ne,ne,nw,n,n,s,se,s,n,n,ne,ne,ne,n,n,nw,n,ne,n,ne,se,n,ne,ne,n,ne,sw,n,s,ne,n,sw,n,ne,s,n,ne,nw,n,n,ne,n,n,n,ne,nw,ne,n,nw,n,n,n,n,ne,ne,ne,n,ne,ne,n,n,n,ne,ne,n,nw,ne,n,ne,nw,se,se,n,ne,ne,n,se,n,n,n,n,ne,ne,se,n,ne,nw,n,nw,n,n,ne,n,ne,ne,n,ne,ne,sw,ne,ne,n,n,nw,se,n,ne,n,ne,n,n,n,ne,nw,ne,ne,n,n,ne,n,ne,n,ne,n,n,n,n,ne,n,ne,ne,n,ne,n,sw,n,ne,n,se,nw,ne,nw,ne,ne,n,n,ne,ne,n,n,n,n,n,ne,ne,n,ne,ne,ne,ne,sw,sw,ne,n,se,ne,sw,n,n,ne,n,ne,nw,s,nw,n,n,n,n,ne,ne,ne,s,s,n,n,ne,ne,s,sw,sw,ne,ne,ne,n,ne,n,ne,n,n,n,ne,n,ne,n,ne,ne,ne,n,n,nw,n,ne,ne,n,n,ne,ne,s,n,ne,s,ne,sw,ne,nw,ne,ne,ne,n,ne,ne,nw,ne,ne,n,ne,n,ne,n,n,n,ne,se,ne,n,n,nw,n,n,ne,n,ne,nw,ne,s,n,ne,ne,n,se,nw,ne,ne,ne,ne,ne,n,nw,n,n,n,ne,n,n,ne,ne,n,ne,ne,ne,se,s,nw,ne,s,ne,nw,ne,n,ne,ne,n,ne,n,ne,ne,ne,n,ne,nw,ne,n,n,se,n,ne,ne,se,ne,sw,n,ne,ne,ne,ne,ne,n,ne,ne,n,n,ne,n,sw,ne,ne,nw,ne,n,ne,ne,ne,ne,se,ne,ne,n,se,ne,ne,ne,n,ne,ne,ne,n,ne,nw,sw,n,ne,ne,ne,n,ne,ne,n,n,ne,ne,ne,ne,ne,ne,ne,ne,nw,s,ne,ne,ne,ne,ne,ne,ne,ne,sw,n,nw,ne,ne,ne,s,n,sw,s,ne,ne,ne,ne,ne,ne,ne,ne,ne,sw,s,ne,ne,se,ne,sw,n,ne,ne,ne,sw,n,n,ne,ne,ne,nw,ne,ne,ne,ne,ne,se,ne,n,se,ne,s,ne,ne,ne,n,ne,s,nw,ne,ne,n,nw,ne,sw,ne,ne,ne,ne,ne,ne,se,sw,ne,ne,ne,ne,s,ne,ne,ne,ne,ne,se,ne,n,ne,n,ne,ne,se,ne,se,nw,ne,n,ne,se,sw,se,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,n,ne,se,s,ne,n,ne,ne,sw,ne,nw,ne,ne,sw,ne,ne,ne,ne,se,ne,ne,ne,nw,ne,se,se,ne,ne,nw,s,ne,ne,ne,ne,sw,ne,ne,n,ne,n,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne,ne
"""

// using an 'odd-q' offset coordinate
// https://www.redblobgames.com/grids/hexagons
enum Direction: Int {
  case north = 0
  case northEast
  case southEast
  case south
  case southWest
  case northWest
}

typealias Point = (x: Int, y: Int)
typealias Cube = (x: Int, y: Int, z: Int)

func dx(point: Point, direction: Direction) -> Point {
  let even = point.x&1 == 0
  switch direction {
    case .north: return (0,-1)
    case .northEast: return even ? (1,-1) : (1,0)
    case .southEast: return even ? (1,0) : (1,1)
    case .south: return (0,1)
    case .southWest: return even ? (-1,0) : (-1,1)
    case .northWest: return even ? (-1,-1) : (-1,0)
  }
}

func move(point: Point, direction: Direction) -> Point {
  let delta = dx(point: point, direction: direction)
  return (point.x + delta.x, point.y + delta.y)
}

func offsetCoordToCube(hex: Point) -> Cube {
  let x = hex.x
  let z = hex.y - (hex.x - (hex.x&1)) / 2
  let y = -x-z
  return (x, y, z)
}

func hexDistance(_ a: Point) -> Int {
  let a = offsetCoordToCube(hex: a)
  let b: Cube = (0,0,0)
  let dx = abs(a.x - b.x)
  let dy = abs(a.y - b.y)
  let dz = abs(a.z - b.z)
  return (dx + dy + dz) / 2
}

func calculate(_ input: String) {
  var point = Point(x: 0, y: 0)
  var maxDistance = 0
  let directions: [Direction] = input.split(separator: ",").map { 
    switch $0 {
      case "n": return .north
      case "ne": return .northEast
      case "se": return .southEast
      case "s": return .south
      case "sw": return .southWest
      case "nw": return .northWest
      default: fatalError("\($0) is not a known direction")
    }  
  }  
  for direction in directions {
    point = move(point: point, direction: direction)
    let newDistance = hexDistance(point)
    maxDistance = newDistance > maxDistance ? newDistance : maxDistance
  }
  let distance = hexDistance(point)
  print("Part1: \(distance)")
  print("Part2: \(maxDistance)")
}
calculate(input)


