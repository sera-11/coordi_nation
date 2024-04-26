class TasksController < ApplicationController
  before_action :set_organization
  before_action :set_task, only: [:show, :edit, :update, :destroy, :start, :complete]

  # GET /tasks or /tasks.json
  def index
    @tasks = @organization.tasks.order(due_date: :asc)
    @members = @organization.members
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    load_organization_data
  end

  # GET /tasks/1/edit
  def edit
    load_organization_data
  end

  # POST /tasks or /tasks.json
  def create
    @task = @organization.tasks.new(task_params)
    @task.status = :not_started
    load_organization_data

    respond_to do |format|
      if @task.save
        format.html { redirect_to organization_tasks_path(@organization), notice: "Task was successfully created." }
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
        format.html { redirect_to organization_tasks_path(@organization), notice: "Task was successfully updated." }
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
      format.html { redirect_to organization_tasks_path(@organization), notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # PUT /tasks/1/start
  def start
    @task.update(status: :in_progress)
    redirect_to organization_tasks_path(@organization)
  end

  # PUT /tasks/1/complete
  def complete
    @task.update(status: :completed)
    redirect_to organization_tasks_path(@organization)
  end

  private

  # Load organization data for new and edit actions
  def load_organization_data
    @members = @organization.members
  end

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:text, :due_date, :assigned_to_id, :organization_id, :status)
  end
end
