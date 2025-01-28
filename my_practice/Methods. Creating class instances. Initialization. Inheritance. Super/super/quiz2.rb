require_relative 'quiz'
class DigitalCamera < Camera
    def load
        puts "Inserting memory card."
    end
end
camera2 = DigitalCamera.new
camera2.load
camera2.take_picture