const { environment } = require('@rails/webpacker')

environment.loaders.get('sass').use.find(item => item.loader === 'sass-loader').options.includePaths = ['node_modules']

const customConfig = require('./custom')

environment.config.merge(customConfig)

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
  })
)

module.exports = environment
