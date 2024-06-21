module.exports = {
    module: {
        rules: [
            {
                test: /\.sass$/,
                use: [
                    'css-loader',
                    'resolve-url-loader',
                    {
                        loader: 'sass-loader',
                        options: {
                            sassOptions: {indentedSyntax: false}
                        }
                    }
                ]
            }
        ]
    },
    resolve: {
        extensions: ['.sass']
    }
}

/*
{
    test: /\.sass$/,
        //test: /\.s[ac]ss$/i,
        //test: /\.s([ca])ss$/,
        use
:
    [
        'vue-style-loader',
        'css-loader',
        'resolve-url-loader',
        {
            loader: 'sass-loader',
            options: {
                sassOptions: {indentedSyntax: true}
            }
        }
    ]
}*/
