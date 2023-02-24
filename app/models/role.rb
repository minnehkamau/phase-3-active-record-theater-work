class Role < ActiveRecord::Base
    has_many :auditions
    def anctors
        auditions.pluck(:actor)
    end
    def locations
        auditions.pluck(:location)
      end
      
      def lead
        hired_audition = auditions.find_by(hired: true)
        hired_audition ? hired_audition.actor : 'no actor has been hired for this role'
      end
      
      def understudy
        hired_auditions = auditions.where(hired: true)
        hired_auditions[1] ? hired_auditions[1].actor : 'no actor has been hired for understudy for this role'
      end
end
