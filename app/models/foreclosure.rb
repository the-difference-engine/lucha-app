class Foreclosure < ActiveRecord::Base
  validates_uniqueness_of :client_id
  validates_presence_of :client

  validates :originating_lender, :original_loan_number, :servicer, :servicer_loan_number, :monthly_mortgage_payment, :loan_term, :court_case_number, presence: true

  validates :been_to_court, :inclusion => {:in => [true, false]}
  validates :working_with_lawyer, :inclusion => {:in => [true, false]}
  validates :working_w_agency, :inclusion => {:in => [true, false]}
  validates_date :origination_date, :on_or_before => lambda { Date.current }

  # validates_format_of :employer_phone, :with => ^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]‌​)\s*)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-‌​9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})


  has_many :program_employees, as: :programable
  belongs_to :client


  def counselor?
    if program_employees[0].user.blank?
     "Not yet assigned."
   else 
     program_employees[0].user
   end
 end

 def column_count
  attributes.length - 3
    # Subtracting 3 from the column count to account for the columns id, updated at, and created at, which were filled automatically and not by the client.

  end

  def filled_columns
    filled_count = 0
    attributes.each do |k, v|
      if v != nil
        filled_count+=1
      end
    end
    filled_count - 3
  end

def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |foreclosure|
      csv << foreclosure.attributes.values_at(*column_names)
    end
  end
end
end