module ApplicationsHelper

  def google_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=12&key=#{ENV["GMAP_API_KEY"]}"
  end

end
