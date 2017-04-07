module Prettytime
  extend ActiveSupport::Concern
   
    def pretty_time
      try(:created_at).try(:strftime, "%b %d, %Y")
    end

    def pretty_last_sign_in_at
      try(:last_sign_in_at).try(:strftime, "%b %d, %Y")
    end

end

