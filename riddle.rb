class Riddle

    def initialize()
        @progress = 0
        @levels = [
            ['asdadsadaa0x', 'aaaaaaaaaaaaaaa0x'],
            ['asdadsadaa1x', 'aaaaaaaaaaaaaaa1x'],
            ['asdadsadaa2x', 'aaaaaaaaaaaaaaa3x'],
            ['asdadsadaa4x', 'aaaaaaaaaaaaaaa4x'],
            ['asdadsadaa5x', 'aaaaaaaaaaaaaaa5x']
        ]
        main()
    end

    def check(answer)
        hash = @levels[@progress][0]
        encypted_text = @levels[@progress][1]
        return hash+encypted_text
    end

    def main()
        while @progress < @levels.count
            get_input()
            @progress+=1
        end
    end

    def get_input()
        puts 'Hello, welcome to the Riddle!'
        @input = gets.strip
        puts @input
        puts check(2)
    end

Riddle.new()
end
