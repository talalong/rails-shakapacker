// See the shakacode/shakapacker README and docs directory for advice on customizing your webpackConfig.
const { generateWebpackConfig, merge } = require('shakapacker')

const webpackConfig = generateWebpackConfig()

const sassConfig = require('./rules/sass')
const yamlConfig = require('./rules/yaml')
const extensionsConfig = require('./rules/extensions')

/*console.log('--------->')
console.log(webpackConfig.module.rules)
console.log('<---------')
sss
process.exit(1)*/
module.exports = merge(sassConfig, yamlConfig, webpackConfig)
