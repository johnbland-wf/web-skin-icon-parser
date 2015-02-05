Web Skin Icon File Parser
===

The [Web Skin icon files](https://github.com/Workiva/web-skin/blob/master/static/_data/constants/icons/) is a JSON file with the data necessary to generate the Web Skin React [`glyphs` constant](https://github.com/Workiva/web-skin-react/blob/master/src/constants.js#L44) ordered ascending.

#### Prerequisites

The Bundler gem is required. If you do not have it, run the following:
```
$ gem install bundler
```

#### Configuration
```
$ bundle
$ mv config.example.yml config.yml
```

Replace `some_token_here` with a [GitHub API Key](https://github.com/settings/applications) in the new `config.yml`.

#### Usage

```
$ ruby generate_icons.rb

269 icons saved to: icons.json
```

The GitHub API is used to pull the following icon files:
- doctype-24
- doctype
- main-24
- main
- custom
- custom-color

##### Change output file
```
$ ruby generate_icons.rb myfile.json
```

You should see `269 icons saved to: myfile.json` as your output; note, `269` may change in the future.
