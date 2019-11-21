module WebpHelper
  def webp_tag(uploader, alt)
    render 'shared/webp.html.haml', uploader: uploader, alt: alt
  end
end
