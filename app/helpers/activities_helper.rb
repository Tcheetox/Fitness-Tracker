module ActivitiesHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction =
      column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, { sort: column, direction: direction }, { class: css_class } #link_to title, { sort: column, direction: direction }, data: { turbolinks: false }, class: css_class
  end

  # Random quote provider
  def random_quote
    json = JSON.load File.open 'app/assets/quotes.json'
    r = rand(json.count)
    "\"#{json[r]['text']}\" - #{json[r]['author']}"
  end
end
