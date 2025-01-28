class Camera
    def load
        puts = "Winding film."
    end
    def take_picture
        puts "Triggering shutter."
    end
end
camera = Camera.new
camera.load
camera.take_picture