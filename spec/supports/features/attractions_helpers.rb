module Features
  module AttractionsHelpers
    def select_datetime(date, from: )
      select I18n.l( date, format: '%Y'), :from => "#{from}_1i"
      select I18n.l( date, format: '%B'), :from => "#{from}_2i"
      select I18n.l( date, format: '%d'), :from => "#{from}_3i"
      select I18n.l( date, format: '%H'), :from => "#{from}_4i"
      select I18n.l( date, format: '%M'), :from => "#{from}_5i"
    end
  end
end
