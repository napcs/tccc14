require 'java'

import javax.sound.midi.MidiSystem
import javax.swing.JFrame
import java.awt.event.KeyListener
import java.awt.event.MouseMotionListener
 

class DrumMachine
  def initialize

    # Prepare the synth, get channel 10 for drums
    # remember that arrays are zero-indexed, so 
    # we need channel 9
    @synth = MidiSystem.synthesizer
    @synth.open
    @channel = @synth.channels[9]
    @velocity = 64
    
    # Prepare a frame to receive keystrokes
    @frame = JFrame.new("Drum Machine")
    @frame.set_size 300, 100
    @frame.default_close_operation = JFrame::EXIT_ON_CLOSE
    
    # Listen for keystrokes, play notes
    @frame.add_key_listener KeyListener.impl { |name, event|
      case name
      when :keyPressed
        @channel.note_on event.key_char, @velocity
      when :keyReleased
        @channel.note_off event.key_char
      end
    }

    @frame.add_mouse_motion_listener MouseMotionListener.impl { |name, event|
      case name
      when :mouseMoved
        @velocity = event.getX
      end
    
    }
    # Show the frame
    @frame.visible = true
  end
end

DrumMachine.new

event_thread = nil
SwingUtils = javax.swing.SwingUtilities
SwingUtils.invokeAndWait do 
  event_thread = java.lang.Thread.currentThread 
end
event_thread.join
