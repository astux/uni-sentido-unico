class CourseContractsController < ApplicationController
  def index
    @course_contracts = CourseContract.paginate :page => params[:page]
    
    respond_with @course_contracts
  end
  
  def new
    @course_contract = CourseContract.new
    
    respond_with @course_contract
  end
  
  def create
    @course_contract = CourseContract.new(params[:course_contract])
    @course_contract.save

    respond_with @course_contract, :location => [:admin, @course_contract]
  end
  
  def show
    @course_contract = CourseContract.find params[:id]
    
    respond_with @course_contract
  end
  
  def edit
    @course_contract = CourseContract.find params[:id]
    
    respond_with @course_contract
  end
  
  def update
    @course_contract = CourseContract.find params[:id]
    @course_contract.update_attributes params[:course_contract]
    
    respond_with @course_contract, :location => [:admin, @course_contract] 
  end
  
  def destroy
    @course_contract = CourseContract.find params[:id]
    @course_contract.destroy
    
    respond_with @course_contract, :location => {:action => :index}
  end
  
  def preview
    require 'brnumeros'
    
    @course_contract = CourseContract.find params[:id]
    @date = Time.new
    
    if params[:curriculum_student_id]
      @curriculum_student = CurriculumStudent.find params[:curriculum_student_id]
      @person = @curriculum_student.student.person
      @curriculum = @curriculum_student.curriculum
      
      @course = @curriculum.course
      
      @parcelas = 12
      @parcelas_extenso = Extenso.por_extenso(@parcelas)
      
      @mensalidade = 170
      @mensalidade_extenso = Extenso.por_extenso(@mensalidade)
      
      @valor_total = 2040
      @valor_total_extenso = Extenso.por_extenso(@valor_total)
    else
      @person = Person.first
      @course = Course.first
      @curriculum = @course.curriculums.first
      
      #Pagamento
      @parcelas = 12
      @parcelas_extenso = Extenso.por_extenso(@parcelas)
      
      @mensalidade = 170
      @mensalidade_extenso = Extenso.por_extenso(@mensalidade)
      
      @valor_total = 2040
      @valor_total_extenso = Extenso.por_extenso(@valor_total)
    end
    
    render :layout => 'print'
  end
end