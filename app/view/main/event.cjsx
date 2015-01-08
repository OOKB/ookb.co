React = require 'react'

module.exports = React.createClass
  # Get link for the user!
  sendToTicket: ->
    FB.api "/326251754240776?fields=ticket_uri", (response) ->
      if response.ticket_uri
        window.location.href = response.ticket_uri

  handleTicket: (e) ->
    if e and e.preventDefault
      e.preventDefault()
    FB.getLoginStatus (response) =>
      {status} = response
      if status is "connected"
        @sendToTicket()
      else if e isnt false
        FB.login =>
          @handleTicket false
      else
        console.log 'User did not approve app!'
        #alert('A link to the tickets can be found on the facebook event page.')
        window.location.href = "https://www.facebook.com/#{@props.item.id}"

  render: ->
    {name, startTime, weekDay, month, day, year, endTime, location, id, cover, description, venue, ticket_uri} = @props.item
    time = "#{startTime} - #{endTime}"
    fbLink = "https://www.facebook.com/#{id}"
    venueLink = "https://www.facebook.com/#{venue.id}"
    <li className="event group">
      <div className="date two columns">
        <ul>
          <li>{weekDay}</li>
          <li>{month}</li>
          <li>{day}</li>
          <li>{year}</li>
          <li>{time}</li>
        </ul>
      </div>
      <div className="image five columns">
        <a href={fbLink}>
          <img src={cover.source} alt={name} />
        </a>
        <div className="tickets"><a onClick={@handleTicket} href={ticket_uri}>Get Tickets!</a></div>
      </div>
      <div className="info five columns">
        <h2>
          <a href={fbLink}>{name}</a>
        </h2>
        <div className="location">
          <span>Location:</span> <a href={venueLink}>{location}</a>
        </div>
        <p>{description} </p>
      </div>
    </li>
