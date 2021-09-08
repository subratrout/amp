class SurveysController < ApplicationController
  before_action :set_survey, only: %i[ show edit update destroy ]

  def index
    @surveys = Survey.all
  end

  def show
  end

  def new
    @survey = Survey.new
  end

  def edit
  end

  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      flash[:notice] = "Survey was successfully created."
      redirect_to surveys_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @survey.update(survey_params)
        flash[:notice] = "Survey was successfully updated."
        redirect_to surveys_path
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @survey.destroy
    flash[:notice] = "Survey was successfully removed." 
    redirect_to surveys_path
  end

  private
    def set_survey
      @survey = Survey.find(params[:id])
    end

    def survey_params
      params.require(:survey).permit(:name, :description)
    end
end
