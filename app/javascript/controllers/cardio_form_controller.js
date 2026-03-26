import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  add() {
    const template = document.querySelector("#cardio-template")
    const newRow = template.cloneNode(true)
    newRow.querySelectorAll("input, select").forEach(el => {
      if (el.type !== "hidden") el.value = ""
      if (el.name.includes("_destroy")) el.value = "0"
    })
    this.containerTarget.appendChild(newRow)
  }

  remove(event) {
    const field = event.target.closest(".cardio-record-fields")
    const destroyInput = field.querySelector('input[name*="_destroy"]')
    if (destroyInput) {
      destroyInput.value = "1"    // 削除フラグをセット
      field.style.display = "none" // 表示上非表示
    } else {
      field.remove() // 新規追加行は普通に削除
    }
  }
}