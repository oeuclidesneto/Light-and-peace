import { Turbo } from "@hotwired/turbo-rails"; // Ensure Turbo is imported first
import { Application } from "@hotwired/stimulus"; // Then Stimulus

const application = Application.start();

// Configure Stimulus
application.debug = false;
window.Stimulus = application;

// Import all Stimulus controllers
import "controllers";

// Export Stimulus application
export { application };
import "@activeadmin/admin"

