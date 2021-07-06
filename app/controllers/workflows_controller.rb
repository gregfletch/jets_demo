# frozen_string_literal: true

class WorkflowsController < ApplicationController
  # GET /workflows
  def index
    render json: Workflow.scan.to_json
  end

  # GET /workflows/:id
  def show
    render json: Workflow.find(id: show_params[:id], name: show_params[:name]).to_json
  end

  # POST /workflows
  def create
    workflow = Workflow.new
    workflow.id = Workflow.generate_id
    workflow.name = create_params[:name]

    if workflow.replace
      render json: workflow.to_json
    else
      render json: { errors: workflow.errors }.to_json
    end
  end

  private

  def show_params
    params.permit(:id, :name)
  end

  def create_params
    params.permit(:name)
  end
end
