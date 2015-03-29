React = require 'react'
{Link} = require 'react-router'
_ = require 'lodash'

module.exports = React.createClass
  contextTypes: {
    router: React.PropTypes.func.isRequired
  }
  getInitialState: ->
    isMounted: false

  componentDidMount: ->
    @setState
      isMounted: true

  render: ->
    {items} = @props
    {isMounted} = @state
    {i} = @context.router.getCurrentQuery()
    i = parseInt(i)
    maxIndex = items.length - 1

    ItemEl = (item, index) =>
      {id, filename, rev, title, date, slug, path} = item
      unless title
        return false
      key = key or rev or id or i
      currentPath = @context.router.getCurrentPathname()
      url = currentPath + '/' + (slug or path or filename)
      Title =
        <Link to={url} role="button">
          {title}
        </Link>
      <li key={key}>
        {if date then <span>{date}</span>}
        {if date then " » "}
        {Title}
      </li>

    <ul className="title-list">
      { _.map items, ItemEl }
    </ul>
