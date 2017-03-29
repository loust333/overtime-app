require 'rails_helper'

describe 'overtime calculations' do
  it 'calculates accurate overtime values for salaried employee' do
    thousand = SalariedOvertimeCalculator.calculate(weekly_salary: 1000.0,
                                                       total_hours: 43.0)
    nine_hundred = SalariedOvertimeCalculator.calculate(weekly_salary: 900.0,
                                                           total_hours: 55.5)
    expect(thousand.to_i).to eq(34)
    expect(nine_hundred.to_i).to eq(125)
  end

  it 'returns 0.0 for an overtime amount if the total hours are 40 or under' do
    forty_or_under = SalariedOvertimeCalculator.calculate(weekly_salary: 900.0,
                                                          total_hours: 40.0)
    expect(forty_or_under.to_i).to eq(0)
  end
end
