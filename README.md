# ruby-riddle
Simple Riddle Challenge framework written in Ruby

This let's you create challenges for use in IT recruitment, Hackathons and other programming challenges. 

This Ruby script sets up series of questions (challenges) that are encrypted with the key that is the answer to the previous question (first introduction challenge is autodecrypted). This means that user can only progress in solving the challenge by knowing the answers to the questions - or crack answer hash (which is not so easy).

##Idea
* You generate encrypted dataset (answer, question) for the challenge using gen.rb.
* Then you modify @levels array in riddle.rb
* You share riddle.rb and Gemfile with the person who is challenged by you.

##Requirements:
* Ruby 2.2.3 (or newer)

##Set-up:
```
gem install bundler
bundle
```

##Run riddle:
```
ruby riddle.rb
```
##Generator
This comes with a encrypted riddle data generator (gen.rb), to use it please modify the @levels array with challenge descriptions and answers and run:
```
ruby gen.rb
```

##Example output
```
ruby riddle.rb 

Welcome to the Riddle Challenge, to begin please write 'start' and press ENTER.

Your answer is:

sd

Sorry, this answer is not correct. Please try again

Your answer is:

start

Correct! Questions remaining: 3


Here is the first question please answer1 to proceed.

Your answer is:

answer1

Correct! Questions remaining: 2


Nice, to proceed please write answer4

Your answer is:

answer4

Correct! Questions remaining: 1


Nice, to proceed please write answer5

Your answer is:

asdijkaisd

Sorry, this answer is not correct. Please try again

Your answer is:

answer5

Correct! Questions remaining: 0


This is it, you have done it.

```
