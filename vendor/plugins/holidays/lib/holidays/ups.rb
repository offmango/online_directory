module Holidays
  # This file is generated by the Ruby Holiday gem.
  #
  # Definitions loaded: data/ups.yaml
  #
  # To use the definitions in this file, load them right after you load the 
  # Holiday gem:
  #
  #   require 'holidays'
  #   require 'holidays/ups'
  #
  # More definitions are available at http://code.dunae.ca/holidays.
  module UPS # :nodoc:
    DEFINED_REGIONS = [:ups]

    HOLIDAYS_BY_MONTH = {
      5 => [{:wday => 1, :week => -1, :name => "Memorial Day", :regions => [:ups]}],
      11 => [{:wday => 4, :week => 4, :name => "Thanksgiving", :regions => [:ups]},
            {:wday => 5, :week => 4, :name => "Day After Thanksgiving", :regions => [:ups]}],
      1 => [{:mday => 1, :observed => lambda { |date| Holidays.to_weekday_if_weekend(date) }, :observed_id => "to_weekday_if_weekend", :name => "New Year's Day", :regions => [:ups]}],
      12 => [{:mday => 25, :observed => lambda { |date| Holidays.to_weekday_if_weekend(date) }, :observed_id => "to_weekday_if_weekend", :name => "Christmas Day", :regions => [:ups]},
            {:mday => 31, :name => "New Year's Eve", :regions => [:ups]}],
      7 => [{:mday => 4, :observed => lambda { |date| Holidays.to_weekday_if_weekend(date) }, :observed_id => "to_weekday_if_weekend", :name => "Independence Day", :regions => [:ups]}],
      9 => [{:wday => 1, :week => 1, :name => "Labor Day", :regions => [:ups]}]
    }
  end


end

Holidays.merge_defs(Holidays::UPS::DEFINED_REGIONS, Holidays::UPS::HOLIDAYS_BY_MONTH)
