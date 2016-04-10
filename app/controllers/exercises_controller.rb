class ExercisesController < ApplicationController
  def toggle
    @exercise = Exercise.find_by(id: params[:id])
    ap @exercise
    @exercise.toggle!(:done)
    redirect_to root_path
  end
end
