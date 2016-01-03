#########################
# -- Simple riddle --   #
# Author: Kamil Cyrkler #
# Date: 3rd Jan 2016    #
#########################

require 'digest'
require 'encryptor'
require 'base64'

class Riddle

    def initialize
        # Declare initial level progress
        @progress = 0
        # Add salt to prevent rainbow table cracking
        @salt = '$10$HuZkq5drrxh9NDFQ7LHQvufYXoGAacAFYcTFvu6VsKq7ic'
        # Increase hashing algorithm cost, to increase processing time
        # BCrypt::Engine.cost = 10
        # Encrypted level data
        @levels = [
            ['$2a$10$hmKgdGHrYRgBnYM/skx0r./RS0CkIB3zIziI26hxycVnTn3qBUMxK', 'aaaaaaaaaaaaaaa0x'],
            ['$2a$10$sWeranT0rcBzTAUK6vbcm.wJ4cN0beES2q7dw6yWphtKwT852LOvi', 'aaaaaaaaaaaaaaa1x'],
            ['$2a$10$wRLxOnTdIX07p8HW58rHs.DornNncmLLrgdtvkGIlEE6zWtYBZUe6', 'aaaaaaaaaaaaaaa3x'],
            ['$2a$10$9..DMUs5UbDlOCpcShX2HuyYjSg5j3pWZgCh.T9Br8y3hntUghw6S', 'aaaaaaaaaaaaaaa4x'],
            ['$2a$10$qY3T1Zq/ER9YXpX9fx05lejMv.1c.01YTBD0YnsTlufn.AdSDs7pa', 'aaaaaaaaaaaaaaa5x']
        ]
            # ['answer1', 'aaaaaaaaaaaaaaa0x'],
            # ['answer2', 'aaaaaaaaaaaaaaa1x'],
            # ['answer3', 'aaaaaaaaaaaaaaa3x'],
            # ['answer4', 'aaaaaaaaaaaaaaa4x'],
            # ['answer5', 'aaaaaaaaaaaaaaa5x']
        # Initialize main method
        main
    end


    def create_hash(input)
        return Digest::SHA256.base64digest(input)
    end

    def decrypt(input)

    end

    def main
        welcome
        while @progress < @levels.count
            puts create_hash(input)
        end
    end

    def welcome
        puts 'Welcome to the Riddle Challenge.'
        puts 'You will be presented with a series of riddles, to begin type answer1 and press Enter.'
    end

    def input
        puts 'Your answer is:'
        return gets.strip
    end

end

Riddle.new