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

*Config Options*

```
github:
    token: some_token_here
    containing_folder: docs/_data/constants/icons
local:
    containing_folder: ~/path/to/web-skin/docs/_data/constants/icons
icons:
    filenames: [doctype-24, doctype, main-24, main, custom, custom-color]

```

Use a [GitHub API Key](https://github.com/settings/applications) in the new `config.yml` in place of `some_token_here`.

Replace `~/path/to/web-skin` with a valid path, relative or absolute, on your system.

#### Local Path Usage

```
$ ruby local.rb

290 icons saved to: icons.json
```

#### GitHub Usage

```
$ ruby github.rb

290 icons saved to: icons.json
```

The GitHub API is used to pull the icons::filenames from the `config.yml`.

#### Change Output File
```
$ ruby github.rb myfile.json
$ ruby local.rb myfile.json
```

You should see `290 icons saved to: myfile.json` as your output; note, `290` may change in the future.
