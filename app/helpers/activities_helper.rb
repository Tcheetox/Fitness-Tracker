module ActivitiesHelper
  def add_chevron(dir)
    dir == 'up' ? awesome('fas fa-chevron-up') : awesome('fas fa-chevron-down')
  end

  def compare_performance
    unless !@activity.has_dist || !@previous_activity.has_dist
      raw(
        'You went through ' +
          (
            if (@activity.distance > @previous_activity.distance)
              '<strong>longer</strong>' + add_chevron('up')
            else
              '<strong>shorter</strong>' + add_chevron('down')
            end
          ) + ' distance at a ' +
          (
            if (@activity.pace > @previous_activity.pace)
              '<strong>faster</strong>' + add_chevron('up')
            else
              '<strong>slower</strong>' + add_chevron('down')
            end
          ) + ' speed'
      )
    end
  end

  def compare_rating
    if @activity.rating > @previous_activity.rating
      raw('Better <strong>feeling</strong>') + add_chevron('up')
    else
      raw('Worse <strong>feeling</strong>') + add_chevron('down')
    end
  end

  def compare_duration
    if @activity.duration > @previous_activity.duration
      raw('<strong>Longer</strong> workout') + add_chevron('up')
    else
      raw('<strong>Shorter</strong> workout') + add_chevron('down')
    end
  end

  def print_pace
    if @activity.pace != 0
      number_with_precision(@activity.pace, precision: 3)
    else
      'N/A'
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction =
      column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title,
            {
              sort: column,
              direction: direction,
              since: request.params['since'],
              by: request.params['by']
            },
            { class: css_class } #link_to title, { sort: column, direction: direction }, data: { turbolinks: false }, class: css_class
  end

  # Random quote provider
  def random_quote
    json = JSON.load File.open 'app/assets/quotes.json'
    r = rand(json.count)
    json[r]['author'].blank? ? "\"#{json[r]['text']}\"" : "\"#{json[r]['text']}\" - #{json[r]['author']}"
  end
end
