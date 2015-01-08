React = require 'react'
_ = require 'queries'

data = require './data'

Index = require './view/index'

App = (vars) ->
  React.createElement Index, {data: data, vars: vars}

if typeof window isnt "undefined"
  statusChangeCallback = (response) ->
    console.log "statusChangeCallback"
    {status} = response
    console.log status
    if status is "connected"
      # Logged into your app and Facebook.
      testAPI()
    else if status is "not_authorized"
      # The person is logged into Facebook, but not your app.
    else # unkown
      # The person is not logged into Facebook, so we're not sure if
      # they are logged into this app or not.
    return
  testAPI = ->
    console.log "Welcome!  Fetching your information.... "
    FB.api "/326251754240776?fields=ticket_uri", (response) ->
      console.log response
      return

    return
  window.fbAsyncInit = ->
    FB.init
      appId: "383887075125414"
      cookie: true # enable cookies to allow the server to access the session?
      version: "v2.1" # use version 2.1
    FB.getLoginStatus statusChangeCallback
    return

  window.onload = -> # Attach event handlers.
    # Attach app to global window var as app.
    window.app =
      db: data # Our database.
    React.render App(), document

module.exports = App
