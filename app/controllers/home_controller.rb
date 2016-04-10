class HomeController < ApplicationController
  def index
    monday = DateTime.now.monday
    #monday = 7.days.from_now.to_date
    @week = [monday]
    6.times do |n|
      monday = monday.next
      @week << monday
    end
    ap @week
    @exercises = {}
    User.all.each do |user|
      @exercises[user] = {}
      @week.each do |wday|
        @exercises[user][wday] = Exercise.find_or_create_by(user: user, date: wday.to_date)
      end
    end
  end
end
