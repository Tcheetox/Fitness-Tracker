class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token
  include ApplicationHelper

  def index
    if valid_user(sender_number)
      respond(message_answer)
    else
      respond(
        'Hello dear user! Please sign in to Move&Groove and complete your profile before using our remote services.'
      )
    end
  end

  def message_answer
    s_message = params['Body'].downcase.split(' ')
    if s_message.first.include? 'add'
      r = add_handler(s_message)
    elsif s_message.first.include? 'list'
      r = list_handler(s_message)
    elsif s_message.first.include? 'help'
      r = help_handler(s_message)
    else
      r =
        "Unrecognized syntax. Type 'help' to see the list of available commands."
    end
  end

  def list_handler(args)
    if args.count == 1 && args[0] == 'list'
      acti = @remote_user.activities.order('date desc').limit(10)
      r =
        if acti.count == 0
          "You don't have any activities"
        else
          "Previous activities: #{
            acti.map do |sa|
              "\n - #{sa.rating.humanize} #{sa.duration} min #{sa.name} on #{
                sa.date.strftime('%Y-%m-%d')
              }"
            end.join
          }"
        end
    elsif args.count == 2 && args[0] == 'list' &&
          Activity.names.keys.include?(args[1])
      acti =
        @remote_user.activities.where(name: args[1]).order('date desc').limit(
          10
        )
      r =
        if acti.count == 0
          "You don't have any #{args[1]} activities"
        else
          "Previous #{args[1]} activities: #{
            acti.map do |sa|
              "\n - #{sa.rating.humanize} #{sa.duration} min on #{
                sa.date.strftime('%Y-%m-%d')
              }"
            end.join
          }"
        end
    else
      r =
        if args[0] == 'list'
          "Input error: '#{
            args[1]
          }' is not a valid activity. \nType 'help options' to see the list of activities."
        else
          "Input error, list previous activities using: \n  list (or list 'activity') \nExample: \n  list football"
        end
    end
    return r
  end

  def add_handler(args)
    p_args = analyze_options(args)
    if p_args.values[1] &&
         (3..4).include?(p_args.select { |k, v| v == true }.count)
      r = try_add(args)
    else
      if !(4..5).include?(args.count) || args[0] != 'add'
        r =
          "Input error, add an activity with this syntax: \n  add 'feeling' 'activity' 'minutes' 'km' \n Example: \n  add excellent running 50 11.20"
      elsif !p_args.values[0]
        r = "Input error: '#{p_args.keys[0]}' is not a valid activity feeling."
        r += "\nType 'help options' to see the list of possible values."
      elsif !p_args.values[1]
        r = "Input error: '#{p_args.keys[1]}' is not a valid activity."
        r += "\nType 'help options' to see the list of activities."
      elsif !p_args.values[2]
        r = "Input error: '#{args[3]}' is not a valid duration."
        r += "\nDuration must expressed in minutes, as whole number."
      else
        r = "Input error: '#{args[4]}' is not a valid distance."
        r +=
          "\nDistance must expressed in kilometers, as number with optional decimal."
      end
    end
    return r
  end

  def try_add(args)
    @remote_user.activities.create(
      name: args[2],
      date: DateTime.now,
      duration: args[3].to_i,
      rating: args[1],
      distance: Activity.dist(args[2]) ? args[4].to_f : nil
    )
    'Keep up the good work buddy!'
  rescue Exception
    'We are sorry but an error occured, please try again later.'
  end

  def analyze_options(args)
    {
      args[1] => Activity.ratings.keys.include?(args[1]),
      args[2] => Activity.names.keys.include?(args[2]),
      'duration' => is_numeric(args[3]),
      'distance' => is_numeric(args[4])
    }
  end

  def help_handler(args)
    if args[1].to_s.include? 'option'
      r = 'List of activities:'
      r += Activity.names.keys.map { |a| "\n - #{a.humanize}" }.join
      r += "\n Possible feeling:"
      r += Activity.ratings.keys.map { |ra| "\n - #{ra.humanize}" }.join
    else
      r = 'List of commands:'
      r +=
        [
          'help',
          'help options',
          "add 'feeling' 'activity' 'duration' 'distance'",
          'list',
          "list 'activity'"
        ].map { |e| "\n - #{e.humanize}" }.join
    end
    return r
  end

  def respond(response_body)
    unless response_body.blank?
      response =
        Twilio::TwiML::MessagingResponse.new do |r|
          r.message body: response_body
        end
      render xml: response.to_s
    end
  end

  def sender_number
    params['From'] ? params['From'].to_s.downcase.sub('whatsapp:', '') : nil
  end

  def valid_user(from)
    @remote_user = User.find_by(phone: from)
    return @remote_user.nil? ? false : true
  end
end
