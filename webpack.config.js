
var path              = require( 'path' );
var webpack           = require( 'webpack' );
var merge             = require( 'webpack-merge' );
var HtmlWebpackPlugin = require( 'html-webpack-plugin' );
var autoprefixer      = require( 'autoprefixer' );
var ExtractTextPlugin = require( 'extract-text-webpack-plugin' );
var WebpackNotifierPlugin = require('webpack-notifier');
var CleanWebpackPlugin = require('clean-webpack-plugin');
var CopyWebpackPlugin = require('copy-webpack-plugin');

// detemine build env
var TARGET_ENV = process.env.npm_lifecycle_event === 'build' ? 'production' : 'development';
// common webpack config
var commonConfig = {
  target: 'web',

  output: {
    path:       path.resolve( __dirname, 'dist/' ),
    filename: 'bundle.[hash].js',
  },

  resolve: {
    modulesDirectories: ['node_modules'],
    extensions:         ['', '.js', '.elm']
  },

  plugins: [
    new CleanWebpackPlugin(['dist']  ),
    new WebpackNotifierPlugin({
      title: 'Webpack'
    }),
    new HtmlWebpackPlugin({
      template: 'src/index.html',
      inject:   'body',
      filename: 'index.html'
    }),
    new ExtractTextPlugin('main.css'),
    new CopyWebpackPlugin([
      { from: 'src/images', to: '/images/'}
    ], {
      copyUnmodified: true
    })
  ],

  postcss: [ autoprefixer( { browsers: ['last 2 versions'] } ) ],

  module: {
    loaders: [
      { test: /bootstrap\/js\//, loader: 'imports?jQuery=jquery' }
    ]
  }

}

// additional webpack settings for local env (when invoked by 'npm start')
if ( TARGET_ENV === 'development' ) {
  module.exports = merge( commonConfig, {

    entry: [
      'webpack-dev-server/client?http://localhost:8080',
      path.join( __dirname, 'src/index.js' )
    ],

    devServer: {
      inline:   true,
      progress: true
    },
    module: {
      loaders: [
        { test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "url-loader?limit=10000&mimetype=application/font-woff" },
        { test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: "file-loader" },
        {
          test: /\.png$|\.jpg$|\.gif$/,
          loader: 'url?limit=2049'
        },
        {
          test:    /Main\.elm$/,
          exclude: [/elm-stuff/, /node_modules/, /Stylesheets\.elm/],
          loader:  'elm-hot!elm-webpack?verbose=true&warn=true'
        },
        {
          test: /\.scss$/,
          exclude: [/\.css$/],
          loader: ExtractTextPlugin.extract('style','css?sourceMap','postcss','sass?sourceMap')
        },
        {
          test: /\.css$/,
          loader: ExtractTextPlugin.extract('style','css?sourceMap','postcss')
        }
      ]
    },

  });
}

// additional webpack settings for prod env (when invoked via 'npm run build')
if ( TARGET_ENV === 'production' ) {
  console.log( 'Building for prod...');

  module.exports = merge( commonConfig, {

    entry: path.join( __dirname, 'src/index.js' ),

    plugins: [
      new webpack.optimize.OccurenceOrderPlugin(),

      // extract CSS into a separate file
      new ExtractTextPlugin( './bundle.[hash].css', { allChunks: true } ),

      // minify & mangle JS/CSS
      new webpack.optimize.UglifyJsPlugin({
          minimize:   true,
          compressor: { warnings: false },
          mangle:  true
      })
    ]

  });
}
