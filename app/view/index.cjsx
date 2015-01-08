React = require 'react'

Head = require './head/head'
Main = require './main/main'
Foot = require './foot/foot'

module.exports = React.createClass
  render: ->
    {title, tagline} = @props.data
    pgTitle = title + ' | ' + tagline

    <html>
      <head>
        <title>{pgTitle}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="assets/app.css" />
      </head>
      <body>
        <div id="wrapper" className="container">
          <Head data={@props.data} />
          <Main data={@props.data} />
          <Foot data={@props.data} />
        </div>
        <div id="fb-root"></div>
        <script src="/assets/app.js" type="text/javascript" />
        <script id="facebook-jssdk" src="//connect.facebook.net/en_US/sdk.js" type="text/javascript" />
      </body>
    </html>
