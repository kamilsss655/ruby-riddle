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
            ['ZiNPWa/8zLpg8s5aYgBg4nEeUaaSCOoDJQyRO38X4jw=','jKx/k+OIXoNmJm/5+Ln3E1fkciyMSKz0rq8SCGHGfpteAxN7jiU2gvqZSL4S6gM0'],
            ['UsqLlg6JTR0MyKK/EWFZXycfbbDB9hg3BucwovIFRZQ=','HOh7Bb/VjpByDXbGT9uUo8DUvi7pokStHE5TTXh/TFVzAhNoKErJjwJv4Zwm65OW'],
            ['g3MA5mzLcFclNvy2i9ZjHYOWFbJcmKOvTzqwUtHnqaw=','VFwa6CqAe9+ccwjKkoSaHxQw+1Jx59GPkmI6Eo3ZmLTIUPt6g9VQQfnzz29i46rb'],
            ['RfhWogfQh1X+AI17hvQWxXy+O4lHddMMrtWxL0FCoXQ=','mbVQ+D/RWEghptY9NTW9YM86QSwj3Lutwfo6l9qxuhvcbgwaImFeldKNaFJWQmFo'],
            ['RfhWogfQh1X+AI17hvQWxXy+O4lHddMMrtWxL0FCoXQ=','mbVQ+D/RWEghptY9NTW9YM86QSwj3Lutwfo6l9qxuhsWfHwJC/OiToZIflR+EmlX']
        ]
        # Initialize main method
        main
    end

    def check(answer)
        current_hash = @levels[@progress][0]
        if create_hash(answer) == current_hash
            puts '', decrypt(@levels[@progress][1], answer) , ''
            @progress+=1       
        else
            puts '', 'Sorry, this answer is not correct. Please try again', '' 
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

