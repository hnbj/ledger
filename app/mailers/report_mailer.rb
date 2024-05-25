require "csv"

class ReportMailer < ApplicationMailer
  default from: 'from@example.com'

  def send_report(email)
    @user = email
    attachments['report.csv'] = generate_csv
    mail(to: email, subject: 'Relatório de Associados')
  end

  private

  def generate_csv
    CSV.generate(headers: true) do |csv|
      csv << ["Nome", "Saldo"]
      Person.order(:name).each do |person|
        csv << [person.name, person.balance]
      end
    end
  end

end

