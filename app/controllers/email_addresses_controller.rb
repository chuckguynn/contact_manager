class EmailAddressesController < ApplicationController
  # GET /email_addresses/new
  # GET /email_addresses/new.json
  def new
    @email_address = EmailAddress.new(contact_id: params[:contact_id], contact_type: params[:contact_type])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @email_address }
    end
  end

  # GET /email_addresses/1/edit
  def edit
    @email_address = EmailAddress.find(params[:id])
  end

  # POST /email_addresses
  # POST /email_addresses.json
  def create
    @email_address = EmailAddress.new(params[:email_address])

    respond_to do |format|
      if @email_address.save
        format.html { redirect_to @email_address.contact, notice: 'Email address was successfully created.' }
        format.json { render json: @email_address.contact, status: :created, location: @email_address }
      else
        format.html { render action: "new" }
        format.json { render json: @email_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /email_addresses/1
  # PUT /email_addresses/1.json
  def update
    @email_address = EmailAddress.find(params[:id])

    respond_to do |format|
      if @email_address.update_attributes(params[:email_address])
        format.html { redirect_to @email_address.contact, notice: 'Email address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @email_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_addresses/1
  # DELETE /email_addresses/1.json
  def destroy
    @email_address = EmailAddress.find(params[:id])
    @email_address.destroy

    respond_to do |format|
      format.html { redirect_to @email_address.contact }
      format.json { head :no_content }
    end
  end
end
