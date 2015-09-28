module Features
  module AttractionsHelpers
    def select_datetime(date, from: )
      fill_in 'attraction[day]', with: Time.now
    end
  end
end
