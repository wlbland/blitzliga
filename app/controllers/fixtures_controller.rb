class FixturesController < ApplicationController

  skip_before_action :authenticate_user!

  skip_after_action :verify_authorized, only: [:future, :past, :next, :results, :overdue]



  def index
    # @fixtures = Fixture.all
    @fixtures = policy_scope(Fixture)
  end


  def show
    @fixture = Fixture.find(params[:id])
    authorize @fixture
  end

  def new
    @fixture = Fixture.new
  end

  # def edit
  #   @fixture = Fixture.find(params[:id])
  # end

  def create
    @fixture = Fixture.new(team_params)
    if @fixture.save
      redirect_to @fixture
    else
      render 'new'
    end
  end

  def add_photos
    @fixture = Fixture.find(params[:id])
    # placeholder for simple form
    @new_photo = FixturePhoto.new()
    authorize @fixture
    unless params[:fixture_photos].nil?
      respond_to do |format|
        if @fixture.save
          params[:fixture_photos]['photo'].each do |a|
            @fixture_photo = FixturePhoto.create!(:photo => a, :fixture_id => @fixture.id)
          end
         format.html { redirect_to @fixture, notice: 'Photos were successfully added.' }
        else
         format.html { render action: 'add_photos' }
        end
      end
    end
    # Parameters: {, , "fixture_photos"=>{"photo"=>[#<ActionDispatch::Http::UploadedFile:0x0000555e8b692528 @tempfile=#<Tempfile:/tmp/RackMultipart20181001-32741-14tm64r.jpg>, @original_filename="FlowCBDBackground.jpg", @content_type="image/jpeg", @headers="Content-Disposition: form-data; name=\"fixture_photos[photo][]\"; filename=\"FlowCBDBackground.jpg\"\r\nContent-Type: image/jpeg\r\n">, #<ActionDispatch::Http::UploadedFile:0x0000555e8b690ae8 @tempfile=#<Tempfile:/tmp/RackMultipart20181001-32741-12lrvmp.png>, @original_filename="logo.png", @content_type="image/png", @headers="Content-Disposition: form-data; name=\"fixture_photos[photo][]\"; filename=\"logo.png\"\r\nContent-Type: image/png\r\n">]}, "commit"=>"Update fixture", "id"=>"1"}
    # if @fixture.update()
      # redirect_to @fixture
    # else
      # redirect_to "/" # for time being
    # end
  end

  def destroy
    @fixture = Fixture.find(params[:id])
    authorize @fixture
    @fixture.destroy
    redirect_to fixtures_path
  end

  def future
    @fixtures = policy_scope(Fixture).future.valid.order(time: :asc)
  end

  def past
    @fixtures = policy_scope(Fixture).past.order(time: :desc)
  end

  def next
    @fixtures = Fixture.future.next.valid.order(time: :asc)
  end

  def overdue
    @fixtures = policy_scope(Fixture).past.valid.no_result.order(time: :asc)
  end

  def results
    @fixtures = Fixture.result_recorded.order(time: :desc)
  end

  # def results_due
  #   @fixtures = policy_scope(Fixture).past.order(time: :desc)
  # end


  private

    def fixture_params
      params.require(:team, :fixture).permit(:time)
    end
end
