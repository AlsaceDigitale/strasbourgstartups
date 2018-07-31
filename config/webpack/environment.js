const { environment } = require('@rails/webpacker')

environment.loaders.get('sass').use.find(item => item.loader === 'sass-loader').options.includePaths = ['node_modules']

const customConfig = require('./custom')

environment.config.merge(customConfig)

module.exports = environment
