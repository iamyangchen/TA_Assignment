class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @application_pools = ApplicationPool.where(:active => true)
    @studentapplications = Hash.new
    @application_status = Hash.new 
    @application_pools.each do |application_pool|
      if StudentApplication.exists?(application_pool_id: application_pool.id, user_id: @user.id)
        @studentapplications[application_pool.id] = StudentApplication.find_by(application_pool_id: application_pool.id, user_id: @user.id)
        matchings = AppCourseMatching.where(student_application_id: @studentapplications[application_pool.id].id)
        if matchings
          matchings.each do |match|
            course = Course.find match.course_id
            if not match.status == StudentApplication::TEMP_ASSIGNED
              if not @application_status[application_pool.id]
                @application_status[application_pool.id] = Array.new
              end
              @application_status[application_pool.id] << {'Matching_id' => match.id, 'Course' => course.name, 'Position' => match.position, 'Status' => match.status}
            end
          end
        end
      end
    end

    @courses = Course.where(user_id: @user.id)
    @courses_ta = Hash.new 
    @ta_status = Hash.new
    @courses.each do |course|
      tadata_matching = AppCourseMatching.where(course_id: course.id)
      tadata_ids = Array.new
      tadata_status = Hash.new 
      tadata_matching.each do |matching|
        tadata_ids << matching.student_application_id
        tadata_status[matching.student_application_id] = {'status' => matching.status, 'position' => matching.position}
      end
      tadata = StudentApplication.where(id: tadata_ids)  # This will return one list
      @courses_ta[course.id] = tadata
      @ta_status[course.id] = tadata_status    
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def request_new_ta
    @user = User.find params[:id]
    @course = Course.find params[:course_id]
    @studentapplications = StudentApplication.where(application_pool_id: @course.application_pool_id)
    @assignable = Hash.new 
    @studentapplications.each do |studentapplication|
      if AppCourseMatching.exists?(application_pool_id: @course.application_pool_id, student_application_id: studentapplication.id)
        @assignable[studentapplication.id] = false
      else
        @assignable[studentapplication.id] = true
      end
    end
  end

  def assign_request_new_ta
    id = params[:course_id]
    @course = Course.find(id)
    if params[:ids]
      new_tas = params[:ids].keys
      if not new_tas.empty?
        new_tas.each do |ta_id|
          @studentapplication = StudentApplication.find ta_id
          
          requesters = @studentapplication.requester
          if not requesters
            @studentapplication.requester = @course.id.to_s
          else
            @studentapplication.requester = @studentapplication.requester + ',' + @course.id.to_s
          end

          @studentapplication.save
        end
      end
    end
    flash[:notice] = "Successfully request TA for #{@course.name} requesters: #{@studentapplication.requester}"
    redirect_to user_path(params[:id])
  end

  def new_application
    @user = User.find(params[:id])
    @application_pool = ApplicationPool.find(params[:term_id])
    @studentapplication = StudentApplication.new
  end

  def create_ta_application
    @user = User.find(params[:id])
    @application_pool = ApplicationPool.find(params[:term_id])
    @studentapplication = StudentApplication.create!(params[:student_application])
    @studentapplication.application_pool_id = params[:term_id]
    @studentapplication.user_id = @user.id
    @studentapplication.save
    flash[:notice] = "#{@studentapplication.fullName()} is created!"
    redirect_to user_path(@user.id)
  end

  def show_ta_application
    @user = User.find(params[:id])

  end

  def withdraw_student_application
    @user = User.find(params[:id])
    @studentapplication = StudentApplication.find(params[:app_id])

    #delete all matchings in the matching table
    @matchings = AppCourseMatching.where(student_application_id: params[:app_id])
    @matchings.each do |matching|
      matching.destroy
    end

    @studentapplication.destroy
    redirect_to user_path(@user.id)
  end

  def edit_ta_application
    @user = User.find(params[:id])
    @studentapplication = StudentApplication.find(params[:app_id])
  end

  def update_ta_application
    @user = User.find(params[:id])
    @studentapplication = StudentApplication.find(params[:app_id])
    @studentapplication.update_attributes!(params[:student_application])
    flash[:notice] = "#{@studentapplication.fullName()} is updated!"
    redirect_to user_path(@user.id)
  end

  def accept_ta_assignment
    @user = User.find(params[:id])
    @matching = AppCourseMatching.find params[:match_id]
    @course = Course.find @matching.course_id
    @matching.status = StudentApplication::STUDENT_CONFIRMED
    @matching.save

    flash[:notice] = "TA assignment for #{@course.name} is accepted!"

    redirect_to user_path(@user.id)
  end

  def reject_ta_assignment
    @user = User.find(params[:id])
    @matching = AppCourseMatching.find params[:match_id]
    @course = Course.find @matching.course_id
    @matching.status = StudentApplication::STUDENT_REJECTED
    @matching.save

    flash[:notice] = "TA assignment for #{@course.name} is rejected!"
    redirect_to user_path(@user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :uin, :email, :login)
    end
end
