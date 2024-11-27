class JobsController < ApplicationController
  def create
    job = Job.new(title: params[:title], company: params[:company], location: params[:location], description: params[:description])
    if job.save
      render json: job, status: :created
    else
      render json: { errors: job.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    job = Job.find_by(id: params[:id])
    if job
      render json: job
    else
      render json: { error: "Job not found" }, status: :not_found
    end
  end

  def index
    jobs = Job.all
    render json: jobs
  end

  def param
    params.require(:job).permit(:url, :employer_name, :employer_description, :job_title, :job_description, :year_of_experience, :education_requirement, :industry, :base_salary, :employment_type_id)
  end
end
