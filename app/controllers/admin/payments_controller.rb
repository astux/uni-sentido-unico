# -*- coding: utf-8 -*-
class Admin::PaymentsController < ApplicationController
  before_filter :init

  def init
    @course = Course.find(params[:course_id])
    @curriculum_student = CurriculumStudent.find(params[:curriculum_student_id])
  end

  def index
    @payments = @curriculum_student.payments

    respond_with(@payments)
  end

  def show
    @payment = Payment.find(params[:id])

    respond_with(@payment)
  end

  def new
    @payment = Payment.new

    respond_with(@payment)
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def create
    @payment = Payment.new(params[:payment])
    @payment.save

    # rotina pra gerar o "nosso número"

    respond_with(:admin, @course, @curriculum_student, @payment)
  end

  def update
    @payment = Payment.find(params[:id])
    @payment.update_attributes(params[:payment])

    respond_with(:admin, @course, @curriculum_student, @payment)
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_with(:admin, @course, @curriculum_student)
  end

  def gerar_boleto
    @payment = Payment.find(params[:id])

    @boleto = Brcobranca::Boleto::Bradesco.new
    @boleto.cedente = "Sentido Único"
    @boleto.documento_cedente = "12345678912"

    @boleto.sacado = @curriculum_student.student.name
    @boleto.sacado_documento = "12345678900"
    @boleto.sacado_endereco = "Av/Rua/Endereço do Sacado"

    @boleto.valor = @payment.amount

    @boleto.agencia = "4042"
    @boleto.conta_corrente = "61900"
    @boleto.convenio = "1238798"

    @boleto.numero_documento = @payment.id # "302008"

    @boleto.dias_vencimento = @payment.due_date - Date.today
    @boleto.data_documento = Date.today

    @boleto.instrucao1 = "Pagável na rede bancária até a data de vencimento."
    @boleto.instrucao2 = "Juros de mora de 2.0% mensal(R$ 0,09 ao dia)"
    @boleto.instrucao3 = "DESCONTO DE R$ 29,50 APÓS 05/11/2006 ATÉ 15/11/2006"
    @boleto.instrucao4 = "NÃO RECEBER APÓS 15/11/2006"
    @boleto.instrucao5 = "Após vencimento pagável somente nas agências do Banco do Brasil"
    @boleto.instrucao6 = "ACRESCER R$ 4,00 REFERENTE AO BOLETO BANCÁRIO"

    headers['Content-Type'] = 'application/pdf'

    send_data @boleto.to(:pdf), :filename => "Boleto #{@boleto.sacado} Vencimento #{@payment.due_date}.pdf"
  end
end
