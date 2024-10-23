class QuizzsController < ApplicationController
  before_action :set_quizz, only: %i[ show edit update destroy ]

  # GET /quizzs or /quizzs.json
  def index
    @quizzs = Quizz.all
  end

  # GET /quizzs/1 or /quizzs/1.json
  def show
  end

  # GET /quizzs/new
  def new
    @quizz = Quizz.new
    @quizz.questions.build
  end

  # GET /quizzs/1/edit
  def edit
  end

  # POST /quizzs or /quizzs.json
  def create
    @quizz = Quizz.new(quizz_params)

    respond_to do |format|
      if @quizz.save
        format.html { redirect_to @quizz, notice: "Quizz was successfully created." }
        format.json { render :show, status: :created, location: @quizz }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quizz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzs/1 or /quizzs/1.json
  def update
    respond_to do |format|
      if @quizz.update(quizz_params)
        format.html { redirect_to quizz_url(@quizz), notice: "Quizz was successfully updated." }
        format.json { render :show, status: :ok, location: @quizz }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quizz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzs/1 or /quizzs/1.json
  def destroy
    @quizz.destroy!

    respond_to do |format|
      format.html { redirect_to quizzs_path, status: :see_other, notice: "Quizz was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quizz
      @quizz = Quizz.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quizz_params
      params.require(:quizz).permit(:title,
      questions_attributes: [:id, :_destroy, :content, :answer1, :answer2, :answer3, :answer4, :correct_answer, :image])
    rescue ActionController::ParameterMissing
      {}  # Return an empty hash if parameters are missing
    end
end
