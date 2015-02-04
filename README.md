Web Skin Icon File Parser
===

The [Web Skin icons file](https://github.com/Workiva/web-skin/blob/master/static/_data/constants/icons/main.json) is a JSON file with the data necessary to generate the Web Skin React [`glyphs` constant](https://github.com/Workiva/web-skin-react/blob/master/src/constants.js#L44) ordered ascending.

#### Prerequisites

A couple gems are required. Make sure you have installed Bundler (`gem install bundler`) then run:
```
$ bundle
```


#### Usage

- With url and output file

```
ruby icons.rb url/to/icons/file output.json

```

- With default output file (icons.json)

```
ruby icons.rb url/to/icons/file

```
