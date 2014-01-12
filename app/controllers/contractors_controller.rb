class ContractorsController < ApplicationController
  before_action :set_contractor, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:show, :index]

  
  def index
    @contractors = Contractor.all
  end


  def show
  end


  def new
    @contractor = current_user.contractors.build
  end


  def edit
  end

  def create
    @contractor = current_user.contractors.build(contractor_params)

    respond_to do |format|
      if @contractor.save
        format.html { redirect_to @contractor, notice: 'Contractor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contractor }
      else
        format.html { render action: 'new' }
        format.json { render json: @contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contractors/1
  # PATCH/PUT /contractors/1.json
  def update
    respond_to do |format|
      if @contractor.update(contractor_params)
        format.html { redirect_to @contractor, notice: 'Contractor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contractor.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @contractor.destroy
    respond_to do |format|
      format.html { redirect_to contractors_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contractor
      @contractor = Contractor.find(params[:id])
    end

    def correct_user
      @contractor = current_user.contractors.find_by(id: params[:id])
      redirect_to contractors_path, notice: "You are not authorized to edit this contractor entry" if @contractor.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contractor_params
      params.require(:contractor).permit(:name, :address)
    end
end
