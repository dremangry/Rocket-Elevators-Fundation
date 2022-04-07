class TestingButtonsController < ApplicationController
  before_action :set_testing_button, only: %i[ show edit update destroy ]

  # GET /testing_buttons or /testing_buttons.json
  def index
    @testing_buttons = TestingButton.all
  end

  # GET /testing_buttons/1 or /testing_buttons/1.json
  def show
  end

  # GET /testing_buttons/new
  def new
    @testing_button = TestingButton.new
  end

  # GET /testing_buttons/1/edit
  def edit
  end

  # POST /testing_buttons or /testing_buttons.json
  def create
    @testing_button = TestingButton.new(testing_button_params)

    respond_to do |format|
      if @testing_button.save
        format.html { redirect_to testing_button_url(@testing_button), notice: "Testing button was successfully created." }
        format.json { render :show, status: :created, location: @testing_button }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @testing_button.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testing_buttons/1 or /testing_buttons/1.json
  def update
    respond_to do |format|
      if @testing_button.update(testing_button_params)
        format.html { redirect_to testing_button_url(@testing_button), notice: "Testing button was successfully updated." }
        format.json { render :show, status: :ok, location: @testing_button }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @testing_button.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testing_buttons/1 or /testing_buttons/1.json
  def destroy
    @testing_button.destroy

    respond_to do |format|
      format.html { redirect_to testing_buttons_url, notice: "Testing button was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testing_button
      @testing_button = TestingButton.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def testing_button_params
      params.fetch(:testing_button, {})
    end
end
