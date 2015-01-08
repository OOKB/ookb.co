React = require 'react'

module.exports = React.createClass
  render: ->

    {mission} = @props.data

    <section id="mission">
      <img src="assets/logo.png" />
      <div className="group">
        <p className="eight columns offset-by-two">{mission}</p>
      </div>
    </section>
