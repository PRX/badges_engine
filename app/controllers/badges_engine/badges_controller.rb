module BadgesEngine
  class BadgesController < ApplicationController
    # GET /badges
    # GET /badges.json
    def index
      @badges = Badge.all
  
      respond_to do |format|
        format.html # index.html.haml
        format.json { render json: @badges }
      end
    end
  
    # GET /badges/1
    # GET /badges/1.json
    def show
      @badge = Badge.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.haml
        format.json { render json: @badge }
      end
    end
  
    # GET /badges/new
    # GET /badges/new.json
    def new
      @badge = Badge.new
  
      respond_to do |format|
        format.html # new.html.haml
        format.json { render json: @badge }
      end
    end
  
    # GET /badges/1/edit
    def edit
      @badge = Badge.find(params[:id])
    end
  
    # POST /badges
    # POST /badges.json
    def create
      @badge = Badge.new(params[:badge])
  
      respond_to do |format|
        if @badge.save
          format.html { redirect_to @badge, notice: 'Badge was successfully created.' }
          format.json { render json: @badge, status: :created, location: @badge }
        else
          format.html { render action: "new" }
          format.json { render json: @badge.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /badges/1
    # PUT /badges/1.json
    def update
      @badge = Badge.find(params[:id])
  
      respond_to do |format|
        if @badge.update_attributes(params[:badge])
          format.html { redirect_to @badge, notice: 'Badge was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @badge.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /badges/1
    # DELETE /badges/1.json
    def destroy
      @badge = Badge.find(params[:id])
      @badge.destroy
  
      respond_to do |format|
        format.html { redirect_to badges_url }
        format.json { head :ok }
      end
    end
  end
end
