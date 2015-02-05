require 'yaml'
require 'json'
require 'open-uri'
require 'github_api'
require "base64"

output_filename = ARGV.first || "icons.json"

config = YAML.load_file('config.yml')

@github = Github.new(oauth_token: config["github"]["token"])

files = ['doctype-24', 'doctype', 'main-24', 'main', 'custom', 'custom-color']

def parse_icons file
    contents = @github.repos.contents.get 'workiva', 'web-skin', "static/_data/constants/icons/#{file}.json"
    contents = Base64.decode64(contents['content'])
    icons = JSON.parse(contents)['icons']

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

icons = []

files.each do |file|
    icons << parse_icons(file)
end

save_file(icons.flatten.compact, output_filename) if icons.length
