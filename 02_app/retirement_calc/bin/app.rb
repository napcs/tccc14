# Make Java go now
require 'java'
import javax.swing.JFrame
import javax.swing.JPanel
import javax.swing.JButton
import javax.swing.JLabel
import javax.swing.JTextField
import javax.swing.JOptionPane

# Going to use the grid layout in Swing
# because it's both easy and hard at the
# same time!
import java.awt.GridLayout

# The Calculator class. Inherits
# from JFrame and needs to have
# its constructor overridden.
class Calculator < JFrame
  # property for the main window
  attr_accessor :main_window

  #JFrame constructor takes a string for
  #the window title. We'll set it with super.
  def initialize
    super "Simple calculator"
    self.create_main_window
  end

  def create_main_window
    # Create the panel and add it to the pane.
    self.main_window = JPanel.new
    self.get_content_pane().add main_window
    # setting up a grid. unlimited rows, two cols.
    # +--------+---------+
    # |        |         |
    # +--------+---------+
    # |        |         |
    # +--------+---------+
    # Everything we add to the main window
    # will just fill the cells in the grid.
    self.main_window.set_layout(GridLayout.new(0,2))
    
    # add the label for the name field
    self.main_window.add JLabel.new("Your Name", JLabel::RIGHT)

    # add the text field. We declare this
    # as an instance var so we can access it
    # from other functions
    @name = JTextField.new 15
    self.main_window.add @name

    # repeat for the age
    self.main_window.add JLabel.new("Your Age", JLabel::RIGHT)

    @age = JTextField.new 15
    self.main_window.add @age

    # now we need a button
    button = JButton.new("Calculate")

    # Just like jQuery, we handle the button
    # click.
    button.add_action_listener do |e|
      # in a real app, I wouldn't put
      # the business logic right here.
      age = (65 - @age.get_text.to_i) 
      result = ("You have #{age.to_s} years to retirement.")
      show_dialog(result)
    end

    # Adding a blank label to fill the cell
    # so the button lines up under the textboxes
    self.main_window.add  JLabel.new("", JLabel::RIGHT)
    self.main_window.add button

    # Now we can do the rest of the window 
    # configuration.
    self.set_default_close_operation JFrame::EXIT_ON_CLOSE
    self.set_location_relative_to nil
    self.set_size 400,100
    self.setVisible true
  end

  def show_dialog(message)
    JOptionPane.showMessageDialog self.main_window, message,
                      "Result", JOptionPane::INFORMATION_MESSAGE
  end
end

# initialize the object which runs
# the app
app = Calculator.new


# This is a hack for Warbler
# so the main thread doesn't die
# http://stackoverflow.com/questions/10108822/jruby-script-with-rubeus-and-swing-exiting-once-packaged-into-jar-using-warble
event_thread = nil
SwingUtils = javax.swing.SwingUtilities
SwingUtils.invokeAndWait do 
  event_thread = java.lang.Thread.currentThread 
end
event_thread.join

