React = require 'react'

module.exports = React.createClass
  render: ->

    {title, tagline} = @props.data
    yr = new Date().getFullYear()
    msg = "copyright #{yr} — #{title} — #{tagline}"

    <footer>
      <p>{msg}</p>
      <div className="credits">
        <p>Site by <a href="http://www.ookb.co/">OOKB</a> / Powered by <a href="http://www.cape.io/">CAPE</a></p>
      </div>
    </footer>
