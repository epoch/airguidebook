class SuburbFactsController  < ApplicationController
  def new
    @suburb_fact = SuburbFact.new
  end

  def create
    @suburb_fact = SuburbFact.create params[:suburb_fact]
    @suburb_fact.house_id = @authenticated.houses.first.id
    @suburb_fact.save
    redirect_to new_restaurant_path
  end

  def edit
    @suburb_fact = SuburbFact.find params[:id]
  end

  def update
    @suburb_fact = SuburbFact.find params[:id]
    @suburb_fact.update_attributes params[:suburb_fact]
    @suburb_fact.save
    redirect_to edit_restaurant_path(@authenticated.houses.first.restaurants.first.id)
  end
end