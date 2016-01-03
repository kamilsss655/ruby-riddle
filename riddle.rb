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
        # Encrypted level data
        @levels = [
            ['ZiNPWa/8zLpg8s5aYgBg4nEeUaaSCOoDJQyRO38X4jw=', 'aaaaaaaaaaaaaaa0x'],
            ['UsqLlg6JTR0MyKK/EWFZXycfbbDB9hg3BucwovIFRZQ=', 'aaaaaaaaaaaaaaa1x'],
            ['UsqLlg6JTR0MyKK/EWFZXycfbbDB9hg3BucwovIFRZQ=', 'aaaaaaaaaaaaaaa3x'],
            ['UsqLlg6JTR0MyKK/EWFZXycfbbDB9hg3BucwovIFRZQ=', 'aaaaaaaaaaaaaaa4x'],
            ['UsqLlg6JTR0MyKK/EWFZXycfbbDB9hg3BucwovIFRZQ=', 'aaaaaaaaaaaaaaa5x']
        ]
            # ['answer1', 'aaaaaaaaaaaaaaa0x'],
            # ['answer2', 'aaaaaaaaaaaaaaa1x'],
            # ['answer2', 'aaaaaaaaaaaaaaa3x'],
            # ['answer2', 'aaaaaaaaaaaaaaa4x'],
            # ['answer2', 'aaaaaaaaaaaaaaa5x']
        # Initialize main method
        main
    end

    def check(answer)
        current_hash = @levels[@progress][0]
        if create_hash(answer) == current_hash
            @progress+=1
            puts '', 'Correct anwswer! Moving on to challenge number '+@progress.to_s, ''
        else
            puts '', 'Sorry, this answer is not correct. Please try again', '' 
        end
        # hash = Base64.encode64(Encryptor.encrypt(:value => hash, :key => @salt))
        # encypted_text = @levels[@progress][1]
        # puts hash
    end

    def create_hash(input)
        return Digest::SHA256.base64digest(input+@salt)
    end

    def decrypt(input)

    end

    def main
        welcome
        while @progress < @levels.count
            check(input)
        end
    end

    def welcome
        puts 'Welcome to the Riddle Challenge.'
        puts 'You will be presented with a series of riddles, to begin type answer1 and press Enter.', ''
    end

    def input
        puts 'Your answer is:', ''
        return gets.strip
    end

end

Riddle.new

