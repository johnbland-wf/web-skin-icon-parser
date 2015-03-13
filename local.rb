require './lib/base_parser.rb'

@containing_folder = @config["local"]["containing_folder"];
@containing_folder = File.expand_path(@containing_folder, File.dirname(__FILE__))

def read_icons_file filename
    contents = File.open("#{@containing_folder}/#{filename}.json", 'r').read

    parse_icons contents
end

save_icon_file
