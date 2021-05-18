const { environment } = require('@rails/webpacker')

const webpack = require("webpack") // added for bootstrap
environment.plugins.append("Provide", new webpack.ProvidePlugin({
         $: 'jquery',
         jQuery: 'jquery',
         Popper: ['popper.js', 'default']
})) // added for bootstrap

module.exports = environment
