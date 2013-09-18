class SlogsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource
  autocomplete :tag, :name, :class_name => 'ActsAsTaggableOn::Tag', :full => true

  # GET /slogs
  # GET /slogs.json
  def index
    if params[:tag]
      @slogs = Slog.tagged_with(params[:tag])
    else
      @slogs = Slog.all
    end
    @slog_types = SlogType.all
    @times = { "All Time" => "all",
              "Past Week" => "1week", 
              "Past Month" => "1month", 
              "Past 3 Months" => "3month",
              "Past Year" => "1year",
              "Past 2 Years" => "2year" } 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @slogs }
    end
  end

  # GET /slogs/1
  # GET /slogs/1.json
  def show
    @slog = Slog.find(params[:id])
    if request.path == slog_path(@slog)
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @slog }
      end
    else
      redirect_to @slog, status: :moved_permanently
    end
  end

  # GET /slogs/new
  # GET /slogs/new.json
  def new
    @slog = Slog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @slog }
    end
  end

  # GET /slogs/1/edit
  def edit
    @slog = Slog.find(params[:id])
  end

  # POST /slogs
  # POST /slogs.json
  def create
    @slog = Slog.new(params[:slog])
    @slog.user_id = current_user.id
    respond_to do |format|
      if @slog.save
        format.html { redirect_to @slog, notice: 'Slog was successfully created.' }
        format.json { render json: @slog, status: :created, location: @slog }
      else
        format.html { render action: "new" }
        format.json { render json: @slog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /slogs/1
  # PUT /slogs/1.json
  def update
    @slog = Slog.find(params[:id])

    respond_to do |format|
      if @slog.update_attributes(params[:slog])
        format.html { redirect_to @slog, notice: 'Slog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @slog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slogs/1
  # DELETE /slogs/1.json
  def destroy
    @slog = Slog.find(params[:id])
    @slog.destroy

    respond_to do |format|
      format.html { redirect_to slogs_url }
      format.json { head :no_content }
    end
  end

  def comment
    slog = Slog.find params[:id]
    text = params[:comment_text]
    comment = Comment.build_from( slog, current_user.id, text )
    if comment.save
      if(params[:parent])
        comment.move_to_child_of(Comment.find params[:parent])
      end
      redirect_to :back, notice: "Comment added successfully"
    else
      redirect_to :back, error: "Failed to add comment"
    end
  end

end
