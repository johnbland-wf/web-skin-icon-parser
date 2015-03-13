require './lib/base_parser.rb'

@github = Github.new(oauth_token: @config["github"]["token"])

@containing_folder = @config["github"]["containing_folder"];

def read_icons_file filename
    contents = @github.repos.contents.get 'workiva', 'web-skin', "#{@containing_folder}/#{filename}.json"
    contents = Base64.decode64(contents['content'])

    parse_icons contents
end

save_icon_file
