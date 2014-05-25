class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy, :add_answer, :make_survey,:result]
  before_filter :authenticate_user!, :except => [:destroy, :make_survey, :make_survey_save]

  # GET /surveys
  # GET /surveys.json
  def index
    if current_user.is_admin
      @surveys = Survey.all
    else
      redirect_to my_surveys_surveys_url
    end
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    @categories = Category.all
  end

  def add_answer
    if @survey.answers && @survey.answers.count > 0
      @answers = @survey.answers
    else
      @answers = @survey.answers.build
    end
  end

  # GET /surveys/1/edit
  def edit
    @categories = Category.all
    # @answers = @survey.answers.build
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)
    # @survey.answers.build(params[:answers_attributes])

    respond_to do |format|
      if @survey.save
        format.html { redirect_to add_answer_survey_path(@survey) }
        format.json { render action: 'show', status: :created, location: @survey }
      else
        format.html { render action: 'new' }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        if params[:another_answer]
          Answer.create(:survey_id => @survey.id,:content => "Other", :is_other => true)
        end
        if params[:add_answers_action] && params[:add_answers_action] == 'add_answers'
          format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        else
          format.html { redirect_to add_answer_survey_path(@survey) }
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url }
      format.json { head :no_content }
    end
  end

  def my_surveys
    @surveys = current_user.surveys

    # @q = current_user.surveys.order("created_at DESC").search(params[:q])
    # @surveys = @q.result
  end

  def make_survey
  end

  def make_survey_save
    survey_id       = params[:survey_id]
    answer_choice   = params[:user_answer_choice]
    answer_email    = params[:answer_email]
    other_answer    = params[:other_answer]
    other_answer_id = params[:other_answer_id]
    results         = Array.new

    resutl_num  = Result.where(:survey_id => survey_id, :answer_email => answer_email).count
    if resutl_num > 0 
      survey = Survey.find(survey_id)
      redirect_to make_survey_survey_path(survey), notice: 'This email have pushed survey. Please push survey with another email.'
    else
      arr_answer = answer_choice.split(",")
      arr_answer.each do |answer_id|
        results << {
                      :survey_id    => survey_id,
                      :answer_id    => answer_id,
                      :answer_email => answer_email
                    }
      end
      if other_answer.strip.length > 0
        results << {
                      :survey_id    => survey_id,
                      :answer_id    => other_answer_id,
                      :answer_email => answer_email,
                      :another_content => other_answer
                    }
      end
      Result.create(results)
      redirect_to root_path, notice: 'Survey was successfully created.' 
    end
  end

  def check_survey_email
    survey_id   = params[:survey_id]
    user_email  = params[:user_email]
    existing    = false
    resutl_num  = Result.where(:survey_id => survey_id, :answer_email => user_email).count
    if resutl_num > 0
      existing = true
    end
    render :json => {:success => true, :data => existing}
  end

  def result
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:question, :user_id,:category_id, :answer_type, answers_attributes: [:id, :survey_id, :content] )
    end
end
