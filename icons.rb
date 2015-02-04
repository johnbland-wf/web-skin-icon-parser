require 'json'
require 'open-uri'

url = ARGV.first
output_filename = ARGV[1] || "icons.json"

def parse_file url, output_filename
    file = open(url).read
    icons = JSON.parse(file)['icons']

    constants = [];
    icons.each do |icon|
        constants << icon['tags'].first
    end

    json_output = JSON.pretty_generate(constants.sort).gsub("\"", %q('))

    File.open(output_filename, 'w') { |file|
        file.write(json_output)
    }

    puts "JSON saved to: #{output_filename}"
end

if url.include?('https://raw.githubusercontent.com/Workiva/web-skin/master/static/_data/constants/icons/main.json')
    parse_file url, output_filename
else
    puts "Invalid URL: #{url}"
end
