class RegMailer < ActionMailer::Base

    default :from => "The YSOA Registration App <no-reply@ysoa_registration.app>"
  
    def laser_registrations_notification(laser_agreements)
      @laser_agreements = laser_agreements
      mail( :to => "vincent.guerrero@yale.edu",
            :cc => "robert.liston@yale.edu",
            :subject => "Yesterday's Laser Cutter Registrations")
    end

    def print_registrations_notification(print_agreements)
      @print_agreements = print_agreements
      mail( :to => "robert.liston@yale.edu",
            :cc => "vincent.guerrero@yale.edu",
            :subject => "Yesterday's Printing Registrations")
    end
  
    def workstation_registrations_notification(workstations)
      @workstations = workstations
      mail( :to => "robert.liston@yale.edu",
            :cc => "vincent.guerrero@yale.edu",
            :subject => "Yesterday's Workstation Registrations")
    end
  
end
