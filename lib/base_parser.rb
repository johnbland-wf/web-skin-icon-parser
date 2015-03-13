require 'yaml'
require 'json'
require 'open-uri'
require 'github_api'
require "base64"

@output_filename = ARGV.first || "icons.json"

@config = YAML.load_file('config.yml')
@filenames = @config['icons']['filenames']

def parse_icons content
    icons = JSON.parse(content)['icons']

    constants = [];
    icons.each do |icon|
        constants << icon['tags'].first
    end

    constants
end

def save_file icons, output_filename
    json_output = JSON.pretty_generate(icons.sort).gsub("\"", %q('))

    File.open(output_filename, 'w') { |file|
        file.write(json_output)
    }

    puts "\n\n#{icons.length} icons saved to: #{output_filename}\n\n"
end

def load_files
    icons = []

    @filenames.each do |filename|
        icons << read_icons_file(filename)
    end

    icons
end

def save_icon_file
    icons = load_files()

    save_file(icons.flatten.compact, @output_filename) if icons.length
end
