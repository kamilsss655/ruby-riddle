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
        # Default password for the introduction level
        @pass = 'first'
        # Add salt to prevent rainbow table cracking
        @salt = '$10$HuZkq5drrxh9NDFQ7LHQvufYXoGAacAFYcTFvu6VsKq7ic'
        # Encrypted level data
        @levels = [
            ['z8OiA6mWq0LZ+PIzXW1VfTZqtLpYCKYC+m0qR/7yNRI=','mEHk3VcGA89+gb71hmPIxENes4d2kjxtcsNDHkuRya0dk6prbqT207oTgL82kHJwxT1oYnmhAY9GMe0743gcsiVCYX1eFXwSPuXPB2gqB7U='],
            ['9VhkLR30To517OK3hiZpQAmTWNTVQgfmBQVvNrNJuNw=','ZVZZqxsmrg30f9vDXqeBw/AAZ/kgEHCJ+Ot6ikGbdqvUnOwOQ4DwHUytd2hNIBYcd082a25/VnjsG6fvSpLzOw=='],
            ['ZiNPWa/8zLpg8s5aYgBg4nEeUaaSCOoDJQyRO38X4jw=','fWSk1ZWyICLKwQPLM1eqSc8uIq0MU+f8SuuPhVDima9tZHRAs+WoaZ7gRNFXJquG'],
            ['RfhWogfQh1X+AI17hvQWxXy+O4lHddMMrtWxL0FCoXQ=','mbVQ+D/RWEghptY9NTW9YM86QSwj3Lutwfo6l9qxuhuB5ye/uhMGWUGrAv5pv4c3'],
            ['KAEYiyKf8ja4jvvOH96tEEAvHjRTDtzEWmze2glswV0=','7D7SR+t4EwUg/EsV2eLsmTlIcRAVC5s8F1esNPFYA14=']
        ]
        # Initialize main method
        main
    end

    def check(answer)
        current_hash = @levels[@progress][0]
        if create_hash(answer) == current_hash
            text = decrypt(@levels[@progress][1], answer)
            puts '', "Correct! Questions remaining: #{@levels.count-@progress-1}", '' if @progress!=0
            puts '', text , ''
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
        # Loop through levels
        while @progress < @levels.count    
            # Autodecrypt first introductory level
            if @progress == 0
                check(@pass)
            else        
                check(input)
            end
        end
    end

    def input
        puts 'Your answer is:', ''
        return gets.strip
    end

end

Riddle.new

