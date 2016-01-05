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
        # Add salt to prevent rainbow table cracking
        @salt = '$10$HuZkq5drrxh9NDFQ7LHQvufYXoGAacAFYcTFvu6VsKq7ic'
         # Default password for the introduction level
        @pass = 'first'
        # Level data to be encrypted
        @levels = [
            [@pass, "Welcome to the Riddle Challenge, to begin please write 'start' and press ENTER."],
            ['start', 'Here is the first question please answer1 to proceed.'],
            ['answer1', 'Nice, to proceed please write answer4'],
            ['answer4', 'Nice, to proceed please write answer5'],
            ['answer5', 'This is it, you have done it.']
        ]
        # Initialize generate method
        generate
    end

    def generate
        puts 'Here is encrypted Riddle level data:'
        @levels.each do |key, text|
            puts "['#{create_hash(key)}','#{encrypt(text, key)}'],"
        end
    end

    def create_hash(input)
        return Digest::SHA256.base64digest(input+@salt)
    end

    def decrypt(input, key)
        return Encryptor.decrypt(:value => Base64.decode64(input), :algorithm => 'aes-128-cbc', :key => Digest::SHA256.base64digest(key), :salt => @salt)
    end

    def encrypt(input, key)
        return Base64.encode64(Encryptor.encrypt(:value => input, :algorithm => 'aes-128-cbc', :key => Digest::SHA256.base64digest(key), :salt => @salt))
    end

end

Riddle.new