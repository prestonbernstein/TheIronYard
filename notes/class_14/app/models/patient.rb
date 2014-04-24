class Patient < ActiveRecord::Base
  has_many :medications
  belongs_to :hospitals
  validates :name, presence: true

  def patient_leaving
    workflow_state == 'leaving'
  end

  include Workflow
  workflow do
    state :waiting do
      event :doctor, transitions_to: :doctor
      event :xray, transitions_to: :xray
      event :surgery, transitions_to: :surgery
      event :leaving, transitions_to: :leaving
    end
    state :doctor do
      event :xray, transitions_to: :xray
      event :surgery, transitions_to: :surgery
      event :pay, transitions_to: :pay
    end
    state :xray do
      event :doctor, transitions_to: :doctor
      event :surgery, transitions_to: :surgery
      event :pay, transitions_to: :pay
    end
    state :surgery do
      event :doctor, transitions_to: :doctor
      event :xray, transitions_to: :xray
      event :pay, transitions_to: :pay
    end
    state :pay do
      event :leaving, transitions_to: :leaving
    end
    state :leaving
  end
end