# frozen_string_literal: true

RSpec.describe Workflow do
  it 'is invalid if missing name attribute' do
    workflow = build(:workflow, name: '')

    expect(workflow).not_to be_valid
  end

  it 'object contains error message if name is missing' do
    workflow = build(:workflow, name: '')
    workflow.validate

    expect(workflow.errors[:name]).to include('can\'t be blank')
  end

  it 'object contains error message if name contains invalid characters' do
    workflow = build(:workflow, name: 'bad^%name!')
    workflow.validate

    expect(workflow.errors[:name]).to include('contains invalid characters')
  end

  it 'is invalid if missing id attribute' do
    workflow = build(:workflow, id: '')

    expect(workflow).not_to be_valid
  end

  it 'object contains error message if id is missing' do
    workflow = build(:workflow, id: '')
    workflow.validate

    expect(workflow.errors[:id]).to include('can\'t be blank')
  end

  it 'object contains error message if id is invalid' do
    workflow = build(:workflow, id: "test_#{SecureRandom.base58(16)}")
    workflow.validate

    expect(workflow.errors[:id]).to include('contains invalid ID')
  end

  it 'is valid if all required attributes are present' do
    workflow = build(:workflow)

    expect(workflow).to be_valid
  end
end
