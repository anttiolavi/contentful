autoprefixer = require 'autoprefixer'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
contentful   = require 'roots-contentful'
records      = require 'roots-records'
marked       = require 'marked'
moment       = require 'moment'

contentful_config = require './contentful.config'

module.exports =  
  locals:
    markdown: (e) -> marked(e)
    dateFromat: (e) -> moment(e).format('DD.MM.YYYY')

  ignores: [
    'readme.md'
    '**/_*'
    '.gitignore'
    'ship.*conf'
    '*.json'
    '*'
  ]

  extensions: [
    records(
      site: { file: "site.config.json" }
    )
    js_pipeline(files: 'assets/js/*.js')
    css_pipeline(files: 'assets/css/*.scss', postcss:true)
    contentful(contentful_config)
  ]

  scss:
    includePaths: [
      './assets/css/'
      './node_modules/'
    ]
    outputStyle: 'nested'
    sourceMap: true
    sourceMapEmbed: true
    sourceMapContents: true

  postcss:
    use: [ autoprefixer() ]
    map: true

  jade:
    pretty: true
