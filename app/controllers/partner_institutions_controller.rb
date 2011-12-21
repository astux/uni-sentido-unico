class PartnerInstitutionsController < ApplicationController
  def index
    @partner_institutions = PartnerInstitution.paginate :page => params[:page]
    
    respond_with @partner_institutions
  end
  
  def new
    @partner_institution = PartnerInstitution.new
    
    respond_with @partner_institution
  end
  
  def create
    @partner_institution = PartnerInstitution.new(params[:partner_institution])
    @partner_institution.save

    respond_with @partner_institution, :location => [:admin, @partner_institution]
  end
  
  def show
    @partner_institution = PartnerInstitution.find params[:id]
    
    respond_with @partner_institution
  end
  
  def edit
    @partner_institution = PartnerInstitution.find params[:id]
    
    respond_with @partner_institution
  end
  
  def update
    @partner_institution = PartnerInstitution.find params[:id]
    @partner_institution.update_attributes params[:partner_institution]
    
    respond_with @partner_institution, :location => [:admin, @partner_institution] 
  end
  
  def destroy
    @partner_institution = PartnerInstitution.find params[:id]
    @partner_institution.destroy
    
    respond_with @partner_institution, :location => {:action => :index}
  end
end