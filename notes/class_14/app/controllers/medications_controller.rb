class MedicationsController < ApplicationController
  before_filter :find_patient
  before_filter :find_hospital
  before_filter :find_medication, only: [:show, :edit, :update, :destroy, :doctor, :add_doctor]

  def new
    @medication = @patient.medications.new
  end

  def create
    @medication = @patient.medications.new medication_params
    if @medication.save
      redirect_to hospital_patient_path(@hospital, @patient)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @medication.update_attributes medication_params
    redirect_to hospital_patient_path(@hospital, @patient)
  end

  def destroy
    @medication.delete
    redirect_to root_path
  end

private
  def find_hospital
    @hospital = Hospital.find params[:hospital_id]
  end

  def find_patient
    @patient = Patient.find params[:patient_id]
  end

  def find_medication
    @medication = Medication.find params[:id]
  end

  def medication_params
    params.require(:medication).permit(:name, :description, :hospital_id)
  end
  
end
