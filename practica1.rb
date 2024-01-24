class Video

    #atributos
    attr_accessor :title

    #constructor
    def initialize(title)
      self.title = title
    end

    #Metodo Privado



    def play
      puts("Reproduciendo Video")
    end

    def show_formato
        formato_video
    end

    private

    def formato_video
        puts "mp4"
    end
end

class VideoFacebook < Video #clase hijo1

end

class VideoYoutube < Video  #clase hijo2

end


vf = VideoFacebook.new("Facebook")
vy = VideoYoutube.new("Youtube")

puts vf.title
puts vy.title

#llamada a metodo instancia
vf.play
vy.play

#llamado a metodo privado
vf.show_formato
vy.show_formato
