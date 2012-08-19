require 'spreadsheet'

class ImportDefinition < ActiveRecord::Base
  
  attr_accessible :name, :description, :sheet_name, :starting_row, :max_rows, :cycle_column, :rn_column, :delta_rn_column
  
  validates :name, :presence => true, :uniqueness => true
  validates :description, :length => { :maximum => 255 }
  validates :starting_row, :presence => true, :numericality => { :minimum => 1 }
  validates :max_rows, :presence => true, :numericality => { :minimum => 1 }
  
  default_scope :order => :name
    
  def read_amplifications(excel_file)
    book = Spreadsheet.open excel_file
    if sheet_name
      sheet = book.worksheet(sheet_name)
    else
      sheet = book.active_worksheet
    end
    read_amplification_data sheet
  end
  
  private
  
  def read_amplification_data(sheet)
    amplifications = [ ]
    sheet.each (starting_row - 1 || 0) do |row|
      amplifications << Amplification.new(
        :cycle => row[cycle_column], 
        :rn => row[rn_column], 
        :delta_rn => row[delta_rn_column]
      )
      break if amplifications.count == max_rows
    end
    amplifications
  end
  
end
