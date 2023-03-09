import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"
export default class extends Controller {
  static targets = ["hour", "min"]

  connect() {
    console.log("Hello, Stimulus!", this.element.dataset.time)
    let time = this.element.dataset.time
    let hourTarget = this.hourTarget
    let minTarget = this.minTarget
    setInterval(function() {
      let duration = Date.now() - new Date(time);
      let minutes = Math.floor((duration / (1000 * 60)) % 60);
      let hours = Math.floor((duration / (1000 * 60 * 60)) % 24);

      hours = (hours < 10) ? "0" + hours : hours;
      minutes = (minutes < 10) ? "0" + minutes : minutes;
      hourTarget.innerHTML = hours
      minTarget.innerHTML = minutes
    }, 1000);
    console.log(this.hourTarget)
    console.log(this.minTarget)
  }
}
