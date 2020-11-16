module ActivitiesHelper

  def add_chevron(dir)
    dir == "up" ? awesome("fas fa-chevron-up") : awesome("fas fa-chevron-down")
  end

  def compare_performance(previousActivity)
    unless @activity.distance.blank? || previousActivity.distance.blank?
      raw("You went through " + ((@activity.distance > previousActivity.distance)? "<strong>longer</strong>" + add_chevron("up"): "<strong>shorter</strong>" + add_chevron("down")) + " distance at a " +
      (pace > pace(previousActivity)? "<strong>faster</strong>" + add_chevron("up"): "<strong>slower</strong>" + add_chevron("down")) + " speed")
    end
  end

  def compare_rating(previousActivity)
    (@activity.rating > previousActivity.rating) ? raw("Better <strong>feeling</strong>") + add_chevron("up") : raw("Worse <strong>feeling</strong>") + add_chevron("down")
  end

  def compare_duration(previousActivity)
    (@activity.duration > previousActivity.duration) ? raw("<strong>Longer</strong> workout") + add_chevron("up") : raw("<strong>Shorter</strong> workout") + add_chevron("down")
  end

  def pace(param_activity = nil)
    activity = param_activity.nil? ? @activity : param_activity
    activity.distance.blank? ? "N/A" : number_with_precision(@activity.distance / @activity.duration, :precision => 3)
  end

  def pace_from_params(dist, dur)
    if dist.blank? || dur.blank?
      0
    else
      number_with_precision(dist / dur, :precision => 3)
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
    "\"#{json[r]['text']}\" - #{json[r]['author']}"
  end
end
