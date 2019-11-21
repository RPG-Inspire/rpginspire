module GoogleAnalyticsHelper
  def ga_code
    Rails.application.credentials.ga
  end
end

