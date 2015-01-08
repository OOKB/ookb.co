React = require 'react'

Hero = require './hero'
Mission = require './mission'
Events = require './events'
Members = require './members'
Contact = require './contact'

module.exports = React.createClass
  render: ->

    {data} = @props

    <main>
      <Mission data={data} />
      <Events data={data} />
      <Members data={data} />
      <Contact data={data} />
    </main>
