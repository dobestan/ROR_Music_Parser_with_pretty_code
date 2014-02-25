module ContentProviderNameGenerator
  def get_content_provider_full_name(content_provider_short_name)
    content_provider_full_name = case content_provider_short_name
                                   when "N" then "Naver Music"
                                   when "M" then "Melon Music"
                                   when "D" then "Daum Music"
                                 end
  end
end
