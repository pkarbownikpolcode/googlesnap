class GqueriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :param, :only => [:edit, :show, :destroy, :update]

  def param
    @gquery = Gquery.find(params[:id])
  end

  def index
    @gqueries = Gquery.where(:user_id => current_user.id)
  end

  def new
    @gquery = Gquery.new
    @gquery.user_id = current_user.id
  end

  def create
    @gquery = Gquery.new(params[:gquery])

    if @gquery.save
       @gquery.googlesresults
      render 'show', notice: 'Google query was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @gquery.update_attributes(params[:gquery])
      @gquery.googlesresults
      redirect_to @gquery, notice: 'Google query was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @gquery.destroy
    redirect_to :action => 'index'
  end

  def show

  end

  def edit

  end

end
