	class QuestionsController < ApplicationController
			# http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	  # before_action :set_question, only: [:show, :edit, :update, :destroy]
	  before_action :authenticate_user!, except: [:index, :show]

	  def index
	    @questions = Question.all
	  end

	  def show
	    @question = Question.find(params[:id])
	  end

	  def new
	  	@question = Question.new
	  end

	  def create
	    @question = Question.new(question_params)

	    if @question.save
	      redirect_to @question
	    else
	      render 'new'
	    end
	  end

	  def update
	    @question = Question.find(params[:id])

	    if @question.update(question_params)
	      redirect_to @question
	    else
	      render 'edit'
	    end
	  end

	  def edit
	    @question = Question.find(params[:id])
	  end

	  def destroy
	    @question = Question.find(params[:id])
	    @question.destroy

	    redirect_to questions_path
	  end

	  private
	    def question_params
	      params.require(:question).permit(:text, :difficulty, :correct_answer, 
	      	:wrong_answer_1,:wrong_answer_2, :wrong_answer_3)
	    end
	end
