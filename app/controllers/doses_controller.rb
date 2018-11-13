class DosesController < ApplicationController
  def create
    @dose = Dose.new(strong_params)
    @dose[:cocktail_id] = params[:cocktail_id]
    @cocktail = Cocktail.find(params[:cocktail_id])
    return redirect_to @cocktail if @dose.save
    redirect_to @cocktail
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete
    @cocktail = Cocktail.find(params[:cocktail_id])
    redirect_to @cocktail
  end

  private

  def strong_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
