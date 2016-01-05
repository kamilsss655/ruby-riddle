# ruby-riddle
Simple Riddle Challenge framework written in Ruby

This let's you create challenges for use in IT recruitment, Hackathons and other programming challenges. 

This Ruby script sets up series of questions (challenges) that are encrypted with the key that is the answer to the previous question (first introduction challenge is autodecrypted). This means that user can only progress in solving the challenge by knowing the answers to the questions - or crack answer hash (which is not so easy).

Requirements:
* Ruby 2.2.3 (or newer)

Set-up:
```
gem install bundler
bundle
```

Run riddle:
```
ruby riddle.rb
```

This comes with a encrypted riddle data generator (gen.rb), to use it please modify the @levels array with challenge descriptions and answers and run:
```
ruby gen.rb
```