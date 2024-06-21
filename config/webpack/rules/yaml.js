module.exports = {
    module: {
        rules: [
            {
                test: /\.ya?ml$/,
                use: ['yaml-js-loader']
            }
        ]
    },
    resolve: {
        extensions: ['.yml', '.yaml']
    }
}