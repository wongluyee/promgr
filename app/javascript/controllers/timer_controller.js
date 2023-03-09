import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"
export default class extends Controller {
  static targets = ["hour", "min"]

  connect() {
    let hour = 0;
    let minute = 0;
    let second = 0;
    let count = 0;
    this.stopWatch(hour, minute, second, count);
    console.log(this.hourTarget)
    console.log(this.minTarget)

  }
  stopWatch(hour, minute, second, count) {
console.log(second)
    count++;

    if (count == 100) {
        second++;
        count = 0;
    }

    if (second == 60) {
        minute++;
        second = 0;
    }

    if (minute == 60) {
        hour++;
        minute = 0;
        second = 0;
    }

    let hrString = hour;
    let minString = minute;
    let secString = second;
    let countString = count;

    if (hour < 10) {
        hrString = "0" + hrString;
    }

    if (minute < 10) {
        minString = "0" + minString;
    }

    if (second < 10) {
        secString = "0" + secString;
    }

    if (count < 10) {
        countString = "0" + countString;
    }

    this.hourTarget.innerHTML = hrString;
    this.minTarget.innerHTML = minString;
    setTimeout(this.stopWatch(hour, minute, second, count), 10);
  }
}
