import { Turbo } from "@hotwired/turbo-rails"  // Initialize Turbo
import { Application } from "@hotwired/stimulus" // Initialize Stimulus

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

// Import all Stimulus controllers
import "controllers"

// Export the Stimulus application
export { application }
