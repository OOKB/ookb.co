React = require 'react'
{Route, DefaultRoute} = require 'react-router'

Index = require './view/index'
Page = require './view/page'

module.exports =

  <Route name="app" path="/" handler={Index}>
    <DefaultRoute handler={Page}/>
    <Route name="work" path="work/:pageId" handler={Page} />
    <Route name="archive" path="archive/:pageId" handler={Page} />
    <Route name="page" path=":pageId/?:contentId?" handler={Page} />
  </Route>
