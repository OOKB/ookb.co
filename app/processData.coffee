_ = require 'lodash'

module.exports = (data) ->
  data.currentYear = new Date().getFullYear()
  {db} = data
  # Get an array of items that should go in the Work menu.
  unless db
    db = data.db = {}

  data.section = {}
  data.sections = []
  archiveYears = {}
  if db
    # For each key in the database.
    _.each db, (val, key) ->
      if val?.contents # If the value has a contents property
        # Create a contentsIndex.
        contentsIndex = {}
        _.each val.contents, (item, i) ->
          {filename, path, slug} = item
          # Where the key is slug or path or filename.
          contentId = slug or path or filename
          contentsIndex[contentId] = i # Value is the index in the array.
        data.db[key].contentsIndex = contentsIndex
  if db.work?.contents
    {archiveMenu} = db.work
    unless archiveMenu is false
      archiveMenu = true
    data.workIndex = {}
    # Loop through everything in the work folder.
    _.each db.work.contents, (project, i) ->
      {title, filename, section, year, images, shortTitle} = project
      data.workIndex[filename] = i
      # If there is a section defined place it into the section menu.
      if section
        unless data.section[section]
          # Create section menu array.
          data.section[section] = []
          # Add section id to secions array.
          data.sections.push section
        # Add item to section menu.
        data.section[section].push {
          title: title
          shortTitle: shortTitle
          section: section
          link: filename
        }
      # Build archive indexBy years.
      if year and archiveMenu
        unless data.section['archive']
          data.section.archive = []
          data.sections.push 'archive'
        unless archiveYears[year]
          archiveYears[year] = []
          data.section['archive'].push {
            title: year
            section: 'archive'
            link: year
          }
        if images
          _.each images, (img) ->
            archiveYears[year].push _.pick(img, ['id', 'filename', 'rev'])

    if data.section?.archive
      data.section.archive = _.sortByOrder data.section.archive, 'link', false
    data.archiveYears = archiveYears

  return data
