<!DOCTYPE html>
<html lang="en">
<head>
<body>
<h2>Poker hands</h2>
<div class="problem_content" role="problem">
<p>In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:</p>
<ul><li><b>High Card</b>: Highest value card.</li>
<li><b>One Pair</b>: Two cards of the same value.</li>
<li><b>Two Pairs</b>: Two different pairs.</li>
<li><b>Three of a Kind</b>: Three cards of the same value.</li>
<li><b>Straight</b>: All cards are consecutive values.</li>
<li><b>Flush</b>: All cards of the same suit.</li>
<li><b>Full House</b>: Three of a kind and a pair.</li>
<li><b>Four of a Kind</b>: Four cards of the same value.</li>
<li><b>Straight Flush</b>: All cards are consecutive values of same suit.</li>
<li><b>Royal Flush</b>: Ten, Jack, Queen, King, Ace, in same suit.</li>
</ul><p>The cards are valued in the order:<br />2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.</p>
<p>If two players have the same ranked hands then the rank made up of the highest value wins; for example, a pair of eights beats a pair of fives (see example 1 below). But if two ranks tie, for example, both players have a pair of queens, then highest cards in each hand are compared (see example 4 below); if the highest cards tie then the next highest cards are compared, and so on.</p>
<p>Consider the following five hands dealt to two players:</p>
<div style="text-align:center;">
<table><tr><td><b>Hand</b></td><td> </td><td><b>Player 1</b></td><td> </td><td><b>Player 2</b></td><td> </td><td><b>Winner</b></td>
</tr><tr><td style="vertical-align:top;"><b>1</b></td><td> </td><td>5H 5C 6S 7S KD<br /><div class="note">Pair of Fives</div></td><td> </td><td>2C 3S 8S 8D TD<br /><div class="note">Pair of Eights</div></td><td> </td><td style="vertical-align:top;">Player 2</td>
</tr><tr><td style="vertical-align:top;"><b>2</b></td><td> </td><td>5D 8C 9S JS AC<br /><div class="note">Highest card Ace</div></td><td> </td><td>2C 5C 7D 8S QH<br /><div class="note">Highest card Queen</div></td><td> </td><td style="vertical-align:top;">Player 1</td>
</tr><tr><td style="vertical-align:top;"><b>3</b></td><td> </td><td>2D 9C AS AH AC<br /><div class="note">Three Aces</div></td><td> </td><td>3D 6D 7D TD QD<br /><div class="note">Flush  with Diamonds</div></td><td> </td><td style="vertical-align:top;">Player 2</td>
</tr><tr><td style="vertical-align:top;"><b>4</b></td><td> </td><td>4D 6S 9H QH QC<br /><div class="note">Pair of Queens<br />Highest card Nine</div></td><td> </td><td>3D 6D 7H QD QS<br /><div class="note">Pair of Queens<br />Highest card Seven</div></td><td> </td><td style="vertical-align:top;">Player 1</td>
</tr><tr><td style="vertical-align:top;"><b>5</b></td><td> </td><td>2H 2D 4C 4D 4S<br /><div class="note">Full House<br />With Three Fours</div></td><td> </td><td>3C 3D 3S 9S 9D<br /><div class="note">Full House<br />with Three Threes</div></td><td> </td><td style="vertical-align:top;">Player 1</td>
</tr></table></div>
<p>The file, <a href="https://github.com/funwithcthulhu/project_euler/blob/master/ruby/054_poker_hands/p054_poker.txt">p054_poker.txt</a>, contains one-thousand random hands dealt to two players. Each line of the file contains ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no specific order, and in each hand there is a clear winner.</p>
<p>How many hands does Player 1 win?</p>
</div><br />
</body>
</html>


How many hands does Player 1 win?

ANSWER: player 1 wins: 376

For this problem, I created card and poker hand 'objects'. I used regular 5 card poker rules
as a guideline to create a scoring system, and scored each two poker hands on each line
against each other, keeping tally of the scores.

Usage: ruby 054_poker_hands.rb p054_poker.txt
