module BadgesEngine
  class AssertionsController < ApplicationController

    def bake_callback
      @assertion = Assertion.find(params[:id])
      respond_to do |format|
        if @assertion && @assertion.token == params[:token]
          format.html { render action: 'show' }
          format.json { render json: @assertion.open_badges_as_json }
        else
          format.html {render text: 'Cannot access badge assertion.',  status: :unauthorized}
          format.json {
            error = {status: 'failure', error: 'unauthorized', reason: 'Cannot access badge assertion.'}
            render json: error, status: :unauthorized
          }
        end
      end
    end
    
    # GET /assertions
    # GET /assertions.json
    def index
      @assertions = Assertion.all
  
      respond_to do |format|
        format.html # index.html.haml
        format.json { render json: @assertions }
      end
    end

    # GET /assertions/1
    # GET /assertions/1.json
    def show
      @assertion = Assertion.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.haml
        format.json { render json: @assertion }
      end
    end
  
    # GET /assertions/new
    # GET /assertions/new.json
    def new
      @assertion = Assertion.new
  
      respond_to do |format|
        format.html # new.html.haml
        format.json { render json: @assertion }
      end
    end
  
    # GET /assertions/1/edit
    def edit
      @assertion = Assertion.find(params[:id])
    end
  
    # POST /assertions
    # POST /assertions.json
    def create
      @assertion = Assertion.new(params[:assertion])
  
      respond_to do |format|
        if @assertion.save
          format.html { redirect_to @assertion, notice: 'Assertion was successfully created.' }
          format.json { render json: @assertion, status: :created, location: @assertion }
        else
          format.html { render action: "new" }
          format.json { render json: @assertion.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /assertions/1
    # PUT /assertions/1.json
    def update
      @assertion = Assertion.find(params[:id])
  
      respond_to do |format|
        if @assertion.update_attributes(params[:assertion])
          format.html { redirect_to @assertion, notice: 'Assertion was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @assertion.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /assertions/1
    # DELETE /assertions/1.json
    def destroy
      @assertion = Assertion.find(params[:id])
      @assertion.destroy
  
      respond_to do |format|
        format.html { redirect_to assertions_url }
        format.json { head :ok }
      end
    end
  end
end
