class Trailer
  attr_reader :embed, :trailers, :trailer
    
  def initialize(hash)
    @trailers= hash["trailers"]
    @trailer = hash ["trailers"]["trailer"]
    @embed = hash ["trailer"]["embed"]
  end
      
  def self.all
   trailers_array=Unirest.get("http://api.traileraddict.com/?featured=yes&count=10").body
   p trailers_array
   trailers=[]

   @trailers.each do |trailer|
     trailers << Trailer.new(trailers_array)
    end
    return trailers
  end


    def embed_trailer(title_name)
      request = Unirest.get("http://api.traileraddict.com/?film=#{title_name.downcase.gsub('?', '').gsub(': ', '-').gsub(' ', '-').gsub('kingsman', 'kingsmen')}").body
      p  "http://api.traileraddict.com/?film=#{title_name.downcase.gsub(/[:? ]/, '?' => '',': ' => '-', ' ' => '-')}"
      embed_code = p Hash.from_xml(request)["trailers"]["trailer"]["embed"]
      return embed_code.html_safe
  end
end