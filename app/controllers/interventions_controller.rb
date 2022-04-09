class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]

  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end

  # GET /interventions/1 or /interventions/1.json
  def show
  end
# 
  # GET /interventions/new
  # get all database info ****************************************************
  def new
    @intervention = Intervention.new
    @customer = Customer.all
    @building = Building.all
    @battery = Battery.all
    @column = Column.all
    @elevator = Elevator.all
    @employee = Employee.all
    @author = current_user.first_name
  end

  def intervention_params
    params.require(:interventions).permit(:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :report)
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)

     # before_create do
    #       
    # end

    # (author: @current_user, customerID: customerID, buildingID: buildingID, batteryID: batteryID, columnID: columnID, elevatorID: elevatorID, employeeID: employeeID, start_date_and_time_of_the_intervention: start_date_and_time_of_the_intervention, end_date_and_time_of_the_intervention: end_date_and_time_of_the_intervention, result: result, report: report, status: status)
    # intervention_params

    respond_to do |format|
      if @intervention.save
        format.html { redirect_to intervention_url(@intervention), notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    puts "create intervention function works ---------------------------------------------"
    @intervention = Intervention.new(intervention_params)


    my_uri = "https://#{ENV['FRESHDESK_DOMAIN']}.freshdesk.com/api/v2/tickets"
    my_key = ENV['FRESHDESK_API_KEY']

    respond_to do |format|
      if @intervention.save
        

        # attachment_exists = @lead.attached_file_stored_as_binary.attached?
        # user_is_customer = Customer.where(email_of_the_company_contact: "#{@lead.email}").present? || Customer.where(technical_manager_email_for_service: "#{@lead.email}").present?
        # site = RestClient::Resource.new(my_uri, my_key, 'X')
        # client = RestClient::Resource.new

        # if attachment_exists
          
        #   attachment = @lead.attached_file_stored_as_binary.attachment
        #   blob_data = @lead.attached_file_stored_as_binary.blob
        #   blob_path = blob_data.service.path_for(blob_data.key)
          
          # NOTE: FRESHDESK
          # data_hash = {
          #     status: 2,
          #     priority: 1,
          #     subject: "#{@lead.full_name} from #{@lead.company_name}", 
          #     description: "The contact #{@lead.full_name}  from company #{@lead.company_name} can be reached at email #{@lead.email} and at phone number #{@lead.phone}. #{@lead.department_in_charge_of_elevators} has a project named #{@lead.project_name} which would require contribution from Rocket Elevators.\nProject Description: #{@lead.project_description}\n#{@lead.message}.\nThe Contact uploaded an attachment",
          #     email: "#{@lead.email}",
          #     type:"Question",
          #     attachments: [File.new(blob_path, "rb")]
          #   }

          #   # data_json = JSON.generate(data_hash)
          #   site.post(data_hash)

            # if user_is_customer
              # NOTE: DROPBOX
              # authenticator = DropboxApi::Authenticator.new(ENV["DROPBOX_KEY"], ENV["DROPBOX_SECRET"])
              # authenticator.auth_code.authorize_url(token_access_type: "offline")
              # access_token = authenticator.auth_code.get_token(ENV["DROPBOX_ACCESS_CODE"])
              # client = DropboxApi::Client.new(access_token: access_token)
        #       client = DropboxApi::Client.new
        #       folder_exists = client.search("#{@lead.full_name}").matches[0]
        #       client.create_folder("/#{@lead.full_name}") unless folder_exists
        #       file_path = "/#{@lead.full_name}/#{blob_data.filename.sanitized}"
        #       response = client.upload(file_path, blob_data.download)
        #       attachment.purge if response.id
        #     end
          
        # else
          # attachment does not exist or user is not customer 
          data_hash = {
            status: 2,
            priority: 1,
            subject: "#{@intervention.result} from #{@intervention.author}", 
            description: 
            "#{@intervention.author} started a new intervention
            for company #{@intervention.customer_id},
            On builging id #{@intervention.building_id},
            battery id #{@intervention.battery_id},
            column id #{@intervention.column_id},
            elevator id #{@intervention.elevator_id},
            Job is done by employee id #{@intervention.employee_id},
            The job description #{@intervention.report}
              ",
            
            email: "#{current_user.email}",
            type:"Question"
            }
          
          data_json = JSON.generate(data_hash)
          # site.post(data_json, :content_type => 'application/json')
          request = RestClient::Request.execute(
            method: :post,
            url: my_uri,
            user: my_key,
            password: 'X',
            payload: data_json,
            headers: {"Content-Type" => "application/json"},
          )
      

          format.html { redirect_to "/", notice: "Thank you. We will communicate with you shortly!" }
          format.json { render :show, status: :created, location: @intervention }
        else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy

    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end
# AJAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  def get_building_by_customer
    @building = Building.where("customer_id = ?", params[:customer_id])
    respond_to do |format|
        format.json { render :json => @building }
    end
  end

  def get_battery_by_building
    @battery = Battery.where("building_id = ?", params[:building_id])
    respond_to do |format|
        format.json { render :json => @battery }
    end
  end

  def get_column_by_battery
    @column = Column.where("battery_id = ?", params[:battery_id])
    respond_to do |format|
        format.json { render :json => @column }
    end
  end

  def get_elevator_by_column
    @elevator = Elevator.where("column_id = ?", params[:column_id])
    respond_to do |format|
        format.json { render :json => @elevator }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.require(:intervention).permit(:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :report)
    end
end
