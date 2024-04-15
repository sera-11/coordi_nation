class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @organization = Organization.find(params[:organization_id])
    @tasks = @organization.tasks.order(due_date: :asc)
    @members = @organization.members
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @organization = Organization.find(params[:organization_id])
    @task = Task.new
    @members = @organization.members
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    @organization = @task.organization
    @members = @organization.members
  end

  # POST /tasks or /tasks.json
  def create
    @organization = Organization.find(params[:organization_id])
    @task = @organization.tasks.new(task_params) # Build the task associated with the organization
    @task.status = :not_started
    @members = @organization.members # Initialize @members

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def start
    @task = Task.find(params[:id])
    @task.update(status: :in_progress)
    redirect_to organization_tasks_path(@task.organization)
  end
  
  def complete
    @task = Task.find(params[:id])
    @task.update(status: :completed)
    redirect_to organization_tasks_path(@task.organization)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:text, :due_date, :assigned_to_id, :organization_id, :status)
  end
end
