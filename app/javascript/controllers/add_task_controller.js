import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-task"
export default class extends Controller {
  connect() {
    console.log("connected to add task controller")
  }

  addtask() {
    console.log("clicked the add task button");
  }
}
