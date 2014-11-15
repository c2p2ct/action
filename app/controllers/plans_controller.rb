class PlansController < ApplicationController
 before_action :set_plan, only: [:show, :edit, :update, :destroy]
 skip_before_action :authenticate_user!

  # GET /plans
  # GET /plans.json
  def index
    if params[:search]
      # @plans = Plan.search(params[:search]).order("created_at DESC")
      @search = Plan.search do
        fulltext params[:search]
        paginate :page => params[:page], :per_page => 10
      end
       @plans = @search.results
       # redirect_to plans_path
    else    
      @plans = Plan.all
      @plans = Plan.paginate(:page => params[:page], :per_page => 10)
    end
    puts "==========HELLO plans-index"
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
    
  # @plans = Plans.friendly.find(params[:id])
  # if request.path != plans_path(@plans)
  #   redirect_to @plans, status: :moved_permanently
  # end
  end

 def add_to_calendar
    @plan = Plan.find(params[:plan])
    @steps = @plan.steps
    #loop through plan steps
    
      # Create a calendar with an event (standard method)
      cal = Icalendar::Calendar.new
      cal.event do |e|
        e.dtstart     = Icalendar::Values::Date.new('20150101')
        e.dtend       = Icalendar::Values::Date.new('20150101')
        e.summary     = "First action app plan"
        e.description = "Here is the action to take..."
        e.ip_class    = "PRIVATE"
      end

      cal.publish

    #insert calendar events OR insert 
    ics = "BEGIN:VCALENDAR
    VERSION:2.0
    PRODID:-//bobbin v0.1//NONSGML iCal Writer//EN
    CALSCALE:GREGORIAN
    METHOD:PUBLISH
    BEGIN:VEVENT
    DTSTART:20150101T080000Z
    DTEND:20150101T110000Z
    DTSTAMP:20151130T213238Z
    UID:1285935469767a7c7c1a9b3f0df8003a@yoursever.com
    CREATED:20151130T213238Z
    DESCRIPTION:Example event 1
    LAST-MODIFIED:20151130T213238Z
    SEQUENCE:0
    STATUS:CONFIRMED
    SUMMARY:Example event 1
    TRANSP:OPAQUE
    END:VEVENT
    BEGIN:VEVENT
    DTSTART:20150101T120000Z
    DTEND:20150101T130000Z
    DTSTAMP:20151130T213238Z
    UID:1285935469767a7c7c1a9b3f0df8003b@yoursever.com
    CREATED:20151130T213238Z
    DESCRIPTION:Example event 2
    LAST-MODIFIED:20151130T213238Z
    SEQUENCE:0
    STATUS:CONFIRMED
    SUMMARY:Example event 2
    TRANSP:OPAQUE
    END:VEVENT
    END:VCALENDAR"

    # Plan.make_ical

    redirect_to @plan
    #success message
  end

  def write_ics

  end
 

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)
    
    # @plan.user = current_user 
    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.friendly.find(params[:id])
      
      @steps = @plan.steps.all
      @step = @plan.steps.build

      @comments = @plan.comments.all
      @comment = @plan.comments.build
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:name, :description, :duration, :picture, :amazonlink, steps_attributes: [:id, :planstep, :_destroy])
    end
end
