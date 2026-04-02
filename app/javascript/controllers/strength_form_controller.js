import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  add() {
    const template = document.querySelector("#strength-template")
    const newRow = template.innerHTML
    this.containerTarget.insertAdjacentHTML("beforeend", newRow)
  }

  remove(event) {
    const field = event.target.closest(".strength-record-fields")
    const destroyInput = field.querySelector('input[name*="_destroy"]')
    if (destroyInput) {
      destroyInput.value = "1"   // 削除フラグをセット
      field.style.display = "none" // 表示上非表示
    } else {
      // 新規追加した行は _destroy がないので普通に削除
      field.remove()
    }
  }
}
