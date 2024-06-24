// See the shakacode/shakapacker README and docs directory for advice on customizing your webpackConfig.
const { generateWebpackConfig, merge } = require('shakapacker')

const webpackConfig = generateWebpackConfig()

const yamlConfig = require('./rules/yaml')
const sassConfig = require('./rules/sass')
const extensionsConfig = require('./rules/extensions')
const foundationConfig = require('./rules/foundation')
/*console.log('--------->')
console.log(webpackConfig.module.rules)
console.log('<---------')
sss
process.exit(1)*/
module.exports = merge(yamlConfig, foundationConfig, sassConfig, webpackConfig)
