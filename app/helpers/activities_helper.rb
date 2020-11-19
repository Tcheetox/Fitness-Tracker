module ActivitiesHelper
  def add_chevron(dir)
    if dir == 'up'
      awesome('fas fa-chevron-up')
    else
      dir == 'down' ? awesome('fas fa-chevron-down') : awesome('fas fa-equals')
    end
  end

  def compare_performance
    unless !@activity.has_dist || !@previous_activity.has_dist
      raw(
        'You went through <strong>' +
          (
            if (@activity.distance > @previous_activity.distance)
              'longer' + add_chevron('up')
            elsif (@activity.distance < @previous_activity.distance)
              'shorter' + add_chevron('down')
            else
              'the same' + add_chevron('equal')
            end
          ) + '</strong>distance at a <strong>' +
          (
            if (@activity.pace > @previous_activity.pace)
              'faster' + add_chevron('up')
            elsif (@activity.pace < @previous_activity.pace)
              'slower' + add_chevron('down')
            else
              'similar' + add_chevron('equal')
            end
          ) + '</strong>speed'
      )
    end
  end

  def compare_rating
    if @activity.rating > @previous_activity.rating
      raw('Better <strong>feeling</strong>') + add_chevron('up')
    elsif @activity.rating < @previous_activity.rating
      raw('Worse <strong>feeling</strong>') + add_chevron('down')
    else
      raw('Same <strong>feeling</strong>') + add_chevron('equal')
    end
  end

  def compare_duration
    if @activity.duration > @previous_activity.duration
      raw('<strong>Longer</strong> time workout') + add_chevron('up')
    elsif @activity.duration < @previous_activity.duration
      raw('<strong>Shorter</strong> time workout') + add_chevron('down')
    else
      raw('<strong>Same</strong> time workout') + add_chevron('equal')
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
    if json[r]['author'].blank?
      "\"#{json[r]['text']}\""
    else
      "\"#{json[r]['text']}\" - #{json[r]['author']}"
    end
  end
end
