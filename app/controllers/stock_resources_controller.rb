class StockResourcesController < ApplicationController
  # GET /stock_resources
  # GET /stock_resources.json
  def index
    @stock_resources = StockResource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stock_resources }
    end
  end

  # GET /stock_resources/1
  # GET /stock_resources/1.json
  def show
    @stock_resource = StockResource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stock_resource }
    end
  end

  # GET /stock_resources/new
  # GET /stock_resources/new.json
  def new
   # @stock_resource = StockResource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stock_resource }
    end
  end

  # GET /stock_resources/1/edit
  def edit
   # @stock_resource = StockResource.find(params[:id])
  end

  # POST /stock_resources
  # POST /stock_resources.json
  def create
    stock_values = Ystock.get_stock(params[:stock_resource][:stock])
     @stock_resource = StockResource.new(:symbol => (stock_values[:symbol]), :price => (stock_values[:price]), :change => (stock_values[:change]), :volume => (stock_values[:volume]))

    respond_to do |format|
      if @stock_resource.save
        format.html { redirect_to @stock_resource, notice: 'Stock resource was successfully created.' }
        format.json { render json: @stock_resource, status: :created, location: @stock_resource }
      else
        format.html { render action: "new" }
        format.json { render json: @stock_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stock_resources/1
  # PUT /stock_resources/1.json
  def update
    @stock_resource = StockResource.find(params[:id])

    respond_to do |format|
      if @stock_resource.update_attributes(params[:stock_resource])
        format.html { redirect_to @stock_resource, notice: 'Stock resource was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @stock_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_resources/1
  # DELETE /stock_resources/1.json
  def destroy
    @stock_resource = StockResource.find(params[:id])
    @stock_resource.destroy

    respond_to do |format|
      format.html { redirect_to stock_resources_url }
      format.json { head :ok }
    end
  end
end
