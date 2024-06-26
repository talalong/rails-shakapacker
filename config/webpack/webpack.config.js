// See the shakacode/shakapacker README and docs directory for advice on customizing your webpackConfig.
const {generateWebpackConfig, merge} = require('shakapacker')

const path = require('path');

const customConfig = {
    resolve: {
        alias: {
            '@actions': path.resolve(__dirname, '../../app/javascript/src/actions'),
        },
        extensions: ['.css', '.js', '.scss'],
    }
};

const webpackConfig = generateWebpackConfig(customConfig)

const yamlConfig = require('./rules/yaml')
const jqueryPlugin = require('./plugins/jquery')

module.exports = merge(webpackConfig, yamlConfig, jqueryPlugin, {
    resolve: {
        extensions: ['.scss']
    }
})
