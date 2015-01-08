React = require 'react'

Event = require './event'

module.exports = React.createClass
  render: ->
    {events, noEvents} = @props.data

    if events and events.length
      Events = for item, i in events
        {id} = item
        <Event key={id} item={item} />
    else
      Events = <li className="no-events">{noEvents}</li>

    <section id="events">
      <h3>Upcoming</h3>
      <ul className="events">
        {Events}
      </ul>
    </section>
