class ReportsController < ApplicationController
  def balance
    redirect_to root_path, notice: "#{current_user.email}, Um CSV com a lista completa de todos os associados e seu saldo (balance) em ordem alfabética"
    self.mailer
  end

  def mailer
    ReportMailer.send_report(current_user.email).deliver_later
  end

end
