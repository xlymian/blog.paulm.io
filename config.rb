###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml',  layout: false
page '/*.json', layout: false
page '/*.txt',  layout: false

# Disable directory_index for 404 page
page '/404.html', directory_index: false

###
# Helpers and extensions
###

helpers do
  # Builds a page title from the article title + site title
  def page_title
    if current_article && current_article.title
      current_article.title + ' | ' + config[:site_title]
    else
      config[:site_title]
    end
  end
  # Renders component partials
  def component(path, locals={})
    partial "components/#{path}", locals
  end
end

activate :blog do |blog|
  blog.permalink = '{title}'
  # Matcher for blog source files
  blog.sources = 'articles/{year}-{month}-{day}-{title}.html'
  blog.layout = 'article'
  blog.default_extension = '.md'
end

# Markdown and syntax highlighting
activate :syntax
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true

# Use commit time from git for sitemap.xml and feed.xml
activate :vcs_time

###
# Site settings
###
set :site_url, 'https://blog.paulm.io/'
set :site_title, "I'm Paul Mylchreest"
set :site_subtitle, "Programmer, cyclist, floorball player"
set :profile_text, %q(Todo.)
set :site_author, 'Paul Mylchreest'
# Generate your own by running `rake id`
set :site_id, 'uri:uuid:3131181d-2c7d-45dd-a77c-af19f387d999'

# Usernames
set :github_username, 'xlymian'
set :keybase_username, 'xlymian'
set :twitter_username, 'xlymian'
set :linkedin_username, 'xlymian'
set :lastfm_username, nil
set :spotify_username, nil

# Replace 'nil' with your Disqus shortname, eg. 'example'
set :disqus_shortname, nil
# Replace 'nil' with your Google Analytics key, eg. 'XX-XXXXXXXX-X'
set :google_analytics, nil

###
# Environment settings
###
# Development-specific configuration
configure :development do
  # Reload the browser automatically whenever files change
  # activate :livereload
end

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html

  # Improve cacheability by using asset hashes in filenames
  activate :asset_hash
end
