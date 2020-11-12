module ActivitiesHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction =
      column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, { sort: column, direction: direction }, { class: css_class }
  end

  def random_quote
    @quotes = JSON.load File.open 'app/assets/quotes.json'
    if @quotes.blank?
      ''
    else
      quote = @quotes[rand(@quotes.count)]
      "\"#{quote['text']}\" - #{quote['author']}"
    end
  end
end
