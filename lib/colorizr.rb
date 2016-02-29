class String
    @colors_scheme = {
            :red => 31,
            :green => 32,
            :yellow => 33,
            :blue => 34,
            :pink => 95,
            :light_blue => 94,
            :white => 97,
            :light_grey => 37,
            :black => 30,
        }

    def self.create_colors
        @colors_scheme.each do |key,value|
            self.send(:define_method, key) do
                 "\033[#{value}m#{self}\033[0m"
             end
        end
    end

    create_colors

    def self.color
        @colors_scheme.keys
    end

    def self.sample_colors
        @colors_scheme.keys.each do |color|
            puts "This is " + "#{color}".send("#{color.to_s}")
        end
    end

end
