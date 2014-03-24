require 'spec_helper'

describe Division do

  it { should belong_to :employee }

  it 'can return the divisions not assigned to an employee' do
    not_assigned_divisions = (1..2).to_a.map do |number|
      Division.create(:name => "division #{number}")
    end
  end
end
